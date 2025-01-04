

Voici quelques exemples de scripts PowerShell paramétrables adaptés à des tâches qu'un Technicien Supérieur en Systèmes et Réseaux (TSSR) pourrait rencontrer :

---

### 1. **Création d'utilisateurs dans Active Directory**
Ce script permet d'ajouter des utilisateurs dans une organisation via Active Directory.

```powershell
param (
    [Parameter(Mandatory)]
    [string]$CSVFilePath
)

Import-Module ActiveDirectory

if (Test-Path $CSVFilePath) {
    $users = Import-Csv $CSVFilePath
    foreach ($user in $users) {
        New-ADUser -Name $user.Name `
                   -GivenName $user.FirstName `
                   -Surname $user.LastName `
                   -SamAccountName $user.SamAccountName `
                   -UserPrincipalName $user.Email `
                   -EmailAddress $user.Email `
                   -Path $user.OU `
                   -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) `
                   -Enabled $true
        Write-Host "Utilisateur $($user.Name) ajouté avec succès."
    }
} else {
    Write-Host "Le fichier CSV spécifié n'existe pas."
}
```

**Utilisation :**
- Fournir un fichier CSV avec les colonnes : `Name, FirstName, LastName, SamAccountName, Email, OU, Password`.

---

### 2. **Surveillance de l'espace disque**
Ce script vérifie les espaces disques sur un ensemble de serveurs.

```powershell
param (
    [Parameter(Mandatory)]
    [string[]]$Servers,
    [int]$Threshold = 20
)

foreach ($server in $Servers) {
    $drives = Get-WmiObject -ComputerName $server -Class Win32_LogicalDisk -Filter "DriveType=3"
    foreach ($drive in $drives) {
        $freeSpacePercent = ($drive.FreeSpace / $drive.Size) * 100
        if ($freeSpacePercent -lt $Threshold) {
            Write-Host "Alerte : Le serveur $server, disque $($drive.DeviceID) a moins de $Threshold% d'espace libre." -ForegroundColor Red
        } else {
            Write-Host "Serveur $server, disque $($drive.DeviceID) est OK avec $([math]::round($freeSpacePercent, 2))% d'espace libre." -ForegroundColor Green
        }
    }
}
```

**Utilisation :**
```powershell
.\DiskCheck.ps1 -Servers "Server1", "Server2" -Threshold 10
```

---

### 3. **Audit des comptes inactifs**
Ce script détecte les comptes inactifs dans Active Directory.

```powershell
param (
    [Parameter(Mandatory)]
    [int]$DaysInactive = 30,
    [string]$ExportPath = "InactiveUsers.csv"
)

Import-Module ActiveDirectory

$inactiveUsers = Get-ADUser -Filter {LastLogonDate -lt (Get-Date).AddDays(-$DaysInactive)} -Properties LastLogonDate
$inactiveUsers | Select-Object Name, SamAccountName, LastLogonDate | Export-Csv -Path $ExportPath -NoTypeInformation

Write-Host "Audit terminé. Résultats exportés vers $ExportPath."
```

**Utilisation :**
```powershell
.\InactiveAccounts.ps1 -DaysInactive 90 -ExportPath "C:\Audit\InactiveUsers.csv"
```

---

### 4. **Déploiement d'une application sur des machines distantes**
Ce script copie un fichier et exécute un script d'installation sur des postes.

```powershell
param (
    [Parameter(Mandatory)]
    [string[]]$Computers,
    [Parameter(Mandatory)]
    [string]$InstallerPath,
    [Parameter(Mandatory)]
    [string]$DestinationPath,
    [string]$InstallCommand = "setup.exe /silent"
)

foreach ($computer in $Computers) {
    Write-Host "Déploiement sur $computer..."
    Copy-Item -Path $InstallerPath -Destination "\\$computer\$DestinationPath" -Force
    Invoke-Command -ComputerName $computer -ScriptBlock {
        Start-Process -FilePath "$using:DestinationPath\$using:InstallCommand" -Wait
    }
    Write-Host "Déploiement terminé sur $computer."
}
```

**Utilisation :**
```powershell
.\DeployApp.ps1 -Computers "PC1", "PC2" -InstallerPath "C:\Installers\app.exe" -DestinationPath "C$\Temp" -InstallCommand "app.exe /silent"
```

---

### 5. **Récupération des adresses IP des machines dans un réseau**
Ce script scanne un réseau pour récupérer les IPs des machines actives.

```powershell
param (
    [Parameter(Mandatory)]
    [string]$Subnet
)

1..254 | ForEach-Object {
    $ip = "$Subnet.$_"
    if (Test-Connection -ComputerName $ip -Count 1 -Quiet) {
        Write-Host "$ip est actif." -ForegroundColor Green
    } else {
        Write-Host "$ip est inactif." -ForegroundColor Red
    }
}
```

**Utilisation :**
```powershell
.\NetworkScan.ps1 -Subnet "192.168.1"
```

---

### 6. **Redémarrage de services spécifiques sur un ensemble de serveurs**
Ce script redémarre un service précis sur une liste de serveurs.

```powershell
param (
    [Parameter(Mandatory)]
    [string[]]$Servers,
    [Parameter(Mandatory)]
    [string]$ServiceName
)

foreach ($server in $Servers) {
    Write-Host "Redémarrage du service $ServiceName sur $server..."
    Invoke-Command -ComputerName $server -ScriptBlock {
        Restart-Service -Name $using:ServiceName -Force
    }
    Write-Host "Service $ServiceName redémarré sur $server."
}
```

**Utilisation :**
```powershell
.\RestartService.ps1 -Servers "Server1", "Server2" -ServiceName "Spooler"
```

---

Ces scripts peuvent être adaptés en fonction des besoins spécifiques. Voulez-vous approfondir l'un d'entre eux ou les personnaliser davantage ?