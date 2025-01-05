### TP PowerShell (suite) : Gestion fichiers


1. **Lister les fichiers d’un dossier selon des critères**
   - Listez tous les fichiers de `C:\TP_PowerShell` contenant le mot *backup* dans leur nom.
   - Affichez uniquement les fichiers modifiés dans les 7 derniers jours.

2. **Fusionner plusieurs fichiers**
   - Combinez le contenu de tous les fichiers `.txt` dans `C:\TP_PowerShell\Backup` en un seul fichier nommé `merged.txt`.

3. **Rechercher et remplacer dans plusieurs fichiers**
   - Dans tous les fichiers `.txt` du dossier `C:\TP_PowerShell\Backup`, remplacez le mot *ancien* par *nouveau*.

4. **Calculer la taille totale d’un dossier**
   - Calculez la taille totale des fichiers présents dans le dossier `C:\TP_PowerShell\Backup` (en octets et en Mo).

5. **Extraire des données spécifiques d’un fichier**
   - Créez un fichier `logs.txt` contenant plusieurs lignes de journal comme suit :
     ```
     [INFO] User logged in
     [ERROR] Failed to connect
     [INFO] Data saved
     [WARNING] Low disk space
     ```
   - Listez uniquement les lignes contenant le mot *ERROR*.

6. **Créer un script pour nettoyer un dossier**
   - Écrivez un script PowerShell qui supprime automatiquement tous les fichiers `.log` de plus de 30 jours dans `C:\TP_PowerShell\Logs`.

7. **Créer et organiser des dossiers dynamiquement**
   - Créez 12 dossiers nommés `Janvier` à `Décembre`.
   - Placez chaque fichier `.txt` dans le dossier correspondant au mois actuel (par exemple, janvier pour les fichiers créés en janvier).

8. **Créer un rapport HTML des fichiers**
   - Générez un rapport HTML contenant les noms, tailles, et dates de modification de tous les fichiers du dossier `C:\TP_PowerShell`.

9. **Créer un fichier CSV contenant des informations sur les fichiers**
   - Générez un fichier `report.csv` avec les colonnes : `Nom`, `Taille`, `Date de modification`.
   - Remplissez ce fichier avec les informations de tous les fichiers `.txt` dans `C:\TP_PowerShell`.

10. **Chiffrer et déchiffrer des fichiers**
    - Chiffrez le fichier `intro.txt` pour qu'il ne soit lisible qu'avec un mot de passe.
    - Déchiffrez-le à l'aide du mot de passe fourni.

---

### Questions pour évaluer la compréhension


1. Quelle commande permet de lire le contenu d’un fichier ?
2. Comment vérifier si un fichier existe à un chemin donné ?
3. Quelle est la différence entre `Set-Content` et `Add-Content` ?

4. Expliquez comment copier tous les fichiers `.log` d’un dossier vers un autre tout en conservant la structure des sous-dossiers.
5. Donnez un exemple d’utilisation de `Select-String` pour trouver un mot-clé dans plusieurs fichiers.

6. Écrivez une commande pour comparer deux fichiers ligne par ligne et afficher uniquement les lignes différentes.

