# Chemin du fichier contenant les logs
$LogFilePath = "C:\Users\mohamed\Downloads\scripting-powershell\5-automatisation\demo\function\ssh.log"

# Chemin du fichier HTML de sortie
$OutputHtmlPath = "C:\Users\mohamed\Downloads\scripting-powershell\5-automatisation\demo\function\FailureReport.html"

# Vérifier si le fichier de logs existe
if (-Not (Test-Path $LogFilePath)) {
    Write-Error "Le fichier de logs spécifié ($LogFilePath) est introuvable."
    exit
}

# Lire les logs
Write-Output "Lecture des logs depuis $LogFilePath..."
$Logs = Get-Content -Path $LogFilePath

# Trouver les lignes contenant "failure"
Write-Output "Recherche des lignes contenant 'failure'..."
$FailureLines = $Logs | Where-Object { $_ -match "failure" }

# Extraire les adresses IP des lignes contenant "failure"
Write-Output "Extraction des adresses IP..."
$FailureIPs = $FailureLines | ForEach-Object {
    ($_ -split "\t")[2] # Supposons que l'IP se trouve dans la 3e colonne
}

# Compter les occurrences des IP
Write-Output "Calcul des occurrences des adresses IP..."
$FailureStats = $FailureIPs | Group-Object | Sort-Object Count -Descending | Select-Object @{ Name = "IP"; Expression = { $_.Name } }, @{ Name = "Count"; Expression = { $_.Count } }

# Ajouter une ligne pour le total global
$TotalFailures = $FailureLines.Count
$FailureStats += [PSCustomObject]@{ IP = "TOTAL"; Count = $TotalFailures }

# Générer un fichier HTML
Write-Output "Génération du rapport HTML à $OutputHtmlPath..."
$HtmlHeader = @"
<!DOCTYPE html>
<html>
<head>
<style>
    table { border-collapse: collapse; width: 60%; margin: auto; }
    th, td { border: 1px solid black; padding: 8px; text-align: center; }
    th { background-color: #f2f2f2; }
</style>
</head>
<body>
<h2 style="text-align: center;">Rapport des Tentatives d'Échec</h2>
<table>
<tr><th>IP</th><th>Count</th></tr>
"@

$HtmlFooter = @"
</table>
</body>
</html>
"@

# Construire le corps HTML sans erreur
$HtmlBody = $FailureStats | ForEach-Object {
    "<tr><td>$($_.IP)</td><td>$($_.Count)</td></tr>"
} | Out-String

# Combiner le contenu HTML
$HtmlContent = $HtmlHeader + $HtmlBody + $HtmlFooter

# Écrire le rapport HTML
if (-Not (Test-Path (Split-Path -Parent $OutputHtmlPath))) {
    New-Item -Path (Split-Path -Parent $OutputHtmlPath) -ItemType Directory -Force
}
Set-Content -Path $OutputHtmlPath -Value $HtmlContent

Write-Output "Rapport généré avec succès : $OutputHtmlPath"
