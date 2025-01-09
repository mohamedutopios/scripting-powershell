Voici une série supplémentaire de démonstrations et de cas pratiques axés sur les besoins d’un **Technicien Supérieur en Systèmes et Réseaux** (TSSR). Ces exemples couvrent des tâches d’administration système, de gestion réseau, de sécurité, et d’automatisation.

---

### **1. Gestion Réseau**

#### **a. Tester la connectivité avec `Test-Connection`**
```powershell
# Tester la connectivité vers un hôte distant
Test-Connection -ComputerName google.com -Count 4

# Tester plusieurs hôtes
@("google.com", "yahoo.com", "microsoft.com") | ForEach-Object {
    Test-Connection -ComputerName $_ -Count 2
}
```

---

#### **b. Récupérer des informations sur les adaptateurs réseau**
```powershell
# Liste des adaptateurs réseau actifs
Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

# Obtenir les détails d’une configuration IP
Get-NetIPAddress | Format-Table InterfaceAlias,IPAddress,PrefixLength,DefaultGateway
```

---

#### **c. Configurer une adresse IP statique**
```powershell
# Configurer une adresse IP, un masque, et une passerelle
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.1.100" -PrefixLength 24 -DefaultGateway "192.168.1.1"

# Configurer un serveur DNS
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "8.8.8.8", "8.8.4.4"
```

---

### **2. Surveillance et Monitoring**

#### **a. Surveiller l’utilisation CPU**
```powershell
# Processus utilisant plus de 10% de CPU
Get-Process | Where-Object { $_.CPU -gt 10 } | Select-Object Name, CPU
```

---

#### **b. Générer un rapport sur l’utilisation disque**
```powershell
# Récupérer l’espace disque
Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free, @{Name="FreeGB";Expression={($_.Free/1GB -as [int])}}

# Exporter en CSV
Get-PSDrive -PSProvider FileSystem | Export-Csv -Path "C:\Rapports\EspaceDisque.csv" -NoTypeInformation
```

---

#### **c. Script de surveillance temps réel**
```powershell
# Surveiller l’espace disque toutes les 10 secondes
while ($true) {
    Get-PSDrive -PSProvider FileSystem | Format-Table Name, Used, Free
    Start-Sleep -Seconds 10
}
```

---

### **3. Gestion des Services et Processus**

#### **a. Vérifier si un service est actif**
```powershell
# Vérifier l'état d'un service
Get-Service -Name "Spooler"

# Surveiller plusieurs services
@("W32Time", "Spooler", "Dhcp") | ForEach-Object {
    Get-Service -Name $_
}
```

---

#### **b. Script pour redémarrer un service**
```powershell
function RedemarrerService {
    param(
        [string]$NomService
    )
    try {
        Restart-Service -Name $NomService -Force
        Write-Output "Le service $NomService a été redémarré avec succès."
    } catch {
        Write-Error "Erreur : Impossible de redémarrer le service $NomService"
    }
}

RedemarrerService -NomService "Spooler"
```

---

#### **c. Créer un script pour tuer les processus inutiles**
```powershell
# Arrêter tous les processus inutiles
@("notepad", "calc", "winword") | ForEach-Object {
    Stop-Process -Name $_ -Force -ErrorAction SilentlyContinue
    Write-Output "Processus $_ arrêté."
}
```

---

### **4. Sécurité et Gestion des Droits**

#### **a. Scanner les ports ouverts sur une machine locale**
```powershell
# Lister les ports ouverts
Get-NetTCPConnection | Where-Object { $_.State -eq "Listen" } | Select-Object LocalAddress, LocalPort, State
```

---

#### **b. Ajouter un utilisateur à un groupe local**
```powershell
# Ajouter un utilisateur au groupe Administrateurs
Add-LocalGroupMember -Group "Administrators" -Member "TestUser"
```

---

