### TP PowerShell : Structures Conditionnelles, Boucles et Filtres/Sélecteurs (Sans Scripts)

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