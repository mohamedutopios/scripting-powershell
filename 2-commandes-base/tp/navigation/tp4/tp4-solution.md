
1. **Créer une structure complexe de dossiers**
   ```powershell
   # Créer la structure de dossiers
   $folders = @(
        "test2\Archives\2024",
        "test2\Archives\2025",
        "test2\Logs\Application",
        "test2\Logs\System",
        "test2\Logs\Security",
        "test2\Reports\Daily",
        "test2\Reports\Monthly"
    )
   $folders | ForEach-Object { New-Item -Path $_ -ItemType Directory }

   # Ajouter des README.txt dans chaque dossier
   $folders | ForEach-Object {
       $description = "Ce dossier est utilisé pour : $($_.Split('\')[-1])"
       Set-Content -Path "$_\README.txt" -Value $description
   }
   ```

---

2. **Lister et trier le contenu**
   ```powershell
   # Lister tous les fichiers triés par date de modification
   Get-ChildItem -Path "test2" -Recurse | Sort-Object LastWriteTime

   # Afficher uniquement les dossiers contenant "Logs"
   Get-ChildItem -Path "test2" -Recurse -Directory | Where-Object { $_.Name -like "*Logs*" }
   ```

---

3. **Rechercher et déplacer des fichiers**
   ```powershell
   # Rechercher les fichiers README.txt
   $count = 1
   Get-ChildItem -Path "test2" -Recurse -Filter "README.txt" | ForEach-Object {
   $destinationPath = Join-Path -Path "test2\Archives\2024" -ChildPath ($_.BaseName + "_" + $count + $_.Extension)
     Move-Item -Path $_.FullName -Destination $destinationPath
     $count++
   }
   ```

---

4. **Compresser et supprimer des fichiers**
   ```powershell
   # Créer des fichiers dans test2\Reports
   New-Item -Path "test2\Reports\DailyReport.txt" -ItemType File -Value "Rapport quotidien"
   New-Item -Path "test2\Reports\MonthlyReport.txt" -ItemType File -Value "Rapport mensuel"

   # Compresser le contenu de Reports
   Compress-Archive -Path "test2\Reports\*" -DestinationPath "test2\ReportsBackup.zip"

   # Supprimer les fichiers .txt dans Reports
   Get-ChildItem -Path "test2\Reports" -Recurse -Filter *.txt | Remove-Item
   ```

---

5. **Créer un rapport CSV de navigation**
   ```powershell
   Get-ChildItem -Path "test2" -Recurse | Select-Object Name, FullName, `
       @{Name="Taille (Ko)";Expression={[math]::Round($_.Length / 1KB, 2)}}, LastWriteTime |
       Export-Csv -Path "test2\NavigationReport.csv" -NoTypeInformation
   ```


---

7. **Rechercher des fichiers récents**
   ```powershell
   Get-ChildItem -Path "test2" -Recurse -File | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-30) }
   ```

---

8. **Comparer deux dossiers**
   ```powershell
   # Créer les dossiers s'ils n'existent pas déjà
   New-Item -Path "C:\NavigationTP\Logs\Application" -ItemType Directory -Force
   New-Item -Path "C:\NavigationTP\Logs\System" -ItemType Directory -Force

   Set-Content -Path "C:\NavigationTP\Logs\Application\app-log1.txt" -Value "Application Log 1"
   Set-Content -Path "C:\NavigationTP\Logs\System\sys-log1.txt" -Value "System Log 1"

   Compare-Object -ReferenceObject (Get-ChildItem -Path "test2\Logs\Application" | Select-Object -ExpandProperty Name) `
                   -DifferenceObject (Get-ChildItem -Path "test2\Logs\System" | Select-Object -ExpandProperty Name) `
                   -IncludeEqual -PassThru
   ```

---

9. **Créer une navigation automatisée**
    ```powershell
    $initialDir = Get-Location
    Set-Location -Path "test2\Reports\Daily"
    Get-ChildItem | Select-Object Name | Out-File -FilePath "C:\Users\Moham\Documents\formation\scripting-powershell\test2\Reports\Daily\summary.txt"
    Set-Location -Path $initialDir
    ```