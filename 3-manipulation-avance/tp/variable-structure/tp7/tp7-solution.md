### TP PowerShell : Déclaration et Utilisation de Variables

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

