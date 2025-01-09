function AnalyserDossier {
    param (
        [string]$CheminDossier
    )
    try {
        if (-Not (Test-Path $CheminDossier)) {
            throw "Le dossier $CheminDossier n'existe pas."
        }

        $fichiers = Get-ChildItem -Path $CheminDossier -File | Select-Object Name, Length
        $rapport = $fichiers | Sort-Object Length -Descending | Select-Object -First 5

        $tailleTotale = ($fichiers | Measure-Object Length -Sum).Sum
        $rapport | Export-Csv -Path "$CheminDossier\rapport.csv" -NoTypeInformation

        Write-Output "Rapport généré dans $CheminDossier\rapport.csv"
        Write-Output "Taille totale des fichiers : $tailleTotale bytes"
    } catch {
        Write-Output "Erreur : $_"
    }
}

# Exemple d'utilisation
#AnalyserDossier -CheminDossier "C:\Temp"