#### **c. Créer un script de sauvegarde avec gestion des permissions**
```powershell
param(
    [string]$Source = "C:\Source",
    [string]$Destination = "C:\Backups",
    [string]$Utilisateur = "BackupUser"
)

try {
    # Vérifier les dossiers
    if (-Not (Test-Path $Source)) { throw "Le dossier source $Source n'existe pas." }
    if (-Not (Test-Path $Destination)) { New-Item -Path $Destination -ItemType Directory }

    # Copier les fichiers
    Copy-Item -Path $Source\* -Destination $Destination -Recurse

    # Modifier les permissions
    $Acl = Get-Acl -Path $Destination
    $Rule = New-Object System.Security.AccessControl.FileSystemAccessRule($Utilisateur, "FullControl", "Allow")
    $Acl.SetAccessRule($Rule)
    Set-Acl -Path $Destination -AclObject $Acl

    Write-Output "Sauvegarde et permissions configurées avec succès."
} catch {
    Write-Error "Erreur : $_"
}
```

---

### **5. Automatisation des Tâches avec `Task Scheduler`**

#### **a. Créer une tâche planifiée pour exécuter un script**
```powershell
# Exemple : planifier l'exécution d'un script chaque jour à 10h
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\Scripts\Maintenance.ps1"
$Trigger = New-ScheduledTaskTrigger -Daily -At "10:00AM"
$Principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount
Register-ScheduledTask -TaskName "MaintenanceQuotidienne" -Action $Action -Trigger $Trigger -Principal $Principal
```

---

#### **b. Lister les tâches planifiées**
```powershell
# Obtenir les tâches planifiées
Get-ScheduledTask | Select-Object TaskName, State, LastRunTime
```

---

#### **c. Supprimer une tâche planifiée**
```powershell
# Supprimer une tâche
Unregister-ScheduledTask -TaskName "MaintenanceQuotidienne" -Confirm:$false
```

---

### **6. Gestion de l’Active Directory**

#### **a. Vérifier les utilisateurs désactivés**
```powershell
# Lister les utilisateurs désactivés dans le domaine
Get-ADUser -Filter {Enabled -eq $false} | Select-Object Name, SamAccountName
```

---

#### **b. Ajouter en masse des utilisateurs à un groupe**
```powershell
# Ajouter une liste d’utilisateurs au groupe "ITTeam"
$Users = @("user1", "user2", "user3")
Add-ADGroupMember -Identity "ITTeam" -Members $Users
```

---

#### **c. Supprimer des utilisateurs inactifs**
```powershell
# Supprimer les utilisateurs qui n'ont pas été actifs depuis 90 jours
$UtilisateursInactifs = Get-ADUser -Filter * -Properties LastLogonDate | Where-Object {
    $_.LastLogonDate -lt (Get-Date).AddDays(-90)
}
$UtilisateursInactifs | ForEach-Object {
    Remove-ADUser -Identity $_.SamAccountName -Confirm:$false
    Write-Output "Utilisateur $_ supprimé."
}
```

---

### **7. Gestion Avancée des Logs**

#### **a. Lire et analyser les logs système**
```powershell
# Lire les 20 derniers événements dans le journal Système
Get-EventLog -LogName System -Newest 20 | Format-Table EventID, Source, Message
```

---

#### **b. Filtrer les erreurs critiques**
```powershell
# Filtrer les erreurs dans le journal Application
Get-EventLog -LogName Application | Where-Object { $_.EntryType -eq "Error" } | Select-Object TimeGenerated, Source, Message
```

---

#### **c. Exporter un rapport des logs**
```powershell
# Exporter les événements critiques en CSV
Get-EventLog -LogName System | Where-Object { $_.EntryType -eq "Error" } | Export-Csv -Path "C:\Logs\RapportErreurs.csv" -NoTypeInformation
```

---

### **Conclusion**
Ces exemples couvrent des tâches essentielles et avancées pour un TSSR, comme la gestion réseau, les services, les utilisateurs, et la sécurité. Ils peuvent être utilisés comme base pour créer des solutions robustes adaptées à des besoins spécifiques. Si vous souhaitez des cas encore plus approfondis, faites-le-moi savoir !