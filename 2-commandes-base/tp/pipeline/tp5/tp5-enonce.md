### TP PowerShell : Opérations centrées sur les Pipelines

### **Énoncé**

1. **Copier un dossier source vers un répertoire de travail**
   - Copiez le dossier source `C:\Windows\System32\LogFiles` vers `C:\TP_PowerShell\LogFiles_Backup`.

2. **Lister les fichiers avec des propriétés spécifiques**
   - Listez tous les fichiers du dossier copié et affichez uniquement leur **nom**, **taille**, et **date de dernière modification**.

3. **Rechercher des fichiers volumineux**
   - Recherchez tous les fichiers `.log` dont la taille est supérieure à 500 Ko, puis affichez leurs noms triés par taille décroissante.

4. **Comptabiliser les fichiers par type**
   - Calculez le nombre total de fichiers pour chaque extension présente dans le dossier copié.

5. **Calculer la taille totale du dossier**
   - Additionnez la taille de tous les fichiers dans le dossier et affichez-la en mégaoctets.

6. **Analyser les fichiers récents**
   - Recherchez les fichiers modifiés au cours des 7 derniers jours et affichez leurs **chemins complets** et **taille en Ko**.

7. **Transformer les noms des fichiers**
   - Affichez la liste des fichiers avec leurs noms convertis en **majuscule**, triés par ordre alphabétique.

8. **Extraire les 10 plus anciens fichiers**
   - Identifiez les 10 fichiers les plus anciens dans le dossier, en affichant leur **nom**, **chemin complet**, et **date de création**.

9. **Créer un rapport HTML des fichiers**
   - Générez un rapport HTML contenant les colonnes : **nom**, **taille**, et **dernière modification** pour tous les fichiers `.log`.
