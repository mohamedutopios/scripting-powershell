function AjouterUtilisateur {
    param (
        [string]$NomUtilisateur,
        [string]$MotDePasse
    )
    try {
        New-LocalUser -Name $NomUtilisateur -Password (ConvertTo-SecureString $MotDePasse -AsPlainText -Force) -FullName $NomUtilisateur
        Write-Output "Utilisateur $NomUtilisateur créé avec succès."
    } catch {
        Write-Output "Erreur : Impossible de créer l'utilisateur $NomUtilisateur. $_"
    }
}

function SupprimerUtilisateur {
    param (
        [string]$NomUtilisateur
    )
    try {
        Remove-LocalUser -Name $NomUtilisateur
        Write-Output "Utilisateur $NomUtilisateur supprimé avec succès."
    } catch {
        Write-Output "Erreur : Impossible de supprimer l'utilisateur $NomUtilisateur. $_"
    }
}

function ListerUtilisateurs {
    try {
        Get-LocalUser
    } catch {
        Write-Output "Erreur : Impossible de lister les utilisateurs. $_"
    }
}

# Exemple d'utilisation
#AjouterUtilisateur -NomUtilisateur "TestUser" -MotDePasse "P@ssw0rd!"
#ListerUtilisateurs
#SupprimerUtilisateur -NomUtilisateur "TestUser"