# Variables
$remoteComputer = "192.168.1.79"  # Nom ou IP de la machine distante
$adminUser = "Administrator"      # Nom d'utilisateur administrateur de la machine distante
$adminPassword = "password"       # Mot de passe de l'administrateur

# Création des informations d'identification
$securePassword = ConvertTo-SecureString $adminPassword -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($adminUser, $securePassword)

# Commande pour télécharger et installer Microsoft Teams
$installCommand = {
    $teamsInstallerUrl = "https://aka.ms/teams64bit"  # URL officielle pour l'installateur 64 bits
    $installerPath = "C:\Windows\Temp\TeamsSetup.exe"

    # Téléchargement de l'installateur
    Write-Output "Téléchargement de l'installateur Teams..."
    try {
        Invoke-WebRequest -Uri $teamsInstallerUrl -OutFile $installerPath -ErrorAction Stop
        Write-Output "Téléchargement terminé avec succès."
    } catch {
        Write-Output "Échec du téléchargement de l'installateur Teams : $_"
        return
    }

    # Vérifier si le fichier a été téléchargé avec succès
    if (-Not (Test-Path $installerPath)) {
        Write-Output "Le fichier TeamsSetup.exe est introuvable après le téléchargement."
        return
    }

    # Installation silencieuse
    Write-Output "Installation de Microsoft Teams..."
    try {
        Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait
        Write-Output "Microsoft Teams installé avec succès."
    } catch {
        Write-Output "Erreur lors de l'installation de Microsoft Teams : $_"
    }

    # Suppression de l'installateur après l'installation
    Write-Output "Nettoyage après installation..."
    Remove-Item -Path $installerPath -Force -ErrorAction SilentlyContinue
}

# Exécution sur la machine distante
try {
    Write-Output "Connexion à la machine distante $remoteComputer..."
    Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock $installCommand
    Write-Output "Installation de Microsoft Teams terminée sur $remoteComputer."
} catch {
    Write-Output "Échec de l'installation de Microsoft Teams : $_"
}
