$DestinationFolder = "C:\Users\mohamed\Downloads\scripting-powershell\5-automatisation\demo\minutes"
$LogFile = "C:\Temp\CreationLog.txt"

try {
    # Vérifier et créer le dossier cible si nécessaire
    if (-Not (Test-Path $DestinationFolder)) {
        New-Item -Path $DestinationFolder -ItemType Directory
        Add-Content -Path $LogFile -Value "[$(Get-Date)] Dossier $DestinationFolder créé."
    }
 
    # Nom du fichier avec horodatage
    $FileName = "Fichier_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
 
    # Créer le fichier
    Set-Content -Path "$DestinationFolder\$FileName" -Value "Fichier créé à $(Get-Date)"
    Add-Content -Path $LogFile -Value "[$(Get-Date)] Fichier $FileName créé avec succès dans $DestinationFolder."
 
    # Déplacer les fichiers de plus de 7 jours vers un dossier d'archive
    $ArchiveFolder = "$DestinationFolder\Archive"
    if (-Not (Test-Path $ArchiveFolder)) {
        New-Item -Path $ArchiveFolder -ItemType Directory
    }
 
    Get-ChildItem -Path $DestinationFolder -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } |
        ForEach-Object { Move-Item -Path $_.FullName -Destination $ArchiveFolder }
    Add-Content -Path $LogFile -Value "[$(Get-Date)] Fichiers anciens déplacés vers $ArchiveFolder."
 
    Write-Output "Fichier $FileName créé avec succès."
} catch {
    Add-Content -Path $LogFile -Value "[$(Get-Date)] Erreur lors de l'exécution : $_"
    Write-Error "Une erreur s'est produite : $_"
}