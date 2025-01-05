### TP PowerShell : Structures Conditionnelles, Boucles et Filtres/Sélecteurs pour TSSR

---

### **Exercice 1 : Surveillance des Processus Système**

1. Listez tous les processus en cours sur la machine.
2. Filtrez et affichez uniquement les processus consommant plus de **50 Mo** de mémoire.
3. Pour chaque processus identifié, affichez son nom et sa consommation mémoire en Mo.
4. Arrêtez automatiquement les processus nommés `"notepad"` s'ils consomment plus de **100 Mo**.

---

### **Exercice 2 : Analyse et Gestion des Journaux de Sécurité**

1. Récupérez les 100 derniers événements du journal `Security`.
2. Filtrez et affichez uniquement les événements de type `Audit Failure`.
3. Comptez combien d’événements d’échec sont liés à l’utilisateur `"Administrator"`.
4. Générez un rapport CSV nommé `SecurityAuditFailures.csv` contenant :
   - La source
   - L'ID de l'événement
   - Le message
   - La date de l'événement

---

### **Exercice 3 : Gestion des Adresses IP et Ping**

1. Déclarez un tableau `$Serveurs` contenant 5 adresses IP de serveurs.
2. Pour chaque adresse IP :
   - Testez la connectivité avec **`Test-Connection`**.
   - Affichez `"Serveur actif"` si le serveur répond au ping, sinon affichez `"Serveur inactif"`.
3. Génèrez un rapport HTML `ServerStatus.html` listant :
   - L'adresse IP
   - Le statut (`Actif` ou `Inactif`)
   - Le temps de réponse moyen (en ms)

---

### **Exercice 4 : Gestion des Dossiers et Sécurité**

1. Créez un dossier `C:\TSSR_Audit` contenant 3 sous-dossiers : `Logs`, `Reports`, `Backups`.
2. Configurez les permissions NTFS pour que :
   - Les utilisateurs aient un accès en lecture seule au dossier `Logs`.
   - Les administrateurs aient un accès complet à tous les sous-dossiers.
3. Listez tous les fichiers dans ces dossiers et filtrez ceux qui n'ont pas été modifiés depuis plus de **30 jours**.
4. Supprimez ces fichiers obsolètes et générez un fichier texte `DeletedFiles.txt` contenant les noms des fichiers supprimés.

---

### **Exercice 5 : Automatisation de la Configuration Réseau**

1. Déclarez une hash table `$Interfaces` contenant des informations pour 3 interfaces réseau :
   - Nom de l'interface
   - Adresse IP
   - Masque de sous-réseau
   - Passerelle par défaut
2. Pour chaque interface :
   - Configurez l'adresse IP et le masque avec **`New-NetIPAddress`**.
   - Configurez la passerelle par défaut avec **`Set-NetIPAddress`**.
3. Affichez les informations réseau configurées pour chaque interface.

---

### **Exercice 6 : Analyse et Contrôle des Services Windows**

1. Listez tous les services Windows installés sur la machine.
2. Filtrez les services démarrés et triés par leur nom.
3. Arrêtez automatiquement les services démarrés contenant `"Test"` dans leur nom.
4. Générez un rapport CSV `RunningServices.csv` listant :
   - Le nom du service
   - Son état (`Running` ou `Stopped`)
   - Le type de démarrage (`Automatic`, `Manual`, etc.)
5. Redémarrez un service spécifique nommé `"Spooler"`.

---

### **Solutions**

---

#### **Exercice 1 : Surveillance des Processus Système**
```powershell
# Liste des processus
$Processus = Get-Process

# Filtrer les processus consommant > 50 Mo
$Processus | Where-Object { $_.WorkingSet -gt 50MB } | Select-Object Name, @{Name="Memory (MB)"; Expression={[math]::Round($_.WorkingSet / 1MB, 2)}}

# Arrêter les processus "notepad" consommant > 100 Mo
$Processus | Where-Object { $_.Name -eq "notepad" -and $_.WorkingSet -gt 100MB } | Stop-Process
```

---

