Voici plusieurs **scripts PowerShell complets** couvrant la **planification des tâches**, l'**analyse des journaux**, et la **génération de rapports**.

---

### **1. Planification d'une Tâche : Sauvegarde Quotidienne**

#### Script : `PlanificationSauvegarde.ps1`
```powershell
# Nom de la tâche
$TaskName = "SauvegardeQuotidienne"

# Définir le déclencheur (quotidien à 22h)
$Trigger = New-ScheduledTaskTrigger -Daily -At "22:00"

# Définir l'action (exécution d'un script de sauvegarde)
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\Sauvegarde.ps1"

# Enregistrer la tâche planifiée
try {
    Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action -Description "Sauvegarde automatique quotidienne"
    Write-Output "Tâche $TaskName créée avec succès."
} catch {
    Write-Error "Erreur lors de la création de la tâche : $_"
}
```

---

### **2. Analyse des Journaux d'Événements**

#### Script : `AnalyseEvenements.ps1`
```powershell
# Fichier de rapport
$Rapport = "C:\Rapports\EvenementsSysteme.csv"

# Récupérer les 50 derniers événements système
try {
    $Evenements = Get-EventLog -LogName System -Newest 50
    $Evenements | Export-Csv -Path $Rapport -NoTypeInformation
    Write-Output "Rapport des événements système généré : $Rapport"
} catch {
    Write-Error "Erreur lors de la récupération des événements : $_"
}
```

---

### **3. Génération de Rapports HTML : Services Arrêtés**

#### Script : `RapportServicesArretes.ps1`
```powershell
# Fichier HTML pour le rapport
$RapportHTML = "C:\Rapports\ServicesArretes.html"

# Récupérer les services arrêtés
try {
    $ServicesArretes = Get-Service | Where-Object { $_.Status -eq "Stopped" }
    $ServicesArretes | ConvertTo-Html -Property Name, DisplayName, Status -Title "Services Arrêtés" | Out-File -FilePath $RapportHTML
    Write-Output "Rapport HTML des services arrêtés généré : $RapportHTML"
} catch {
    Write-Error "Erreur lors de la génération du rapport : $_"
}
```

---

### **4. Surveillance Temps Réel : Espace Disque**

#### Script : `SurveillanceEspaceDisque.ps1`
```powershell
# Seuil d'alerte en GB
$Seuil = 5

# Surveillance en boucle
while ($true) {
    try {
        # Récupérer les disques avec espace insuffisant
        $Disques = Get-PSDrive -PSProvider FileSystem | Where-Object { ($_.Free / 1GB) -lt $Seuil }
        
        if ($Disques.Count -gt 0) {
            foreach ($Disque in $Disques) {
                Write-Output "Alerte : L'espace libre sur $($Disque.Name) est inférieur à $Seuil GB."
            }
        } else {
            Write-Output "Tous les disques ont suffisamment d'espace."
        }
    } catch {
        Write-Error "Erreur lors de la surveillance : $_"
    }

    # Attendre 60 secondes avant de réévaluer
    Start-Sleep -Seconds 60
}
```

---

### **5. Automatisation : Rapport des Processus Gourmands**

#### Script : `RapportProcessus.ps1`
```powershell
# Fichier de rapport
$RapportCSV = "C:\Rapports\TopProcesses.csv"

# Récupérer les 10 processus les plus gourmands en mémoire
try {
    $Processus = Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 10
    $Processus | Export-Csv -Path $RapportCSV -NoTypeInformation
    Write-Output "Rapport des processus généré : $RapportCSV"
} catch {
    Write-Error "Erreur lors de la génération du rapport : $_"
}
```

---

### **6. Surveillance et Notification : Service Arrêté**

#### Script : `SurveillanceService.ps1`
```powershell
# Nom du service à surveiller
$NomService = "Spooler"

# Surveillance
while ($true) {
    try {
        $Service = Get-Service -Name $NomService

        if ($Service.Status -ne "Running") {
            Write-Output "Alerte : Le service $NomService est arrêté."
            # Optionnel : Envoi d'une notification par mail
            Send-MailMessage -From "monitor@example.com" -To "admin@example.com" -Subject "Service $NomService arrêté" `
                -Body "Le service $NomService est hors service et doit être redémarré." -SmtpServer "smtp.example.com"
            
            # Tenter de redémarrer le service
            Start-Service -Name $NomService
            Write-Output "Service $NomService redémarré."
        } else {
            Write-Output "Le service $NomService fonctionne correctement."
        }
    } catch {
        Write-Error "Erreur lors de la surveillance du service : $_"
    }

    # Vérifier toutes les 30 secondes
    Start-Sleep -Seconds 30
}
```

---

### **7. Rapport Planifié : Événements Système**

#### Script : `RapportEvenementsSysteme.ps1`
```powershell
# Fichier de rapport
$RapportHTML = "C:\Rapports\EvenementsSysteme.html"

try {
    # Récupérer les 20 derniers événements système
    $Evenements = Get-EventLog -LogName System -Newest 20

    # Générer un rapport HTML
    $Evenements | ConvertTo-Html -Property EntryType, Source, TimeGenerated, Message -Title "Rapport des Événements Système" | Out-File -FilePath $RapportHTML

    Write-Output "Rapport HTML des événements système généré : $RapportHTML"
} catch {
    Write-Error "Erreur lors de la génération du rapport : $_"
}
```

---

### **Utilisation des Scripts**

1. **Enregistrer les scripts dans un fichier `.ps1`** :
   - Exemple : `C:\Scripts\PlanificationSauvegarde.ps1`.

2. **Exécuter les scripts depuis PowerShell** :
   ```powershell
   PowerShell.exe -File C:\Scripts\PlanificationSauvegarde.ps1
   ```

3. **Automatiser les scripts avec une tâche planifiée** :
   - Utiliser le script de planification présenté ci-dessus.

---

### **Conclusion**
Ces scripts offrent des solutions robustes pour gérer la planification, l'analyse des journaux, et la génération de rapports. Ils peuvent être adaptés à divers scénarios et intégrés dans un environnement d'administration système. Si vous avez besoin d'ajustements ou de cas spécifiques, n'hésitez pas à demander !