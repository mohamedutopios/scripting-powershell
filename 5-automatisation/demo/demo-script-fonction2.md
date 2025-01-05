Voici une série supplémentaire d'exemples PowerShell axés sur l'installation, la configuration automatique et des cas pratiques avancés, adaptés à un **TSSR**.

---

### **1. Installation Automatique de Logiciels**

#### **a. Installation d’un logiciel avec `winget`**
```powershell
# Installer Google Chrome avec winget
winget install -e --id Google.Chrome

# Installer plusieurs logiciels automatiquement
@("Google.Chrome", "Mozilla.Firefox", "Notepad++") | ForEach-Object {
    winget install -e --id $_
}
```

---

#### **b. Installation avec un fichier `.msi`**
```powershell
# Installer un logiciel à partir d'un fichier MSI
Start-Process -FilePath "C:\Installers\software.msi" -ArgumentList "/quiet /norestart" -Wait
```

---

#### **c. Installation de fonctionnalités Windows**
```powershell
# Installer une fonctionnalité (ex. IIS)
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Vérifier l'état des fonctionnalités installées
Get-WindowsFeature | Where-Object { $_.Installed -eq $true }
```

---

#### **d. Télécharger et installer un logiciel**
```powershell
# Télécharger un fichier et l'installer
$Url = "https://example.com/software.exe"
$Destination = "C:\Installers\software.exe"
Invoke-WebRequest -Uri $Url -OutFile $Destination
Start-Process -FilePath $Destination -ArgumentList "/quiet" -Wait
```

---

### **2. Configuration Automatique**

#### **a. Configurer les paramètres réseau**
```powershell
# Configurer une IP statique et un DNS
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.1.100" -PrefixLength 24 -DefaultGateway "192.168.1.1"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "8.8.8.8", "8.8.4.4"
```

---

#### **b. Activer ou désactiver le pare-feu**
```powershell
# Activer le pare-feu
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Désactiver le pare-feu
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
```

---

#### **c. Configuration automatique d’un serveur DHCP**
```powershell
# Ajouter le rôle DHCP
Install-WindowsFeature -Name DHCP -IncludeManagementTools

# Configurer une plage DHCP
Add-DhcpServerv4Scope -Name "RéseauLocal" -StartRange 192.168.1.100 -EndRange 192.168.1.200 -SubnetMask 255.255.255.0

# Ajouter une réservation
Add-DhcpServerv4Reservation -ScopeId 192.168.1.0 -IPAddress 192.168.1.101 -ClientId "00-11-22-33-44-55" -Description "Serveur1"
```

---

### **3. Automatisation de l’Installation de Rôles et Services**

#### **a. Installation et configuration d’un serveur IIS**
```powershell
# Installer IIS
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Ajouter un site Web
New-Item -Path "C:\inetpub\wwwroot\SiteWeb" -ItemType Directory
New-Website -Name "MonSiteWeb" -PhysicalPath "C:\inetpub\wwwroot\SiteWeb" -Port 80 -Force

# Tester si le site est actif
Invoke-WebRequest -Uri "http://localhost" -UseBasicParsing
```

---

#### **b. Installation d’un serveur DNS**
```powershell
# Ajouter le rôle DNS
Install-WindowsFeature -Name DNS -IncludeManagementTools

# Ajouter une zone DNS
Add-DnsServerPrimaryZone -Name "exemple.local" -ZoneFile "exemple.local.dns"

# Ajouter un enregistrement A
Add-DnsServerResourceRecordA -Name "Serveur1" -ZoneName "exemple.local" -IPv4Address "192.168.1.10"
```

---

### **4. Gestion des Postes Clients**

#### **a. Modifier le fichier hosts**
```powershell
# Ajouter une entrée au fichier hosts
$HostsFile = "C:\Windows\System32\drivers\etc\hosts"
"192.168.1.10 Serveur1" | Out-File -FilePath $HostsFile -Append
```

---

#### **b. Configurer les paramètres régionaux**
```powershell
# Modifier le fuseau horaire
Set-TimeZone -Name "W. Europe Standard Time"

# Configurer le format de date et d'heure
Set-Culture -Name "fr-FR"
Set-WinUILanguageOverride -Language "fr-FR"
```

---

#### **c. Désactiver les mises à jour automatiques**
```powershell
# Désactiver Windows Update
Set-Service -Name wuauserv -StartupType Disabled
Stop-Service -Name wuauserv
```

---

### **5. Scripts Avancés d’Automatisation**

#### **a. Déploiement de logiciels sur plusieurs machines**
```powershell
# Liste des machines et logiciels à installer
$Machines = @("PC1", "PC2", "PC3")
$Logiciel = "\\Serveur\Installers\logiciel.exe"

# Déploiement
foreach ($Machine in $Machines) {
    Invoke-Command -ComputerName $Machine -ScriptBlock {
        Start-Process -FilePath "\\Serveur\Installers\logiciel.exe" -ArgumentList "/quiet" -Wait
    }
}
```

---

#### **b. Script de sauvegarde automatisée**
```powershell
# Script : Sauvegarde.ps1
param(
    [string]$Source = "C:\Dossiers",
    [string]$Destination = "E:\Sauvegardes"
)

try {
    if (-Not (Test-Path $Source)) { throw "Le dossier source n'existe pas." }
    if (-Not (Test-Path $Destination)) { New-Item -Path $Destination -ItemType Directory }

    # Copier les fichiers
    Copy-Item -Path $Source\* -Destination $Destination -Recurse -Force
    Write-Output "Sauvegarde terminée."
} catch {
    Write-Error "Erreur : $_"
}
```

---

#### **c. Surveillance et notification en cas de panne**
```powershell
# Surveiller un service et notifier en cas de panne
function SurveillerService {
    param(
        [string]$NomService,
        [string]$Email = "admin@example.com"
    )

    while ($true) {
        $Service = Get-Service -Name $NomService
        if ($Service.Status -ne "Running") {
            Send-MailMessage -From "monitor@example.com" -To $Email -Subject "Service $NomService arrêté" -Body "Le service $NomService est en panne." -SmtpServer "smtp.example.com"
            Start-Service -Name $NomService
        }
        Start-Sleep -Seconds 60
    }
}

# Lancer la surveillance
SurveillerService -NomService "Spooler"
```

---

### **6. Déploiement et Configuration de Serveurs**

#### **a. Création et Configuration d’un Serveur Web**
```powershell
# Installer IIS et configurer un site
Install-WindowsFeature -Name Web-Server -IncludeManagementTools
New-Website -Name "Exemple" -PhysicalPath "C:\Sites\Exemple" -Port 8080
```

---

#### **b. Script d’initialisation d’un serveur**
```powershell
# Script d’initialisation
param(
    [string]$NomServeur,
    [string]$AdresseIP,
    [string]$Passerelle
)

# Modifier le nom du serveur
Rename-Computer -NewName $NomServeur -Restart

# Configurer l'adresse IP
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress $AdresseIP -PrefixLength 24 -DefaultGateway $Passerelle
```

---

### **Conclusion**
Ces exemples montrent comment automatiser des tâches courantes telles que l'installation de logiciels, la configuration réseau, et la gestion des services. Ces scripts sont particulièrement utiles pour un TSSR qui souhaite centraliser et standardiser les opérations d'administration. Si vous avez besoin d’exemples plus ciblés ou adaptés à un scénario particulier, faites-le-moi savoir !