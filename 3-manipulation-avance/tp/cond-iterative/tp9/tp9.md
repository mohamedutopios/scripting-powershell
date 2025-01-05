### TP PowerShell : Structures Conditionnelles, Boucles et Filtres/Sélecteurs (Sans Scripts)

---

### **Exercice 1 : Analyse avec des Conditions**

1. Déclarez une variable `$Nombre` contenant un entier entre -10 et 10.
2. Utilisez une structure **`if-elseif-else`** pour afficher :
   - "Nombre négatif" si `$Nombre` est inférieur à 0.
   - "Nombre nul" si `$Nombre` est égal à 0.
   - "Nombre positif" si `$Nombre` est supérieur à 0.

---

### **Exercice 2 : Gestion avec `switch`**

1. Déclarez une variable `$Jour` contenant un jour de la semaine (par exemple, `"Lundi"`).
2. Utilisez **`switch`** pour afficher :
   - "Début de semaine" si `$Jour` est `"Lundi"`.
   - "Weekend !" si `$Jour` est `"Samedi"` ou `"Dimanche"`.
   - "Jour ordinaire" pour tout autre jour.

---

### **Exercice 3 : Boucles sur une Liste de Fichiers**

1. Listez tous les fichiers dans le répertoire `C:\TP_PowerShell`.
2. Utilisez une boucle **`foreach`** pour afficher les noms de tous les fichiers.
3. Ajoutez une boucle **`for`** pour afficher les noms des 3 premiers fichiers de la liste.
4. Avec une boucle **`while`**, affichez les noms des fichiers jusqu'à rencontrer un fichier dont le nom commence par `"Log"`.

---

### **Exercice 4 : Filtres Dynamiques avec `Where-Object`**

1. Listez tous les fichiers dans le répertoire `C:\TP_PowerShell`.
2. Filtrez les fichiers ayant une taille supérieure à 1 Mo et affichez leur **nom** et **taille**.
3. Filtrez les fichiers modifiés au cours des 7 derniers jours.
4. Filtrez les fichiers dont le nom contient `"rapport"` (insensible à la casse).

---

### **Exercice 5 : Sélectionner et Trier des Objets**

1. Listez tous les fichiers `.log` dans le répertoire `C:\TP_PowerShell`.
2. Triez-les par leur **date de dernière modification** en ordre décroissant.
3. Sélectionnez les 5 derniers fichiers modifiés et affichez leurs **noms** et **dates**.
4. Créez une liste contenant uniquement les **chemins complets** des 3 fichiers les plus volumineux.

---

### **Exercice 6 : Analyse Dynamique avec Boucles et Sélecteurs**

1. Déclarez un tableau `$Produits` contenant des hash tables avec les clés :
   - `Nom`
   - `Prix`
   - `Stock`
2. Utilisez une boucle **`foreach`** pour afficher tous les produits en stock.
3. Filtrez les produits ayant un prix supérieur à 100 € avec **`Where-Object`**.
4. Triez les produits par prix décroissant et affichez les 3 plus chers avec **`Select-Object`**.

---

### **Solutions**

---

#### **Exercice 1 : Analyse avec des Conditions**
```powershell
# Déclaration
$Nombre = Get-Random -Minimum -10 -Maximum 10

# Condition
if ($Nombre -lt 0) {
    Write-Output "Nombre négatif"
} elseif ($Nombre -eq 0) {
    Write-Output "Nombre nul"
} else {
    Write-Output "Nombre positif"
}
```

---

#### **Exercice 2 : Gestion avec `switch`**
```powershell
# Déclaration
$Jour = "Lundi"

# Switch
switch ($Jour) {
    "Lundi" { Write-Output "Début de semaine" }
    "Samedi" { Write-Output "Weekend !" }
    "Dimanche" { Write-Output "Weekend !" }
    Default { Write-Output "Jour ordinaire" }
}
```

---

#### **Exercice 3 : Boucles sur une Liste de Fichiers**
```powershell
# Lister les fichiers
$Fichiers = Get-ChildItem -Path "C:\TP_PowerShell"

# Foreach
foreach ($Fichier in $Fichiers) {
    Write-Output $Fichier.Name
}

# For
for ($i = 0; $i -lt 3; $i++) {
    Write-Output $Fichiers[$i].Name
}

# While
$i = 0
while ($i -lt $Fichiers.Count -and $Fichiers[$i].Name -notlike "Log*") {
    Write-Output $Fichiers[$i].Name
    $i++
}
```

---

#### **Exercice 4 : Filtres Dynamiques avec `Where-Object`**
```powershell
# Lister les fichiers
$Fichiers = Get-ChildItem -Path "C:\TP_PowerShell"

# Taille > 1 Mo
$Fichiers | Where-Object { $_.Length -gt 1MB } | Select-Object Name, @{Name="Taille (Ko)"; Expression={[math]::Round($_.Length / 1KB, 2)}}

# Modifiés au cours des 7 derniers jours
$Fichiers | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }

# Nom contenant "rapport" (insensible à la casse)
$Fichiers | Where-Object { $_.Name -match "rapport" }
```

---

#### **Exercice 5 : Sélectionner et Trier des Objets**
```powershell
# Fichiers .log
$FichiersLog = Get-ChildItem -Path "C:\TP_PowerShell" -Filter *.log

# Trier par date décroissante
$FichiersTries = $FichiersLog | Sort-Object -Property LastWriteTime -Descending

# Sélectionner les 5 derniers
$FichiersTries | Select-Object -Last 5 | Select-Object Name, LastWriteTime

# 3 fichiers les plus volumineux
$FichiersLog | Sort-Object -Property Length -Descending | Select-Object -First 3 -ExpandProperty FullName
```

---

#### **Exercice 6 : Analyse Dynamique avec Boucles et Sélecteurs**
```powershell
# Déclaration
$Produits = @(
    @{Nom = "Ordinateur"; Prix = 800; Stock = 5}
    @{Nom = "Clavier"; Prix = 50; Stock = 20}
    @{Nom = "Écran"; Prix = 200; Stock = 8}
    @{Nom = "Souris"; Prix = 25; Stock = 15}
)

# Produits en stock
$Produits | Where-Object { $_.Stock -gt 0 }

# Produits avec prix > 100 €
$Produits | Where-Object { $_.Prix -gt 100 }

# Trier par prix décroissant et afficher les 3 plus chers
$Produits | Sort-Object -Property Prix -Descending | Select-Object -First 3
``` 

Ces exercices combinent **conditions**, **boucles**, **filtres**, et **sélecteurs** pour offrir une manipulation avancée des données.