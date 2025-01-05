
1. **Créer une structure complexe de dossiers**
   ```powershell
   # Créer la structure de dossiers
   $folders = @(
       "C:\NavigationTP\Archives\2024",
       "C:\NavigationTP\Archives\2025",
       "C:\NavigationTP\Logs\Application",
       "C:\NavigationTP\Logs\System",
       "C:\NavigationTP\Logs\Security",
       "C:\NavigationTP\Reports\Daily",
       "C:\NavigationTP\Reports\Monthly"
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
   Get-ChildItem -Path "C:\NavigationTP" -Recurse | Sort-Object LastWriteTime

   # Afficher uniquement les dossiers contenant "Logs"
   Get-ChildItem -Path "C:\NavigationTP" -Recurse -Directory | Where-Object { $_.Name -like "*Logs*" }
   ```

---

3. **Rechercher et déplacer des fichiers**
   ```powershell
   # Rechercher les fichiers README.txt
   Get-ChildItem -Path "C:\NavigationTP" -Recurse -Filter "README.txt" |
       Move-Item -Destination "C:\NavigationTP\Archives\2024"
   ```

---

4. **Compresser et supprimer des fichiers**
   ```powershell
   # Compresser le contenu de Reports
   Compress-Archive -Path "C:\NavigationTP\Reports\*" -DestinationPath "C:\NavigationTP\ReportsBackup.zip"

   # Supprimer les fichiers .txt dans Reports
   Get-ChildItem -Path "C:\NavigationTP\Reports" -Recurse -Filter *.txt | Remove-Item
   ```

---

5. **Créer un rapport CSV de navigation**
   ```powershell
   Get-ChildItem -Path "C:\NavigationTP" -Recurse | Select-Object Name, FullName, `
       @{Name="Taille (Ko)";Expression={[math]::Round($_.Length / 1KB, 2)}}, LastWriteTime |
       Export-Csv -Path "C:\NavigationTP\NavigationReport.csv" -NoTypeInformation
   ```

---

6. **Navigation conditionnelle**
   ```powershell
   if (Test-Path -Path "C:\NavigationTP\Logs\System\README.txt") {
       Set-Location -Path "C:\NavigationTP\Logs\System"
   } else {
       Write-Output "README.txt introuvable dans Logs\System"
   }
   ```

---

7. **Créer un alias pour une navigation rapide**
   ```powershell
   Set-Alias -Name gotoReports -Value { Set-Location -Path "C:\NavigationTP\Reports" }
   ```

---

8. **Rechercher des fichiers récents**
   ```powershell
   Get-ChildItem -Path "C:\NavigationTP" -Recurse -File | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-30) }
   ```

---

9. **Comparer deux dossiers**
   ```powershell
   Compare-Object -ReferenceObject (Get-ChildItem -Path "C:\NavigationTP\Logs\Application" | Select-Object -ExpandProperty Name) `
                   -DifferenceObject (Get-ChildItem -Path "C:\NavigationTP\Logs\System" | Select-Object -ExpandProperty Name) `
                   -IncludeEqual -PassThru
   ```

---

10. **Créer une navigation automatisée**
    ```powershell
    $initialDir = Get-Location
    Set-Location -Path "C:\NavigationTP\Reports\Daily"
    Get-ChildItem | Select-Object Name | Out-File -FilePath "C:\NavigationTP\Reports\Daily\summary.txt"
    Set-Location -Path $initialDir
    ```