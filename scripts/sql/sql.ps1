# Variables pour la machine distante
$remoteComputer = "192.168.1.56"  # Adresse IP ou nom de la machine distante
$remoteUser = "WIN-79JIHNKCUUM\Administrateur"  # Compte utilisateur avec privilèges administratifs
$password = Read-Host "Entrez le mot de passe pour $remoteUser" -AsSecureString
$credential = New-Object System.Management.Automation.PSCredential($remoteUser, $password)

# Script à exécuter sur la machine distante
$remoteScript = {
    # Variables
    $sqlInstallerUrl = "https://go.microsoft.com/fwlink/?linkid=866658"  # Lien SQL Server Express 2019
    $tempPath = "$env:TEMP\SQLServer2019.exe"
    $setupConfigPath = "$env:TEMP\ConfigurationFile.ini"

    # Téléchargement de l'installateur SQL Server Express
    Write-Host "Téléchargement de l'installateur SQL Server Express..."
    Invoke-WebRequest -Uri $sqlInstallerUrl -OutFile $tempPath

    # Vérification du téléchargement
    if (-Not (Test-Path $tempPath)) {
        Write-Error "Échec du téléchargement de l'installateur SQL Server."
        exit 1
    }

    Write-Host "Téléchargement réussi. Chemin : $tempPath"

    # Création d'un fichier de configuration pour une installation silencieuse
    @"
[OPTIONS]
ACTION="Install"
FEATURES=SQLENGINE
INSTANCENAME="MSSQLSERVER"
SQLSVCACCOUNT="NT AUTHORITY\NETWORK SERVICE"
AGTSVCACCOUNT="NT AUTHORITY\NETWORK SERVICE"
SQLSYSADMINACCOUNTS="BUILTIN\ADMINISTRATORS"
TCPENABLED=1
IACCEPTSQLSERVERLICENSETERMS="True"
"@ | Set-Content -Path $setupConfigPath

    # Installation silencieuse de SQL Server Express
    Write-Host "Installation de SQL Server..."
    Start-Process -FilePath $tempPath -ArgumentList "/ConfigurationFile=$setupConfigPath" -Wait

    # Nettoyage des fichiers temporaires
    Write-Host "Nettoyage des fichiers temporaires..."
    Remove-Item -Path $tempPath, $setupConfigPath -Force

    Write-Host "SQL Server Express a été installé avec succès."
}

# Exécution du script sur la machine distante
Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock $remoteScript
