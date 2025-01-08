# Variables
$remoteComputer = "192.168.1.56"  # Adresse IP ou nom de la machine distante
$remoteUser = "WIN-79JIHNKCUUM\Administrateur"  # Compte utilisateur avec privilèges administratifs
$password = Read-Host "Entrez le mot de passe pour $remoteUser" -AsSecureString
$credential = New-Object System.Management.Automation.PSCredential($remoteUser, $password)

# Script à exécuter sur la machine distante
$remoteScript = {
    # Variables
    $teamsInstallerUrl = "https://aka.ms/teams"
    $tempPath = "$env:TEMP\TeamsInstaller.exe"

    # Téléchargement de l'installateur
    Write-Host "Téléchargement de l'installateur Microsoft Teams..."
    Invoke-WebRequest -Uri $teamsInstallerUrl -OutFile $tempPath

    # Vérification du téléchargement
    if (Test-Path $tempPath) {
        Write-Host "Téléchargement réussi. Chemin : $tempPath"
    } else {
        Write-Error "Échec du téléchargement de l'installateur."
        exit 1
    }

    # Installation de Microsoft Teams
    Write-Host "Installation de Microsoft Teams..."
    Start-Process -FilePath $tempPath -ArgumentList "/silent /install" -Wait

    # Vérification de l'installation
    if (Get-Command "Teams.exe" -ErrorAction SilentlyContinue) {
        Write-Host "Microsoft Teams a été installé avec succès."
    } else {
        Write-Error "Échec de l'installation de Microsoft Teams."
    }

    # Suppression du fichier d'installation temporaire
    Write-Host "Nettoyage des fichiers temporaires..."
    Remove-Item -Path $tempPath -Force

    Write-Host "Installation terminée."
}

# Exécution du script sur la machine distante
Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock $remoteScript
