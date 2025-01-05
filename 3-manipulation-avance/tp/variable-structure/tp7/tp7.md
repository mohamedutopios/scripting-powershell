### TP PowerShell : Déclaration et Utilisation de Variables

---

### **Exercice 1 : Manipulation de Variables**

1. Déclarez une variable `$Nom` contenant la valeur `"Alice"`.
2. Déclarez une variable `$Age` contenant l'âge `30`.
3. Affichez le contenu des deux variables dans la console.
4. Modifiez la variable `$Age` pour qu'elle contienne `31` et affichez le nouveau contenu.

---

### **Exercice 2 : Types de Données et Conversions**

1. Déclarez une variable `$Nombre` contenant `"42"` (comme chaîne).
2. Convertissez `$Nombre` en un entier.
3. Affichez le type de la variable `$Nombre` avant et après la conversion.

---

### **Exercice 3 : Tableaux Simples**

1. Déclarez un tableau `$Nombres` contenant les valeurs `10, 20, 30, 40`.
2. Ajoutez le nombre `50` à ce tableau.
3. Affichez tous les éléments du tableau.
4. Filtrez et affichez uniquement les nombres supérieurs à 25.

---

### **Exercice 4 : Tableaux Associatifs (Hash Tables)**

1. Déclarez une hash table `$Infos` avec les clés suivantes :
   - `Nom` : `"Alice"`
   - `Âge` : `30`
   - `Ville` : `"Paris"`
2. Affichez la valeur associée à la clé `Ville`.
3. Ajoutez une clé `Pays` avec la valeur `"France"`.
4. Modifiez la clé `Ville` pour qu'elle contienne `"Lyon"`.
5. Affichez toutes les clés et leurs valeurs.

---

### **Exercice 5 : Gestion d’un Inventaire**

1. Déclarez un tableau `$Produits` contenant 3 hash tables représentant des produits :
   - Produit 1 : `{ ID = 1; Nom = "Ordinateur"; Prix = 800 }`
   - Produit 2 : `{ ID = 2; Nom = "Clavier"; Prix = 50 }`
   - Produit 3 : `{ ID = 3; Nom = "Souris"; Prix = 25 }`
2. Affichez les noms et prix de tous les produits.
3. Ajoutez un nouveau produit : `{ ID = 4; Nom = "Écran"; Prix = 200 }`.
4. Filtrez les produits dont le prix est supérieur à 100 €.

---

### **Exercice 6 : Analyse et Transformation**

1. Déclarez un tableau `$Notes` contenant les notes `12, 15, 18, 10, 14`.
2. Calculez la moyenne des notes et affichez-la.
3. Transformez chaque note en ajoutant 2 points, sauf si la note est déjà `18`.
4. Affichez toutes les notes transformées.

---

### **Solutions**

---

#### **Exercice 1 : Manipulation de Variables**
```powershell
# Déclaration
$Nom = "Alice"
$Age = 30

# Affichage
Write-Output $Nom
Write-Output $Age

# Modification
$Age = 31
Write-Output $Age
```

---

#### **Exercice 2 : Types de Données et Conversions**
```powershell
# Déclaration
$Nombre = "42"

# Affichage du type initial
$Nombre.GetType()

# Conversion
$Nombre = [int]$Nombre

# Affichage du type après conversion
$Nombre.GetType()
```

---

#### **Exercice 3 : Tableaux Simples**
```powershell
# Déclaration
$Nombres = @(10, 20, 30, 40)

# Ajout d'un élément
$Nombres += 50

# Affichage
Write-Output $Nombres

# Filtrage
$Nombres | Where-Object { $_ -gt 25 }
```

---

#### **Exercice 4 : Tableaux Associatifs (Hash Tables)**
```powershell
# Déclaration
$Infos = @{
    Nom = "Alice"
    Âge = 30
    Ville = "Paris"
}

# Affichage d'une clé
Write-Output $Infos["Ville"]

# Ajout et modification
$Infos["Pays"] = "France"
$Infos["Ville"] = "Lyon"

# Affichage des clés et valeurs
foreach ($Cle in $Infos.Keys) {
    Write-Output "$Cle : $($Infos[$Cle])"
}
```

---

#### **Exercice 5 : Gestion d’un Inventaire**
```powershell
# Déclaration
$Produits = @(
    @{ID = 1; Nom = "Ordinateur"; Prix = 800}
    @{ID = 2; Nom = "Clavier"; Prix = 50}
    @{ID = 3; Nom = "Souris"; Prix = 25}
)

# Affichage
foreach ($Produit in $Produits) {
    Write-Output "Nom : $($Produit.Nom), Prix : $($Produit.Prix)€"
}

# Ajout d'un produit
$NouveauProduit = @{ID = 4; Nom = "Écran"; Prix = 200}
$Produits += $NouveauProduit

# Filtrage
$Produits | Where-Object { $_.Prix -gt 100 }
```

---

#### **Exercice 6 : Analyse et Transformation**
```powershell
# Déclaration
$Notes = @(12, 15, 18, 10, 14)

# Calcul de la moyenne
$Moyenne = ($Notes | Measure-Object -Average).Average
Write-Output "Moyenne : $Moyenne"

# Transformation
$NotesTransformees = $Notes | ForEach-Object {
    if ($_ -ne 18) {
        $_ + 2
    } else {
        $_
    }
}

# Affichage des notes transformées
Write-Output $NotesTransformees
```

---

### **Explications des Concepts Avancés**

1. **Filtres et Transformations** :
   - Les pipelines permettent de manipuler les données efficacement.
   - **`Where-Object`** et **`ForEach-Object`** sont essentiels pour filtrer ou transformer les données.

2. **Structures de Données Dynamiques** :
   - Les tableaux et hash tables offrent une flexibilité dans la gestion de collections et d’objets complexes.

3. **Calculs Dynamiques** :
   - Les cmdlets comme **`Measure-Object`** permettent d'effectuer des calculs comme la moyenne ou la somme sur des ensembles de données.