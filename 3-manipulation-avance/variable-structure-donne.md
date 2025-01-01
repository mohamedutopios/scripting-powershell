### **Déclaration et Utilisation de Variables en PowerShell**

---

#### **1. Déclaration de Variables**

- En PowerShell, les variables commencent toujours par un symbole `$`.
- Une variable peut être déclarée et initialisée sans type explicite (PowerShell est typé dynamiquement).

#### **Syntaxe :**
```powershell
$NomVariable = Valeur
```

#### **Exemples :**
1. **Déclarer et assigner une valeur à une variable :**
   ```powershell
   $Nom = "Alice"
   $Age = 30
   ```

2. **Afficher la valeur d’une variable :**
   ```powershell
   Write-Output $Nom
   ```

3. **Modifier la valeur d’une variable :**
   ```powershell
   $Age = 31
   ```

---

#### **2. Variables automatiques**
PowerShell fournit des **variables automatiques** qui stockent des informations spécifiques.

| Variable      | Description                              |
|---------------|------------------------------------------|
| `$PSVersionTable` | Informations sur la version PowerShell. |
| `$HOME`       | Répertoire personnel de l’utilisateur.   |
| `$Error`      | Liste des dernières erreurs rencontrées. |

#### **Exemple :**
```powershell
Write-Output $HOME
```

---

### **Types de Données en PowerShell**

PowerShell supporte plusieurs types de données. Les types sont déterminés automatiquement ou peuvent être spécifiés explicitement.

#### **Types courants :**
| Type         | Exemple                        |
|--------------|--------------------------------|
| String       | `"Hello, World"`               |
| Int32        | `42`                           |
| Double       | `3.14`                         |
| Boolean      | `$true`, `$false`              |
| Array        | `@(1, 2, 3)`                   |
| HashTable    | `@{Key = "Value"}`             |
| DateTime     | `[datetime]::Now`              |

#### **Déclaration explicite d’un type :**
```powershell
[int]$Age = 25
[string]$Nom = "Alice"
```

#### **Conversion de type :**
1. **Convertir une chaîne en entier :**
   ```powershell
   $Nombre = [int]"42"
   ```

2. **Obtenir le type d’une variable :**
   ```powershell
   $Variable = 3.14
   $Variable.GetType()
   ```

---

### **Tableaux en PowerShell**

Un **tableau** (Array) est une collection ordonnée d’éléments, accessible via des indices.

#### **Déclaration d’un tableau :**
1. **Tableau simple :**
   ```powershell
   $Nombres = @(1, 2, 3, 4, 5)
   ```

2. **Accéder aux éléments du tableau :**
   ```powershell
   $Nombres[0]  # Premier élément
   $Nombres[-1] # Dernier élément
   ```

3. **Ajouter un élément à un tableau :**
   ```powershell
   $Nombres += 6
   ```

4. **Itérer sur un tableau :**
   ```powershell
   foreach ($Nombre in $Nombres) {
       Write-Output $Nombre
   }
   ```

#### **Méthodes de tableau :**
- Obtenir le nombre d’éléments :
  ```powershell
  $Nombres.Count
  ```

- Filtrer les éléments :
  ```powershell
  $Nombres | Where-Object {$_ -gt 3}
  ```

---

### **Tableaux Associatifs (Hash Tables)**

Les **hash tables** sont des collections de paires clé-valeur.

#### **Déclaration d’une hash table :**
```powershell
$Infos = @{
    Nom = "Alice"
    Age = 30
    Ville = "Paris"
}
```

#### **Accéder à une valeur par clé :**
```powershell
$Infos["Nom"]  # Renvoie "Alice"
```

#### **Ajouter ou modifier une entrée :**
1. **Ajouter une clé :**
   ```powershell
   $Infos["Pays"] = "France"
   ```

2. **Modifier une valeur :**
   ```powershell
   $Infos["Ville"] = "Lyon"
   ```

#### **Itérer sur une hash table :**
```powershell
foreach ($Cle in $Infos.Keys) {
    Write-Output "$Cle : $($Infos[$Cle])"
}
```

#### **Exemple pratique :**
```powershell
$Serveurs = @{
    "Web" = "192.168.1.1"
    "DB" = "192.168.1.2"
    "Mail" = "192.168.1.3"
}

# Afficher tous les serveurs
foreach ($Role in $Serveurs.Keys) {
    Write-Output "$Role : $($Serveurs[$Role])"
}
```

---

### **Exemple Complet : Variables, Tableaux et Hash Tables**

#### **Contexte : Gestion d’un inventaire de produits**
```powershell
# Déclaration d’un tableau de produits
$Produits = @(
    @{ID = 1; Nom = "Ordinateur"; Prix = 800}
    @{ID = 2; Nom = "Clavier"; Prix = 50}
    @{ID = 3; Nom = "Souris"; Prix = 25}
)

# Afficher tous les produits
foreach ($Produit in $Produits) {
    Write-Output "ID: $($Produit.ID), Nom: $($Produit.Nom), Prix: $($Produit.Prix)€"
}

# Ajouter un produit
$NouveauProduit = @{ID = 4; Nom = "Écran"; Prix = 200}
$Produits += $NouveauProduit

# Filtrer les produits à plus de 100 €
$Produits | Where-Object { $_.Prix -gt 100 }
```

---

### **Résumé des Concepts**

| Concept                 | Description                                   |
|-------------------------|-----------------------------------------------|
| **Variables**           | Stockent des données avec `$` comme préfixe. |
| **Types de données**    | Incluent chaînes, nombres, booléens, etc.    |
| **Tableaux**            | Collections ordonnées d’éléments.            |
| **Hash Tables**         | Collections clé-valeur.                      |

---

### **Conclusion**
PowerShell offre une flexibilité dans la manipulation des données grâce aux variables, tableaux et hash tables. Ces structures permettent de gérer des données complexes, d'automatiser des tâches et de répondre efficacement aux besoins d'administration.