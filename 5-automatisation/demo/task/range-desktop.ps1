# Définir le chemin du bureau de l'utilisateur actuel
$BureauPath = [Environment]::GetFolderPath("Desktop")

# Dossiers de destination
$DossierImages = "$BureauPath\Images"
$DossierBureautique = "$BureauPath\Documents\Bureautique"
$DossierArchives = "$BureauPath\Documents\Archives"
$DossierAdministratif = "$BureauPath\Documents\Administratif"

# Extensions associées à chaque catégorie
$ExtensionsImages = @(".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tiff", ".svg", ".webp")
$ExtensionsBureautique = @(".doc", ".docx", ".txt", ".csv", ".xls", ".xlsx", ".ppt", ".pptx")
$ExtensionsArchives = @(".zip", ".rar", ".7z", ".tar", ".gz")
$ExtensionsAdministratif = @(".pdf")

# Fonction pour créer un dossier s'il n'existe pas
function CreerDossier {
    param([string]$Path)
    if (-Not (Test-Path $Path)) {
        New-Item -Path $Path -ItemType Directory | Out-Null
    }
}

# Créer les dossiers nécessaires
CreerDossier -Path $DossierImages
CreerDossier -Path $DossierBureautique
CreerDossier -Path $DossierArchives
CreerDossier -Path $DossierAdministratif

# Récupérer tous les fichiers du bureau
$Fichiers = Get-ChildItem -Path $BureauPath -File

# Parcourir les fichiers et les déplacer en fonction de leur extension
foreach ($Fichier in $Fichiers) {
    $Extension = $Fichier.Extension.ToLower()

    try {
        if ($ExtensionsImages -contains $Extension) {
            Move-Item -Path $Fichier.FullName -Destination $DossierImages -Force
            Write-Output "Fichier $($Fichier.Name) déplacé vers Images."
        } elseif ($ExtensionsBureautique -contains $Extension) {
            Move-Item -Path $Fichier.FullName -Destination $DossierBureautique -Force
            Write-Output "Fichier $($Fichier.Name) déplacé vers Bureautique."
        } elseif ($ExtensionsArchives -contains $Extension) {
            Move-Item -Path $Fichier.FullName -Destination $DossierArchives -Force
            Write-Output "Fichier $($Fichier.Name) déplacé vers Archives."
        } elseif ($ExtensionsAdministratif -contains $Extension) {
            Move-Item -Path $Fichier.FullName -Destination $DossierAdministratif -Force
            Write-Output "Fichier $($Fichier.Name) déplacé vers Administratif."
        } else {
            Write-Output "Fichier $($Fichier.Name) ignoré (aucune correspondance trouvée)."
        }
    } catch {
        Write-Error "Erreur lors du déplacement du fichier $($Fichier.Name) : $_"
    }
}

Write-Output "Organisation du bureau terminée."
