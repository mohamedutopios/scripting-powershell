# Définir les variables
$mysqlServiceName = "MySQL80" # Nom du service MySQL (ajustez en fonction de votre installation)
$mysqlInstallerUrl = "https://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-web-community-8.0.34.0.msi" # URL pour télécharger MySQL Installer
$mysqlInstallerPath = "C:\Temp\mysql-installer.msi" # Chemin pour télécharger le fichier MSI
$mysqlInstallPath = "C:\Program Files\MySQL\MySQL Server 8.0"

# Fonction pour vérifier si MySQL est installé
function Is-MySQLInstalled {
    Test-Path $mysqlInstallPath
}

# Fonction pour vérifier si le service MySQL est en cours d'exécution
function Is-MySQLRunning {
    $service = Get-Service -Name $mysqlServiceName -ErrorAction SilentlyContinue
    return ($service -and $service.Status -eq "Running")
}

# Fonction pour démarrer le service MySQL
function Start-MySQLService {
    Write-Output "Démarrage du service MySQL..."
    Start-Service -Name $mysqlServiceName -ErrorAction SilentlyContinue
    if (Is-MySQLRunning) {
        Write-Output "Le service MySQL a démarré avec succès."
    } else {
        Write-Output "Impossible de démarrer le service MySQL."
    }
}

# Fonction pour installer MySQL
function Install-MySQL {
    Write-Output "Téléchargement de l'installateur MySQL..."
    if (!(Test-Path -Path "C:\Temp")) {
        New-Item -ItemType Directory -Path "C:\Temp"
    }
    Invoke-WebRequest -Uri $mysqlInstallerUrl -OutFile $mysqlInstallerPath
    Write-Output "Téléchargement terminé. Lancement de l'installation..."
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$mysqlInstallerPath`" /quiet" -Wait
    Write-Output "Installation de MySQL terminée."
}

# Vérification de l'état de MySQL
if (Is-MySQLInstalled) {
    Write-Output "MySQL est installé sur cette machine."
    if (Is-MySQLRunning) {
        Write-Output "Le service MySQL est déjà en cours d'exécution."
    } else {
        Write-Output "Le service MySQL est installé mais pas en cours d'exécution."
        Start-MySQLService
    }
} else {
    Write-Output "MySQL n'est pas installé sur cette machine."
    Install-MySQL
    Start-MySQLService
}