#### **Exercice 2 : Analyse et Gestion des Journaux de Sécurité**
```powershell
# Récupérer les 100 derniers événements
$Events = Get-EventLog -LogName Security -Newest 100

# Filtrer les "Audit Failure"
$AuditFailures = $Events | Where-Object { $_.EntryType -eq "FailureAudit" }

# Compter les échecs liés à "Administrator"
$AuditFailures | Where-Object { $_.UserName -eq "Administrator" } | Measure-Object

# Générer un rapport CSV
$AuditFailures | Select-Object Source, EventID, Message, TimeGenerated | Export-Csv -Path "C:\TSSR\SecurityAuditFailures.csv" -NoTypeInformation
```

---

#### **Exercice 3 : Gestion des Adresses IP et Ping**
```powershell
# Déclarer les serveurs
$Serveurs = @("192.168.1.1", "192.168.1.2", "192.168.1.3", "8.8.8.8", "10.0.0.1")

# Tester la connectivité
$Resultats = $Serveurs | ForEach-Object {
    $Ping = Test-Connection -ComputerName $_ -Count 1 -Quiet
    [PSCustomObject]@{
        AdresseIP = $_
        Statut = if ($Ping) { "Actif" } else { "Inactif" }
        TempsReponse = if ($Ping) { (Test-Connection -ComputerName $_ -Count 1).ResponseTime } else { "N/A" }
    }
}

# Générer un rapport HTML
$Resultats | ConvertTo-Html -Property AdresseIP, Statut, TempsReponse | Out-File -Path "C:\TSSR\ServerStatus.html"
```

---

#### **Exercice 4 : Gestion des Dossiers et Sécurité**
```powershell
# Créer les dossiers
New-Item -Path "C:\TSSR_Audit\Logs" -ItemType Directory
New-Item -Path "C:\TSSR_Audit\Reports" -ItemType Directory
New-Item -Path "C:\TSSR_Audit\Backups" -ItemType Directory

# Configurer les permissions
icacls "C:\TSSR_Audit\Logs" /grant Users:(R)
icacls "C:\TSSR_Audit" /grant Administrators:(F)

# Supprimer les fichiers obsolètes
$DeletedFiles = Get-ChildItem -Path "C:\TSSR_Audit" -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) }
$DeletedFiles | Remove-Item
$DeletedFiles | Select-Object FullName | Out-File -FilePath "C:\TSSR_Audit\DeletedFiles.txt"
```

---

#### **Exercice 5 : Automatisation de la Configuration Réseau**
```powershell
# Déclarer les interfaces
$Interfaces = @(
    @{Nom="Ethernet0"; IP="192.168.1.10"; Masque="255.255.255.0"; Passerelle="192.168.1.1"},
    @{Nom="Ethernet1"; IP="10.0.0.10"; Masque="255.255.255.0"; Passerelle="10.0.0.1"},
    @{Nom="WiFi0"; IP="172.16.0.10"; Masque="255.255.255.0"; Passerelle="172.16.0.1"}
)

# Configurer les interfaces
$Interfaces | ForEach-Object {
    New-NetIPAddress -InterfaceAlias $_.Nom -IPAddress $_.IP -PrefixLength ($_.Masque -replace "\D", "").Length -DefaultGateway $_.Passerelle
}
```

---

#### **Exercice 6 : Analyse et Contrôle des Services Windows**
```powershell
# Liste des services
$Services = Get-Service

# Filtrer les services démarrés
$ServicesRunning = $Services | Where-Object { $_.Status -eq "Running" } | Sort-Object -Property DisplayName

# Arrêter les services contenant "Test"
$ServicesRunning | Where-Object { $_.DisplayName -like "*Test*" } | Stop-Service

# Générer un rapport CSV
$ServicesRunning | Select-Object DisplayName, Status, StartType | Export-Csv -Path "C:\TSSR\RunningServices.csv" -NoTypeInformation

# Redémarrer le service "Spooler"
Restart-Service -Name "Spooler"
``` 

Ces exercices sont conçus pour répondre aux besoins TSSR, en se concentrant sur l'analyse des systèmes, la gestion réseau, la sécurité et l'automatisation.