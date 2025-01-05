### TP PowerShell : Pipelines Complexes pour la Gestion de Fichiers et Données


### **Énoncé**

#### **Exercice 1 : Analyse avancée des fichiers**
1. Listez tous les fichiers dans `C:\TP_PowerShell\LogFiles_Backup`.
2. Filtrez uniquement les fichiers `.log` dont la taille dépasse 1 Mo.
3. Affichez leurs **noms**, **tailles (en Ko)**, et **chemins complets**, triés par taille décroissante.
4. Exportez ces informations dans un fichier CSV `LargeLogs.csv`.

---

#### **Exercice 2 : Création et analyse d'un rapport de logs**
1. Recherchez récursivement tous les fichiers `.log` dans `C:\TP_PowerShell\LogFiles_Backup`.
2. Comptez combien de fichiers contiennent le mot *Error*.
3. Générez un rapport HTML contenant les fichiers trouvés, avec les colonnes :
   - **Nom**
   - **Chemin complet**
   - **Dernière modification**
   - **Taille (Ko)**

---

#### **Exercice 3 : Organisation par groupe et suppression conditionnelle**
1. Regroupez tous les fichiers dans `C:\TP_PowerShell\LogFiles_Backup` par extension.
2. Affichez pour chaque extension :
   - Le nombre total de fichiers.
   - La taille cumulée de ces fichiers (en Mo).
3. Supprimez les fichiers `.tmp` ou ceux de moins de 500 Ko.

---

#### **Exercice 4 : Analyse temporelle et transformation**
1. Recherchez tous les fichiers dans `C:\TP_PowerShell\LogFiles_Backup` modifiés dans les 15 derniers jours.
2. Affichez leurs **noms** transformés en majuscules, triés par date de dernière modification.
3. Exportez ces données dans un fichier CSV `RecentLogs.csv`.

---

#### **Exercice 5 : Fusion et analyse de fichiers**
1. Fusionnez tous les fichiers `.log` de `C:\TP_PowerShell\LogFiles_Backup` en un seul fichier `CombinedLogs.log`.
2. Recherchez dans ce fichier toutes les lignes contenant le mot *Warning*.
3. Comptez le nombre d'occurrences de *Warning* et exportez le résultat dans un fichier texte `WarningsCount.txt`.

---

#### **Exercice 6 : Création d'un tableau HTML dynamique**
1. Créez un tableau HTML listant tous les fichiers `.log` modifiés dans les 30 derniers jours.
2. Ajoutez les colonnes suivantes :
   - **Nom**
   - **Taille (Ko)**
   - **Chemin complet**
   - **Date de dernière modification**
3. Sauvegardez ce tableau dans `LogSummary.html`.

