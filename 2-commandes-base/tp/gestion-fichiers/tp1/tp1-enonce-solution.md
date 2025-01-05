### **Solutions : Gestion de fichiers avec PowerShell**

---

1. **Créer un fichier et y ajouter du contenu**
   ```powershell
   # Créer le dossier
   New-Item -Path "C:\TP_PowerShell" -ItemType Directory

   # Créer le fichier et ajouter du contenu
   Set-Content -Path "C:\TP_PowerShell\intro.txt" -Value "Bienvenue au TP PowerShell."
   ```

2. **Lire le fichier créé**
   ```powershell
   # Lire tout le contenu
   Get-Content -Path "C:\TP_PowerShell\intro.txt"

   # Lire uniquement les 5 premiers caractères
   (Get-Content -Path "C:\TP_PowerShell\intro.txt").Substring(0, 5)
   ```

3. **Ajouter du texte au fichier**
   ```powershell
   Add-Content -Path "C:\TP_PowerShell\intro.txt" -Value "PowerShell simplifie la gestion des fichiers."
   ```

4. **Créer plusieurs fichiers**
   ```powershell
   1..5 | ForEach-Object { New-Item -Path "C:\TP_PowerShell\fichier$_.txt" -ItemType File }
   ```

5. **Copier et déplacer des fichiers**
   ```powershell
   # Créer le sous-dossier Backup
   New-Item -Path "C:\TP_PowerShell\Backup" -ItemType Directory

   # Copier les fichiers .txt
   Copy-Item -Path "C:\TP_PowerShell\*.txt" -Destination "C:\TP_PowerShell\Backup"

   # Déplacer intro.txt vers Backup
   Move-Item -Path "C:\TP_PowerShell\intro.txt" -Destination "C:\TP_PowerShell\Backup"
   ```

6. **Vérifier l’existence de fichiers**
   ```powershell
   Test-Path -Path "C:\TP_PowerShell\intro.txt"
   ```

7. **Renommer des fichiers**
   ```powershell
   Get-ChildItem -Path "C:\TP_PowerShell\Backup\*.txt" | ForEach-Object {
       Rename-Item -Path $_.FullName -NewName "$($_.BaseName)_old$($_.Extension)"
   }
   ```

8. **Trouver des fichiers spécifiques**
   ```powershell
   Get-ChildItem -Path "C:\TP_PowerShell\Backup\*.txt" | ForEach-Object {
       if (Select-String -Path $_.FullName -Pattern "PowerShell") {
           $_.Name
       }
   }
   ```

9. **Compresser et décompresser**
   ```powershell
   # Compresser
   Compress-Archive -Path "C:\TP_PowerShell\Backup\*" -DestinationPath "C:\TP_PowerShell\backup.zip"

   # Décompresser
   Expand-Archive -Path "C:\TP_PowerShell\backup.zip" -DestinationPath "C:\TP_PowerShell\Extracted"
   ```

10. **Remplacer du texte dans un fichier**
    ```powershell
    (Get-Content -Path "C:\TP_PowerShell\Extracted\intro.txt") -replace "PowerShell", "Automatisation" |
        Set-Content -Path "C:\TP_PowerShell\Extracted\intro.txt"
    ```

11. **Générer et analyser des fichiers**
    ```powershell
    # Générer un fichier avec des numéros aléatoires
    1..100 | ForEach-Object { Get-Random -Minimum 1 -Maximum 100 } | Set-Content -Path "C:\TP_PowerShell\data.txt"

    # Calculer la somme
    (Get-Content -Path "C:\TP_PowerShell\data.txt" | Measure-Object -Sum).Sum
    ```

12. **Comparer deux fichiers**
    ```powershell
    # Créer les fichiers avec des listes de noms
    Set-Content -Path "C:\TP_PowerShell\file1.txt" -Value @("Alice", "Bob", "Charlie")
    Set-Content -Path "C:\TP_PowerShell\file2.txt" -Value @("Bob", "David")

    # Trouver les noms uniquement dans file1.txt
    Compare-Object -ReferenceObject (Get-Content -Path "C:\TP_PowerShell\file1.txt") `
                   -DifferenceObject (Get-Content -Path "C:\TP_PowerShell\file2.txt") |
        Where-Object { $_.SideIndicator -eq "<=" }
    ```