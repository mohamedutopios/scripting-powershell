### TP PowerShell : Structures Conditionnelles, Boucles et Filtres/Sélecteurs 

### **Exercice 3 : Boucles sur une Liste de Fichiers**

1. Listez tous les fichiers dans le répertoire `C:\TP_PowerShell`.
2. Utilisez une boucle **`foreach`** pour afficher les noms de tous les fichiers.
3. Ajoutez une boucle **`for`** pour afficher les noms des 3 premiers fichiers de la liste.
4. Avec une boucle **`while`**, affichez les noms des fichiers jusqu'à rencontrer un fichier dont le nom commence par `"Log"`.



### **Exercice 4 : Filtres Dynamiques avec `Where-Object`**

1. Listez tous les fichiers dans le répertoire `C:\TP_PowerShell`.
2. Filtrez les fichiers ayant une taille supérieure à 1 Mo et affichez leur **nom** et **taille**.
3. Filtrez les fichiers modifiés au cours des 7 derniers jours.
4. Filtrez les fichiers dont le nom contient `"rapport"` (insensible à la casse).



### **Exercice 5 : Sélectionner et Trier des Objets**

1. Listez tous les fichiers `.log` dans le répertoire `C:\TP_PowerShell`.
2. Triez-les par leur **date de dernière modification** en ordre décroissant.
3. Sélectionnez les 5 derniers fichiers modifiés et affichez leurs **noms** et **dates**.
4. Créez une liste contenant uniquement les **chemins complets** des 3 fichiers les plus volumineux.


### **Exercice 6 : Analyse Dynamique avec Boucles et Sélecteurs**

1. Déclarez un tableau `$Produits` contenant des hash tables avec les clés :
   - `Nom`
   - `Prix`
   - `Stock`
2. Utilisez une boucle **`foreach`** pour afficher tous les produits en stock.
3. Filtrez les produits ayant un prix supérieur à 100 € avec **`Where-Object`**.
4. Triez les produits par prix décroissant et affichez les 3 plus chers avec **`Select-Object`**.

