### **Planification des Tâches, Analyse des Journaux et Génération de Rapports avec PowerShell**

---

### **1. Planification des Tâches avec PowerShell**

PowerShell permet de créer, configurer et gérer des tâches planifiées à l’aide des cmdlets associées au module **ScheduledTasks**.

#### **a. Création d’une tâche planifiée**

##### **Cmdlet : `New-ScheduledTask` et `Register-ScheduledTask`**
- `New-ScheduledTask` définit une tâche planifiée.
- `Register-ScheduledTask` enregistre la tâche pour qu’elle s’exécute automatiquement.

##### **Syntaxe :**
```powershell
$Trigger = New-ScheduledTaskTrigger -Daily -At "08:00AM"
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\MonScript.ps1"
Register-ScheduledTask -TaskName "MaTache" -Trigger $Trigger -Action $Action -Description "Exemple de tâche planifiée"
```

##### **Exemple complet :**
```powershell
# Définir le déclencheur (tâche quotidienne à 8h)
$Trigger = New-ScheduledTaskTrigger -Daily -At "08:00AM"

# Définir l’action (exécution d’un script PowerShell)
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\Backup.ps1"

# Enregistrer la tâche planifiée
Register-ScheduledTask -TaskName "BackupJournalier" -Trigger $Trigger -Action $Action -Description "Tâche de sauvegarde quotidienne"
```

---

#### **b. Modifier une tâche existante**

##### **Cmdlet : `Set-ScheduledTask`**
- Permet de modifier les propriétés d’une tâche existante.

##### **Exemple :**
```powershell
Set-ScheduledTask -TaskName "BackupJournalier" -Trigger (New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At "06:00AM")
```

---

#### **c. Lister les tâches planifiées**

##### **Cmdlet : `Get-ScheduledTask`**
- Liste toutes les tâches planifiées.

##### **Exemple :**
```powershell
Get-ScheduledTask | Where-Object { $_.TaskName -like "*Backup*" }
```

---

#### **d. Supprimer une tâche planifiée**

##### **Cmdlet : `Unregister-ScheduledTask`**
- Supprime une tâche planifiée.

##### **Exemple :**
```powershell
Unregister-ScheduledTask -TaskName "BackupJournalier" -Confirm:$false
```

---

### **2. Lecture et Analyse des Journaux d'Événements Windows**

Les journaux d'événements Windows sont une source précieuse pour diagnostiquer des problèmes ou surveiller des systèmes.

#### **a. Cmdlet : `Get-EventLog`**
- Utilisée pour lire les journaux d'événements traditionnels (applications, sécurité, système).

##### **Syntaxe :**
```powershell
Get-EventLog -LogName <NomJournal> [-Newest <Nombre>] [-EntryType <Type>]
```

##### **Exemple :**
1. **Lister les 10 dernières entrées du journal système :**
   ```powershell
   Get-EventLog -LogName System -Newest 10
   ```

2. **Filtrer les erreurs dans le journal application :**
   ```powershell
   Get-EventLog -LogName Application -EntryType Error
   ```

3. **Exporter le journal système dans un fichier CSV :**
   ```powershell
   Get-EventLog -LogName System -Newest 50 | Export-Csv -Path C:\Logs\SystemEvents.csv -NoTypeInformation
   ```

---

#### **b. Cmdlet : `Get-WinEvent`**
- Recommandée pour lire les journaux d'événements modernes (plus flexible que `Get-EventLog`).

##### **Syntaxe :**
```powershell
Get-WinEvent -LogName <NomJournal> [-MaxEvents <Nombre>] [-FilterHashTable <Filtres>]
```

##### **Exemple :**
1. **Lister les événements récents du journal Sécurité :**
   ```powershell
   Get-WinEvent -LogName Security -MaxEvents 10
   ```

2. **Filtrer par ID d'événement :**
   ```powershell
   Get-WinEvent -LogName Application | Where-Object { $_.Id -eq 1000 }
   ```

3. **Filtrer par date :**
   ```powershell
   Get-WinEvent -LogName System -FilterHashtable @{StartTime="2024-12-01"; EndTime="2024-12-31"}
   ```

---

### **3. Génération de Rapports Automatisés**

PowerShell permet de générer des rapports dans des formats comme CSV ou HTML pour une analyse visuelle.

---

#### **a. Génération de rapports CSV**

##### **Cmdlet : `Export-Csv`**
- Convertit une sortie en fichier CSV.

##### **Exemple :**
1. **Exporter la liste des services en cours d’exécution :**
   ```powershell
   Get-Service | Where-Object { $_.Status -eq "Running" } | Export-Csv -Path C:\Rapports\ServicesRunning.csv -NoTypeInformation
   ```

2. **Exporter les 10 processus les plus gourmands en mémoire :**
   ```powershell
   Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 10 | Export-Csv -Path C:\Rapports\TopMemoryProcesses.csv -NoTypeInformation
   ```

---

#### **b. Génération de rapports HTML**

##### **Cmdlet : `ConvertTo-Html`**
- Convertit une sortie en tableau HTML.

##### **Exemple :**
1. **Créer un rapport HTML des 5 derniers fichiers modifiés :**
   ```powershell
   Get-ChildItem -Path C:\Dossiers -Recurse | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 5 | ConvertTo-Html -Property Name, LastWriteTime, Length -Title "Derniers Fichiers Modifiés" | Out-File -FilePath C:\Rapports\FichiersRecents.html
   ```

2. **Rapport des événements système :**
   ```powershell
   Get-EventLog -LogName System -Newest 20 | ConvertTo-Html -Property EntryType, Source, TimeGenerated, Message -Title "Rapport des Événements Système" | Out-File -FilePath C:\Rapports\SystemEvents.html
   ```

---

#### **c. Génération automatique avec un script**

##### **Exemple de script pour un rapport journalier :**
```powershell
# Chemin du rapport
$RapportHTML = "C:\Rapports\RapportSysteme.html"

# Récupérer les événements récents
$Evenements = Get-EventLog -LogName System -Newest 50

# Générer un rapport HTML
$Evenements | ConvertTo-Html -Property EntryType, Source, TimeGenerated, Message -Title "Rapport Système Journalier" | Out-File -FilePath $RapportHTML

Write-Output "Rapport généré : $RapportHTML"
```

---

### **Résumé des Cmdlets**

| Tâche                             | Cmdlet                      | Description                                           |
|-----------------------------------|-----------------------------|-------------------------------------------------------|
| **Planification des tâches**      | `New-ScheduledTask`, `Register-ScheduledTask`, `Set-ScheduledTask` | Création et modification des tâches planifiées.       |
| **Journaux d'événements**         | `Get-EventLog`, `Get-WinEvent` | Lecture et filtrage des journaux d’événements.        |
| **Génération de rapports (CSV)**  | `Export-Csv`                | Export des données structurées en fichier CSV.        |
| **Génération de rapports (HTML)** | `ConvertTo-Html`            | Conversion des données en tableaux HTML.              |

---

### **Conclusion**
PowerShell simplifie la planification des tâches, l’analyse des journaux et la génération de rapports. Ces fonctionnalités permettent d’automatiser des tâches répétitives et de fournir des informations claires pour le diagnostic ou l’audit. En combinant ces outils, vous pouvez créer des solutions robustes pour la gestion système.