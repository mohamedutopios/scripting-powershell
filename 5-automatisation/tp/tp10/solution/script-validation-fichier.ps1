function ValiderFichier {
    param (
        [string]$CheminFichier,
        [string]$Lettre
    )
    try {
        if (-Not (Test-Path $CheminFichier)) {
            throw "Le fichier $CheminFichier n'existe pas."
        }

        $contenu = Get-Content $CheminFichier
        if (-Not $contenu) {
            throw "Le fichier est vide."
        }

        $nomsValides = $contenu | Where-Object { $_ -like "$Lettre*" }
        $nomsValides | Set-Content -Path "$CheminFichier-validé.txt"

        Write-Output "Fichier validé créé : $CheminFichier-validé.txt"
    } catch {
        Write-Output "Erreur : $_"
    }
}

# Exemple d'utilisation
#ValiderFichier -CheminFichier "C:\Temp\noms.txt" -Lettre "A"