Voici des exemples variés, mais **plus simples** et directement exploitables.

---

### **1. Structures Conditionnelles**

#### **a. Vérifier si un fichier existe (`if`)**
```powershell
$FilePath = "C:\Temp\example.txt"

if (Test-Path -Path $FilePath) {
    Write-Output "Le fichier existe."
} else {
    Write-Output "Le fichier n'existe pas."
}
```

---

#### **b. Contrôler la validité d'une saisie utilisateur (`if-elseif-else`)**
```powershell
$Input = Read-Host "Entrez un nombre"

if ($Input -lt 0) {
    Write-Output "Le nombre est négatif."
} elseif ($Input -eq 0) {
    Write-Output "Le nombre est nul."
} else {
    Write-Output "Le nombre est positif."
}
```

---

#### **c. Vérifier le jour de la semaine (`switch`)**
```powershell
$Jour = Get-Date -UFormat "%A"  # Obtenir le jour actuel en anglais (Monday, Tuesday, etc.)

switch ($Jour) {
    "Monday" { Write-Output "C'est lundi, début de la semaine !" }
    "Saturday" { Write-Output "C'est le week-end !" }
    "Sunday" { Write-Output "C'est le week-end !" }
    Default { Write-Output "C'est un jour de semaine." }
}
```

---

### **2. Structures Itératives**

#### **a. Afficher les nombres de 1 à 5 (`for`)**
```powershell
for ($i = 1; $i -le 5; $i++) {
    Write-Output "Nombre : $i"
}
```

---

#### **b. Parcourir une liste de noms (`foreach`)**
```powershell
$Noms = @("Alice", "Bob", "Charlie")

foreach ($Nom in $Noms) {
    Write-Output "Bonjour, $Nom !"
}
```

---

#### **c. Compter jusqu'à 3 avec une condition (`while`)**
```powershell
$Compteur = 1

while ($Compteur -le 3) {
    Write-Output "Compteur : $Compteur"
    $Compteur++
}
```

---

#### **d. Demander un mot de passe au moins 6 caractères (`do-until`)**
```powershell
do {
    $MotDePasse = Read-Host "Entrez un mot de passe (au moins 6 caractères)"
} until ($MotDePasse.Length -ge 6)

Write-Output "Mot de passe valide."
```

---

#### **e. Doubler les valeurs dans une liste (`foreach-object`)**
```powershell
@(1, 2, 3, 4) | ForEach-Object {
    Write-Output "$_ x 2 = $($_ * 2)"
}
```

---

### **Combinaisons Simples**

#### **a. Identifier les fichiers textes dans un dossier**
```powershell
$Dossier = "C:\Temp"

Get-ChildItem -Path $Dossier -File | Where-Object { $_.Extension -eq ".txt" } | ForEach-Object {
    Write-Output "Fichier texte : $($_.Name)"
}
```

---

#### **b. Vérifier plusieurs services**
```powershell
$Services = @("wuauserv", "spooler")

foreach ($Service in $Services) {
    $Status = (Get-Service -Name $Service).Status
    if ($Status -eq "Running") {
        Write-Output "Le service $Service est en cours d'exécution."
    } else {
        Write-Output "Le service $Service est arrêté."
    }
}
```

---

Ces exemples sont **simples** mais restent utiles pour des cas réels et couvrent une variété de situations. Si vous voulez d'autres ajustements ou de nouveaux exemples, dites-le-moi !