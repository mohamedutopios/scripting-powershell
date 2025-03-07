### TP PowerShell : Navigation Avancée dans le Système de Fichiers

---

### **Énoncé**

1. **Créer une structure complexe de dossiers**
   - Créez une structure de dossiers à l’intérieur de `C:\NavigationTP` :
     ```
     C:\NavigationTP
     ├── Archives
     │   ├── 2024
     │   └── 2025
     ├── Logs
     │   ├── Application
     │   ├── System
     │   └── Security
     └── Reports
         ├── Daily
         └── Monthly
     ```
   - Dans chaque sous-dossier, créez un fichier `README.txt` contenant une description du dossier.

2. **Lister et trier le contenu**
   - Listez tous les fichiers de la structure créée, triés par date de modification.
   - Affichez uniquement les dossiers dont le nom contient le mot `Logs`.

3. **Rechercher et déplacer des fichiers**
   - Recherchez récursivement tous les fichiers `.txt` contenant le mot *README*.
   - Déplacez ces fichiers dans le dossier `C:\NavigationTP\Archives\2024`.

4. **Compresser et supprimer des fichiers**
   - Compressez tout le contenu du dossier `C:\NavigationTP\Reports` dans une archive nommée `ReportsBackup.zip`.
   - Supprimez ensuite tous les fichiers `.txt` du dossier `C:\NavigationTP\Reports`.

5. **Créer un rapport CSV de navigation**
   - Générez un fichier CSV `NavigationReport.csv` contenant les colonnes :
     - `Nom du Fichier`
     - `Chemin Complet`
     - `Taille (Ko)`
     - `Date de Dernière Modification`
   - Remplissez ce fichier avec les informations de tous les fichiers présents dans `C:\NavigationTP`.

6. **Navigation conditionnelle**
   - Si le fichier `README.txt` existe dans `C:\NavigationTP\Logs\System`, changez vers ce répertoire.
   - Si le fichier n’existe pas, affichez un message indiquant que le fichier est introuvable.

7. **Créer un alias pour une navigation rapide**
   - Créez un alias `gotoReports` pour naviguer rapidement dans le dossier `C:\NavigationTP\Reports`.

8. **Rechercher des fichiers récents**
   - Affichez tous les fichiers modifiés dans les 30 derniers jours dans `C:\NavigationTP`.

9. **Comparer deux dossiers**
   - Comparez le contenu des dossiers `C:\NavigationTP\Logs\Application` et `C:\NavigationTP\Logs\System` :
     - Listez les fichiers présents dans `Application` mais absents de `System`.

10. **Créer une navigation automatisée**
    - Écrivez un script PowerShell qui effectue les étapes suivantes :
      - Navigue dans le dossier `C:\NavigationTP\Reports\Daily`.
      - Crée un fichier `summary.txt` contenant la liste des fichiers du dossier.
      - Retourne automatiquement au répertoire initial après exécution.

---

### **Solutions**

---

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