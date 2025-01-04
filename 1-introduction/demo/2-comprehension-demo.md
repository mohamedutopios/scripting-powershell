Voici plusieurs démonstrations variées pour **écrire, exécuter et déboguer un script PowerShell**, avec des exemples concrets et pratiques.

---

### **1. Créer et exécuter un script PowerShell simple**
#### Étape 1 : Créer un fichier PowerShell
1. Ouvrez Visual Studio Code ou un autre éditeur compatible.
2. Créez un nouveau fichier (`File > New File`) et sauvegardez-le avec une extension `.ps1`, par exemple : `example.ps1`.

#### Étape 2 : Écrire un script simple
Ajoutez le code suivant dans le fichier :
```powershell
# Script simple pour afficher une salutation
$name = Read-Host "Entrez votre nom"
Write-Host "Bonjour, $name ! Bienvenue dans PowerShell" -ForegroundColor Green
```

#### Étape 3 : Exécuter le script
- **Depuis Visual Studio Code :**
  - Cliquez sur le triangle vert en haut à droite (**Run Script**).
  - Utilisez le raccourci clavier `F5` pour exécuter le script.
- **Depuis PowerShell :**
  - Ouvrez PowerShell, naviguez jusqu’au dossier contenant le script, et exécutez :
    ```powershell
    .\example.ps1
    ```

---

### **2. Script avec logique conditionnelle et boucle**
Ajoutez ce script dans un fichier nommé `check-number.ps1` :
```powershell
# Script pour vérifier si un nombre est pair ou impair
$number = Read-Host "Entrez un nombre"

if ($number % 2 -eq 0) {
    Write-Host "$number est pair" -ForegroundColor Blue
} else {
    Write-Host "$number est impair" -ForegroundColor Yellow
}

# Boucle pour afficher les 5 premiers multiples de ce nombre
Write-Host "Les 5 premiers multiples de $number sont :" -ForegroundColor Green
for ($i = 1; $i -le 5; $i++) {
    Write-Host ($number * $i)
}
```

#### Exécution :
- Sauvegardez le fichier et exécutez comme expliqué dans la **démonstration précédente**.

---

### **3. Déboguer un script avec un point d’arrêt**
#### Étape 1 : Écrire un script à déboguer
Créez un fichier `debug-example.ps1` :
```powershell
# Script de calcul simple
$a = 5
$b = 10
$c = $a + $b

Write-Host "La somme de $a et $b est $c" -ForegroundColor Cyan
```

#### Étape 2 : Ajouter un point d’arrêt
1. Ouvrez le fichier dans Visual Studio Code.
2. Cliquez dans la marge gauche, à côté de la ligne `$c = $a + $b`. Un point rouge apparaît (point d'arrêt).

#### Étape 3 : Lancer le débogage
1. Appuyez sur `F5` pour lancer le débogage.
2. Lorsque le script s’arrête au point d’arrêt, utilisez les commandes suivantes :
   - **Step Into** : Avance ligne par ligne dans le script.
   - **Step Over** : Exécute la ligne courante et passe à la suivante.
   - **Step Out** : Termine la fonction ou le bloc courant.

#### Étape 4 : Inspecter les variables
- Placez votre souris sur `$a`, `$b`, ou `$c` pour voir leurs valeurs actuelles.
- Regardez dans la fenêtre des **Variables** dans Visual Studio Code.

---

### **4. Script interactif avec débogage**
Créez un fichier `interactive-debug.ps1` :
```powershell
# Script interactif avec calculs
Write-Host "Script interactif de calcul" -ForegroundColor Green

$number1 = Read-Host "Entrez le premier nombre"
$number2 = Read-Host "Entrez le second nombre"

$result = $number1 + $number2
Write-Host "La somme de $number1 et $number2 est : $result" -ForegroundColor Cyan

if ($result -gt 10) {
    Write-Host "Résultat supérieur à 10 !" -ForegroundColor Yellow
} else {
    Write-Host "Résultat inférieur ou égal à 10." -ForegroundColor Blue
}
```

#### Débogage :
- Ajoutez un point d’arrêt à la ligne `$result = $number1 + $number2`.
- Lancez le script en mode débogage (`F5`) et suivez l’exécution.

---

### **5. Utiliser des fonctions dans un script**
Créez un fichier `function-script.ps1` :
```powershell
# Fonction pour calculer la factorielle d’un nombre
function Get-Factorial {
    param([int]$n)

    if ($n -le 1) {
        return 1
    } else {
        return $n * (Get-Factorial -n ($n - 1))
    }
}

# Demander à l'utilisateur un nombre
$number = Read-Host "Entrez un nombre"
$result = Get-Factorial -n $number

Write-Host "La factorielle de $number est $result" -ForegroundColor Green
```

#### Exécution :
- Sauvegardez et exécutez le script pour tester la fonction.
- Ajoutez un point d’arrêt dans la fonction pour observer l’exécution ligne par ligne.

---

### **6. Déboguer un script complexe avec des erreurs potentielles**
Créez un fichier `debug-errors.ps1` :
```powershell
# Script avec une erreur intentionnelle
Write-Host "Début du script" -ForegroundColor Green

$a = 10
$b = 0

try {
    # Division potentiellement problématique
    $result = $a / $b
    Write-Host "Résultat : $result" -ForegroundColor Cyan
} catch {
    Write-Host "Erreur détectée : $_" -ForegroundColor Red
}

Write-Host "Fin du script" -ForegroundColor Yellow
```

#### Débogage :
1. Ajoutez un point d’arrêt à la ligne `$result = $a / $b`.
2. Lancez le débogage (`F5`) pour observer comment l’erreur est gérée.

---

Ces démonstrations vous permettent d’explorer la création, l’exécution, et le débogage de scripts PowerShell avec des exemples progressifs. N’hésitez pas à les adapter ou demander d’autres variantes !