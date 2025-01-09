# Variables
$remoteComputer = "192.168.1.79"  # Nom ou IP de la machine distante
$adminUser = "Administrator"      # Nom d'utilisateur administrateur de la machine distante
$adminPassword = "password"       # Mot de passe de l'administrateur

# Création des informations d'identification
$securePassword = ConvertTo-SecureString $adminPassword -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($adminUser, $securePassword)

# Commande pour désinstaller Google Chrome
$uninstallCommand = {
    # Clés potentielles dans le registre pour les applications installées
    $uninstallKeys = @(
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
        'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall',
        'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
    )
    
    # Recherche de Google Chrome dans ces clés
    foreach ($key in $uninstallKeys) {
        $chromeSubKey = Get-ChildItem -Path $key -ErrorAction SilentlyContinue | Where-Object {
            ($_ | Get-ItemProperty -ErrorAction SilentlyContinue).DisplayName -like '*Google Chrome*'
        }

        if ($chromeSubKey) {
            $uninstallString = (Get-ItemProperty -Path $chromeSubKey.PSPath -ErrorAction SilentlyContinue).UninstallString
            if ($uninstallString) {
                Write-Output "Commande de désinstallation trouvée : $uninstallString"
                # Nettoyage des guillemets dans la commande si nécessaire
                $uninstallString = $uninstallString -replace '\"', ''
                # Exécuter la commande de désinstallation
                Start-Process -FilePath $uninstallString -ArgumentList '/quiet /norestart' -Wait
                Write-Output "Google Chrome désinstallé avec succès."
                return
            }
        }
    }
    
    Write-Output "Google Chrome n'a pas pu être trouvé dans le registre."
}

# Exécution sur la machine distante
try {
    Write-Output "Connexion à la machine distante $remoteComputer..."
    Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock $uninstallCommand
    Write-Output "Désinstallation de Google Chrome terminée sur $remoteComputer."
} catch {
    Write-Output "Échec de la désinstallation de Google Chrome : $_"
}
