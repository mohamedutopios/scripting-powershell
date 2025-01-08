function CreerUtilisateur {
    param(
        [string]$NomUtilisateur,
        [string]$MotDePasse,
        [string]$Description = "Utilisateur créé par script"
    )
    try {
        $Password = ConvertTo-SecureString $MotDePasse -AsPlainText -Force
        New-LocalUser -Name $NomUtilisateur -Password $Password -Description $Description
        Write-Output "Utilisateur $NomUtilisateur créé avec succès."
    } catch {
        Write-Error "Erreur lors de la création de l'utilisateur : $_"
    }
}

CreerUtilisateur -NomUtilisateur "Tomy" -MotDePasse "P@ssword123"