# Fonction pour convertir le timestamp Unix en date lisible
function Convert-TimestampToDate {
    param([double]$timestamp)
    return (Get-Date "1970-01-01 00:00:00").AddSeconds($timestamp).ToString("yyyy-MM-dd HH:mm:ss")
}

# Chemin vers le fichier de logs
$logFile = "C:\Users\mohamed\Downloads\scripting-powershell\5-automatisation\demo\function\ssh.log"

# Lire les logs à partir du fichier
$logs = Get-Content $logFile

# Liste pour stocker les connexions réussies
$successLogins = @()

# Parcourir chaque ligne du fichier
foreach ($line in $logs) {
    # Diviser chaque ligne en champs
    $fields = $line -split "\s+"
    
    # Vérifier si la connexion est réussie
    if ($fields[6] -eq "success") {
        # Extraire l'horodatage et l'adresse IP
        $timestamp = [double]$fields[0]
        $sourceIP = $fields[2]
        $humanReadableDate = Convert-TimestampToDate -timestamp $timestamp
        
        # Ajouter à la liste des connexions réussies
        $successLogins += [PSCustomObject]@{
            Date = $humanReadableDate
            SourceIP = $sourceIP
        }
    }
}

# Convertir les objets en table HTML
$htmlContent = $successLogins | ConvertTo-Html -Property Date, SourceIP -Head "<title>Succès de Connexions SSH</title><style>table { width: 100%; border-collapse: collapse; } th, td { padding: 8px 12px; border: 1px solid #ccc; text-align: left; }</style>" -Body "<h1>Liste des Connexions SSH Réussies</h1>"

# Chemin pour sauvegarder le fichier HTML
$htmlFilePath = "C:\Users\mohamed\Downloads\scripting-powershell\5-automatisation\demo\function\rapport_connexions_ssh.html"

# Sauvegarder le contenu HTML dans le fichier
$htmlContent | Out-File -FilePath $htmlFilePath -Encoding utf8

Write-Host "Rapport généré avec succès : $htmlFilePath"
