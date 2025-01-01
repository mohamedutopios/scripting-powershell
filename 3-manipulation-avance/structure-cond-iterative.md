### **Structures Conditionnelles, Boucles et Filtres/Sélecteurs en PowerShell**

---

### **1. Structures Conditionnelles**

#### **a. `if`**
Le `if` permet d'exécuter des blocs de code en fonction d'une ou plusieurs conditions.

##### **Syntaxe :**
```powershell
if (<condition>) {
    <instructions>
} elseif (<condition>) {
    <instructions>
} else {
    <instructions>
}
```

##### **Exemple :**
```powershell
$Nombre = 10

if ($Nombre -lt 0) {
    Write-Output "Nombre négatif"
} elseif ($Nombre -eq 0) {
    Write-Output "Nombre nul"
} else {
    Write-Output "Nombre positif"
}
```

---

#### **b. `switch`**
Le `switch` permet d'évaluer une variable ou une expression contre plusieurs cas.

##### **Syntaxe :**
```powershell
switch (<expression>) {
    <valeur1> { <instructions> }
    <valeur2> { <instructions> }
    Default { <instructions> }
}
```

##### **Exemple :**
```powershell
$Jour = "Mardi"

switch ($Jour) {
    "Lundi" { Write-Output "Début de la semaine" }
    "Samedi" { Write-Output "Weekend !" }
    "Dimanche" { Write-Output "Weekend !" }
    Default { Write-Output "Jour ordinaire" }
}
```

---

### **2. Boucles**

#### **a. `for`**
La boucle `for` est utilisée pour exécuter un bloc de code un nombre défini de fois.

##### **Syntaxe :**
```powershell
for (<initialisation>; <condition>; <incrément>) {
    <instructions>
}
```

##### **Exemple :**
```powershell
for ($i = 1; $i -le 5; $i++) {
    Write-Output "Itération $i"
}
```

---

#### **b. `foreach`**
La boucle `foreach` permet d'itérer sur chaque élément d'une collection.

##### **Syntaxe :**
```powershell
foreach ($element in <collection>) {
    <instructions>
}
```

##### **Exemple :**
```powershell
$Liste = @(10, 20, 30)

foreach ($Valeur in $Liste) {
    Write-Output "Valeur : $Valeur"
}
```

---

#### **c. `while`**
La boucle `while` exécute un bloc de code tant qu'une condition est vraie.

##### **Syntaxe :**
```powershell
while (<condition>) {
    <instructions>
}
```

##### **Exemple :**
```powershell
$Compteur = 1
while ($Compteur -le 5) {
    Write-Output "Compteur : $Compteur"
    $Compteur++
}
```

---

#### **d. `do-until`**
La boucle `do-until` exécute un bloc de code au moins une fois, puis continue tant qu'une condition est fausse.

##### **Syntaxe :**
```powershell
do {
    <instructions>
} until (<condition>)
```

##### **Exemple :**
```powershell
$Compteur = 1
do {
    Write-Output "Compteur : $Compteur"
    $Compteur++
} until ($Compteur -gt 5)
```

---

### **3. Utilisation des Filtres (`Where-Object`)**

#### **Description :**
`Where-Object` filtre une collection d'objets selon une condition définie.

##### **Syntaxe :**
```powershell
<collection> | Where-Object { <condition> }
```

##### **Exemples :**
1. **Filtrer les fichiers de plus de 1 Mo dans un dossier :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Where-Object { $_.Length -gt 1MB }
   ```

2. **Afficher les processus consommant plus de 10 % de CPU :**
   ```powershell
   Get-Process | Where-Object { $_.CPU -gt 10 }
   ```

3. **Lister les services démarrés :**
   ```powershell
   Get-Service | Where-Object { $_.Status -eq "Running" }
   ```

---

### **4. Utilisation des Sélecteurs (`Select-Object`)**

#### **Description :**
`Select-Object` sélectionne des propriétés spécifiques d'une collection d'objets ou limite les résultats.

##### **Syntaxe :**
```powershell
<collection> | Select-Object [-Property <Propriétés>] [-First <Nombre>] [-Last <Nombre>]
```

##### **Exemples :**
1. **Sélectionner des propriétés spécifiques :**
   ```powershell
   Get-Process | Select-Object Name, CPU
   ```

2. **Limiter les résultats aux 5 premiers éléments :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Select-Object -First 5
   ```

3. **Récupérer les 3 derniers fichiers modifiés :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Sort-Object LastWriteTime -Descending | Select-Object -Last 3
   ```

---

### **Exemple Complet**

#### **Contexte : Gestion des fichiers dans un répertoire**
```powershell
# Parcourir les fichiers d'un répertoire
$Fichiers = Get-ChildItem -Path C:\Temp

# Filtrer les fichiers de plus de 1 Mo
$FichiersGrands = $Fichiers | Where-Object { $_.Length -gt 1MB }

# Trier les fichiers par taille décroissante et sélectionner les 3 premiers
$TopFichiers = $FichiersGrands | Sort-Object -Property Length -Descending | Select-Object -First 3

# Afficher les fichiers sélectionnés
foreach ($Fichier in $TopFichiers) {
    Write-Output "Nom : $($Fichier.Name), Taille : $($Fichier.Length)"
}
```

---

### **Résumé des Cmdlets**

| Concept              | Cmdlet ou Structure       | Description                                         |
|----------------------|---------------------------|---------------------------------------------------|
| **Conditionnelles**  | `if`, `switch`           | Exécution conditionnelle des blocs de code.      |
| **Boucles**          | `for`, `foreach`, `while`, `do-until` | Répétition de blocs de code selon des conditions. |
| **Filtrage**         | `Where-Object`           | Filtre les objets en fonction de conditions.      |
| **Sélection**        | `Select-Object`          | Sélectionne des propriétés ou limite les résultats.|

---

### **Conclusion**
PowerShell offre une grande flexibilité grâce à ses structures conditionnelles, ses boucles, ses filtres et ses sélecteurs. Ces outils permettent de créer des scripts puissants pour manipuler des objets, filtrer des données et automatiser des tâches complexes.