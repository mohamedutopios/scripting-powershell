# Variables pour la machine distante
$remoteComputer = "192.168.1.56"
$remoteUser = "WIN-79JIHNKCUUM\Administrateur"
$password = Read-Host "Entrez le mot de passe pour $remoteUser" -AsSecureString
$credential = New-Object System.Management.Automation.PSCredential($remoteUser, $password)

# Script à exécuter sur la machine distante
$remoteScript = {
    # Installation d'IIS
    Write-Host "Installation du rôle IIS..."
    Install-WindowsFeature -Name Web-Server -IncludeManagementTools

    # Vérification de l'installation
    if (!(Get-WindowsFeature -Name Web-Server).Installed) {
        Write-Error "Échec de l'installation du rôle IIS."
        exit 1
    }
    Write-Host "Serveur Web IIS installé avec succès."
}

# Exécution du script sur la machine distante
Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock $remoteScript
