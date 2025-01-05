### TP PowerShell : Navigationdans le Système de Fichiers

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
