### Démonstration complète : **Gestion des Processus Windows avec PowerShell**

---

### **1. Lister et Surveiller les Processus**

#### **a. Lister tous les processus**
```powershell
# Obtenir la liste des processus en cours d'exécution
Get-Process
```

#### **b. Filtrer par nom**
```powershell
# Afficher les processus spécifiques (ex. notepad)
Get-Process -Name notepad
```

#### **c. Trier les processus par consommation CPU**
```powershell
# Lister les processus avec le plus d'utilisation CPU
Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 10
```

#### **d. Rechercher des processus par mémoire utilisée**
```powershell
# Afficher les processus consommant plus de 100 Mo
Get-Process | Where-Object { $_.WorkingSet -gt 100MB }
```

---

### **2. Terminer des Processus**

#### **a. Terminer un processus par nom**
```powershell
# Terminer tous les processus "notepad"
Stop-Process -Name notepad
```

#### **b. Terminer un processus par ID**
```powershell
# Terminer un processus en utilisant son ID
Stop-Process -Id 1234
```

#### **c. Forcer l’arrêt d’un processus**
```powershell
# Forcer la fermeture d'un processus (ex. blocage)
Stop-Process -Name notepad -Force
```

---

### **3. Lancer un Nouveau Processus**

#### **a. Lancer une application**
```powershell
# Ouvrir le Bloc-notes
Start-Process -FilePath "notepad.exe"
```

#### **b. Ouvrir un fichier avec l'application par défaut**
```powershell
# Ouvrir un document texte
Start-Process -FilePath "C:\Users\Username\Documents\example.txt"
```

#### **c. Lancer une commande avec arguments**
```powershell
# Exécuter une commande cmd avec des arguments
Start-Process -FilePath "cmd.exe" -ArgumentList "/C dir" -NoNewWindow
```

#### **d. Attendre la fin d’un processus**
```powershell
# Ouvrir un fichier et attendre la fermeture
Start-Process -FilePath "notepad.exe" -ArgumentList "C:\example.txt" -Wait
```

---

### **4. Surveillance en Temps Réel**

#### **a. Processus les plus gourmands**
```powershell
# Lister les processus avec leur utilisation CPU et mémoire en temps réel
while ($true) {
    Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 5
    Start-Sleep -Seconds 5
}
```

#### **b. Notifier si un processus dépasse un seuil**
```powershell
# Alerter si un processus dépasse une certaine utilisation CPU
$Threshold = 10
Get-Process | Where-Object { $_.CPU -gt $Threshold } | ForEach-Object {
    Write-Output "Alerte : $($_.Name) utilise $($_.CPU) % CPU"
}
```

---

### **5. Gestion Avancée des Services**

#### **a. Lister tous les services**
```powershell
# Afficher tous les services Windows
Get-Service
```

#### **b. Filtrer les services en cours d’exécution**
```powershell
# Lister les services qui sont actuellement actifs
Get-Service | Where-Object { $_.Status -eq "Running" }
```

#### **c. Lister les services arrêtés**
```powershell
# Afficher uniquement les services arrêtés
Get-Service | Where-Object { $_.Status -eq "Stopped" }
```

#### **d. Démarrer un service**
```powershell
# Démarrer un service (ex. le service de temps)
Start-Service -Name W32Time
```

#### **e. Arrêter un service**
```powershell
# Arrêter le service d'impression
Stop-Service -Name Spooler
```

#### **f. Redémarrer un service**
```powershell
# Redémarrer un service (ex. Spooler)
Restart-Service -Name Spooler
```

#### **g. Contrôler un service distant**
```powershell
# Obtenir le statut d'un service sur un serveur distant
Get-Service -ComputerName "Serveur01" -Name W32Time

# Démarrer le service sur une machine distante
Start-Service -ComputerName "Serveur01" -Name W32Time
```

---

### **6. Scénarios Avancés**

#### **a. Générer un rapport des processus gourmands**
```powershell
# Lister les processus les plus consommateurs de mémoire et CPU
$Rapport = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 10
$Rapport | Export-Csv -Path "C:\Rapport_Processus.csv" -NoTypeInformation
```

#### **b. Redémarrer tous les services arrêtés**
```powershell
# Redémarrer tous les services qui sont en statut "Stopped"
Get-Service | Where-Object { $_.Status -eq "Stopped" } | ForEach-Object {
    Start-Service -Name $_.Name
}
```

#### **c. Surveillance continue d’un service**
```powershell
# Surveiller si un service spécifique est actif
while ($true) {
    $Service = Get-Service -Name W32Time
    if ($Service.Status -ne "Running") {
        Write-Output "Service W32Time est arrêté !"
    }
    Start-Sleep -Seconds 10
}
```

---

### **Résumé des Cmdlets Utilisées**

| Cmdlet              | Description                                   |
|---------------------|-----------------------------------------------|
| `Get-Process`       | Liste les processus en cours d’exécution.     |
| `Stop-Process`      | Termine un processus actif.                   |
| `Start-Process`     | Lancer une nouvelle application ou commande.  |
| `Get-Service`       | Obtenir la liste des services système.        |
| `Start-Service`     | Démarrer un service.                          |
| `Stop-Service`      | Arrêter un service en cours d’exécution.      |
| `Restart-Service`   | Redémarrer un service.                        |

---

### **Conclusion**
PowerShell fournit une interface puissante pour la gestion des processus et services sur Windows. Avec ces cmdlets, il est facile d'automatiser la surveillance, le contrôle et l'interaction avec les processus système et services pour des besoins administratifs avancés. Si vous souhaitez approfondir une fonctionnalité ou un scénario spécifique, je peux fournir des exemples personnalisés.