### TP PowerShell : Manipulation de dossiers et fichiers

### **Solutions**

1. **Télécharger et extraire l'archive**
   ```powershell
   # Téléchargement de l'archive
   Invoke-WebRequest -Uri "https://mohamed-formation.s3.eu-west-3.amazonaws.com/html5up-ethereal.zip" -OutFile "html5up-ethereal.zip"

   # Extraction de l'archive
   Expand-Archive -Path "html5up-ethereal.zip" -DestinationPath "."
   ```

2. **Lister le contenu extrait**
   ```powershell
   # Liste tout le contenu
   Get-ChildItem -Path "C:\MonTP\html5up-ethereal"

   # Liste uniquement les fichiers .html
   get-ChildItem -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test" -Recurse -Filter *.html
   ```

3. **Rechercher des fichiers spécifiques**
   ```powershell
   get-ChildItem -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test" -Recurse -Filter *.css
   ```

4. **Filtrer les fichiers par taille**
   ```powershell
   get-ChildItem -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test" -File | Where-Object { $_.Length -gt 100KB }
   ```

5. **Changer de répertoire**
   ```powershell
   # Naviguer dans le répertoire contenant les fichiers CSS
   set-location -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test\assets"

   # Revenir au répertoire parent
   set-location -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test
   ```

6. **Compresser des fichiers**
   ```powershell
   Compress-Archive -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test\*.html" -DestinationPath "C:\Users\Moham\Documents\formation\scripting-powershell\test\html_files.zip"
   ```

7. **Créer un rapport CSV**
   ```powershell
   Get-ChildItem -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test" -Recurse | Select-Object Name, Length, FullName | Export-Csv -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test\report.csv" -NoTypeInformation
   ```

8. **Supprimer certains fichiers**
   ```powershell
   Get-ChildItem -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test" -Recurse -Filter *.txt | Remove-Item
   ```

9. **Lister les fichiers récents**
   ```powershell
   Get-ChildItem -Path "C:\Users\Moham\Documents\formation\scripting-powershell\test" -File | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) } 
   ```
