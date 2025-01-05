### TP PowerShell : Manipulation Avancée de Variables, Tableaux et Hash Tables (Sans Scripts)

---

### **Exercice 1 : Analyse Avancée des Étudiants**

1. Déclarez un tableau `$Etudiants` contenant les informations suivantes pour 3 étudiants :
   - `Nom`
   - `Classe`
   - `Notes` (tableau de 3 notes pour chaque étudiant).
2. Affichez le **nom** et la **moyenne** de chaque étudiant.
3. Ajoutez une nouvelle note `20` à chaque tableau de notes.
4. Affichez uniquement les étudiants ayant une moyenne supérieure à `15`.

---

### **Exercice 2 : Gestion d'un Stock**

1. Déclarez une hash table `$Stock` représentant l'inventaire suivant :
   - `Ordinateurs` : `10`
   - `Claviers` : `20`
   - `Souris` : `15`
   - `Écrans` : `8`
2. Calculez et affichez la quantité totale de tous les produits.
3. Ajoutez un nouveau produit `Casques` avec une quantité de `12`.
4. Réduisez la quantité de chaque produit de `2` unités sans aller en dessous de `0`.
5. Affichez tous les produits ayant une quantité inférieure à `10`.

---

### **Exercice 3 : Fusion et Tri de Données Client**

1. Déclarez deux tableaux :
   - `$ClientsEurope` avec 2 clients (`Nom`, `Pays`, `Dépenses`).
   - `$ClientsUSA` avec 2 clients (`Nom`, `Pays`, `Dépenses`).
2. Fusionnez ces tableaux en un seul tableau `$TousLesClients`.
3. Triez les clients par leurs dépenses en ordre décroissant.
4. Affichez les 3 clients ayant dépensé le plus.

---

### **Exercice 4 : Collecte d’Informations sur les Fichiers**

1. Listez tous les fichiers `.txt` dans `C:\TP_PowerShell` et créez un tableau `$FichiersInfos` contenant les informations suivantes pour chaque fichier :
   - `Nom`
   - `Taille (Ko)`
   - `Chemin`
2. Affichez la **taille totale** de tous les fichiers `.txt`.
3. Triez et affichez les fichiers par leur taille en ordre croissant.

---

### **Exercice 5 : Gestion et Rapport des Serveurs**

1. Déclarez un tableau `$Serveurs` contenant 3 hash tables représentant des serveurs avec les informations suivantes :
   - `Nom`
   - `IP`
   - `Statut` (Running ou Stopped).
2. Affichez uniquement les serveurs avec un statut **Running**.
3. Changez le statut de tous les serveurs **Stopped** à **Running**.
4. Exportez les informations de tous les serveurs dans un fichier CSV `ServeursReport.csv`.
5. Générez un rapport HTML listant les serveurs triés par leur nom.

