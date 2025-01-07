### Réponses sans les boucles

---

1. **Créer une structure complexe de dossiers**

#### **Solution :**
```powershell
# Créer manuellement les dossiers
New-Item -Path "test2\Archives\2024" -ItemType Directory
New-Item -Path "test2\Archives\2025" -ItemType Directory
New-Item -Path "test2\Logs\Application" -ItemType Directory
New-Item -Path "test2\Logs\System" -ItemType Directory
New-Item -Path "test2\Logs\Security" -ItemType Directory
New-Item -Path "test2\Reports\Daily" -ItemType Directory
New-Item -Path "test2\Reports\Monthly" -ItemType Directory

# Ajouter un README.txt dans chaque dossier
Set-Content -Path "test2\Archives\2024\README.txt" -Value "Ce dossier est utilisé pour : 2024"
Set-Content -Path "test2\Archives\2025\README.txt" -Value "Ce dossier est utilisé pour : 2025"
Set-Content -Path "test2\Logs\Application\README.txt" -Value "Ce dossier est utilisé pour : Application Logs"
Set-Content -Path "test2\Logs\System\README.txt" -Value "Ce dossier est utilisé pour : System Logs"
Set-Content -Path "test2\Logs\Security\README.txt" -Value "Ce dossier est utilisé pour : Security Logs"
Set-Content -Path "test2\Reports\Daily\README.txt" -Value "Ce dossier est utilisé pour : Daily Reports"
Set-Content -Path "test2\Reports\Monthly\README.txt" -Value "Ce dossier est utilisé pour : Monthly Reports"
```

---

2. **Lister et trier le contenu**

#### **Solution :**
```powershell
# Lister tous les fichiers triés par date de modification
Get-ChildItem -Path "test2" -Recurse | Sort-Object -Property LastWriteTime

# Afficher uniquement les dossiers contenant "Logs"
Get-ChildItem -Path "test2" -Recurse -Directory | Where-Object { $_.Name -like "*Logs*" }
```

---

3. **Rechercher et déplacer des fichiers**

#### **Solution :**
```powershell
# Déplacer manuellement les fichiers README.txt vers Archives\2024
Move-Item -Path "test2\Archives\2024\README.txt" -Destination "test2\Archives\2024\README_1.txt"
Move-Item -Path "test2\Archives\2025\README.txt" -Destination "test2\Archives\2024\README_2.txt"
Move-Item -Path "test2\Logs\Application\README.txt" -Destination "test2\Archives\2024\README_3.txt"
Move-Item -Path "test2\Logs\System\README.txt" -Destination "test2\Archives\2024\README_4.txt"
Move-Item -Path "test2\Logs\Security\README.txt" -Destination "test2\Archives\2024\README_5.txt"
Move-Item -Path "test2\Reports\Daily\README.txt" -Destination "test2\Archives\2024\README_6.txt"
Move-Item -Path "test2\Reports\Monthly\README.txt" -Destination "test2\Archives\2024\README_7.txt"
```

---

4. **Compresser et supprimer des fichiers**

#### **Solution :**
```powershell
# Créer des fichiers dans test2\Reports
New-Item -Path "test2\Reports\DailyReport.txt" -ItemType File -Value "Rapport quotidien"
New-Item -Path "test2\Reports\MonthlyReport.txt" -ItemType File -Value "Rapport mensuel"

# Compresser le contenu de Reports
Compress-Archive -Path "test2\Reports\*" -DestinationPath "test2\ReportsBackup.zip"

# Supprimer les fichiers .txt dans Reports
Remove-Item -Path "test2\Reports\DailyReport.txt"
Remove-Item -Path "test2\Reports\MonthlyReport.txt"
```

---

5. **Créer un rapport CSV de navigation**

#### **Solution :**
```powershell
Get-ChildItem -Path "test2" -Recurse | Select-Object Name, FullName, `
    @{Name="Taille (Ko)";Expression={[math]::Round($_.Length / 1KB, 2)}}, LastWriteTime |
    Export-Csv -Path "test2\NavigationReport.csv" -NoTypeInformation
```

---

6. **Rechercher des fichiers récents**

#### **Solution :**
```powershell
# Trouver les fichiers modifiés dans les 30 derniers jours
Get-ChildItem -Path "test2" -Recurse -File | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-30) }
```

---

7. **Comparer deux dossiers**

#### **Solution :**
```powershell
# Comparer deux dossiers
Compare-Object -ReferenceObject (Get-ChildItem -Path "test2\Logs\Application" | Select-Object -ExpandProperty Name) `
               -DifferenceObject (Get-ChildItem -Path "test2\Logs\System" | Select-Object -ExpandProperty Name) `
               -IncludeEqual -PassThru
```

---

8. **Créer une navigation automatisée**

#### **Solution :**
```powershell
# Naviguer dans un dossier, lister son contenu et sauvegarder dans un fichier
Set-Location -Path "test2\Reports\Daily"
Get-ChildItem | Select-Object Name | Out-File -FilePath "test2\Reports\Daily\summary.txt"
Set-Location -Path "C:\"
```