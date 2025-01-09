Voici une nouvelle série d’exemples pour les **structures conditionnelles** et **itératives** dans PowerShell, distincts de ceux fournis précédemment. Ces exemples abordent des scénarios variés et réalistes.

---

### **1. Structures Conditionnelles**

#### **a. Utilisation de `if` pour contrôler un service Windows**
```powershell
$ServiceName = "wuauserv"
$ServiceStatus = (Get-Service -Name $ServiceName).Status

if ($ServiceStatus -eq "Running") {
    Write-Output "Le service $ServiceName est en cours d'exécution."
} elseif ($ServiceStatus -eq "Stopped") {
    Write-Output "Le service $ServiceName est arrêté. Tentative de démarrage..."
    Start-Service -Name $ServiceName
    Write-Output "Service démarré."
} else {
    Write-Output "État inconnu pour le service $ServiceName."
}
```

---

#### **b. Gestion des droits utilisateurs avec `switch`**
```powershell
$RoleUtilisateur = "Editor"

switch ($RoleUtilisateur) {
    "Admin" { Write-Output "Accès complet autorisé." }
    "Editor" { Write-Output "Accès en modification autorisé." }
    "Viewer" { Write-Output "Accès en lecture seul autorisé." }
    Default { Write-Output "Accès refusé." }
}
```

---

#### **c. Validation d’un mot de passe avec plusieurs conditions**
```powershell
$MotDePasse = "Secure123"

if ($MotDePasse.Length -ge 8 -and $MotDePasse -match "[A-Z]" -and $MotDePasse -match "\d") {
    Write-Output "Mot de passe valide."
} else {
    Write-Output "Mot de passe invalide. Assurez-vous qu'il contient au moins 8 caractères, une majuscule et un chiffre."
}
```

---

#### **d. `switch` avec conditions multiples dans un seul cas**
```powershell
$CPUUsage = 85

switch ($CPUUsage) {
    {$_ -lt 50} { Write-Output "Utilisation CPU normale : $CPUUsage%." }
    {$_ -ge 50 -and $_ -lt 80} { Write-Output "Utilisation CPU modérée : $CPUUsage%." }
    {$_ -ge 80} { Write-Output "⚠️ Attention : Utilisation CPU élevée : $CPUUsage%." }
}
```

---

### **2. Structures Itératives**

#### **a. Boucle `for` pour surveiller la mémoire des processus**
```powershell
$Processes = Get-Process
for ($i = 0; $i -lt $Processes.Count; $i++) {
    $Process = $Processes[$i]
    if ($Process.WorkingSet -gt 500MB) {
        Write-Output "Processus gourmand : $($Process.Name) utilise $($Process.WorkingSet / 1MB) Mo."
    }
}
```

---

#### **b. Boucle `foreach` pour sauvegarder des fichiers**
```powershell
$Dossiers = @("C:\Projets", "C:\Documents", "C:\Photos")
$Destination = "C:\Sauvegardes"

foreach ($Dossier in $Dossiers) {
    $NomArchive = "$Destination\$((Get-Item -Path $Dossier).Name).zip"
    Compress-Archive -Path $Dossier -DestinationPath $NomArchive
    Write-Output "Sauvegarde créée : $NomArchive"
}
```

---

#### **c. Boucle `while` pour surveiller l’espace disque**
```powershell
$Seuil = 10GB
$Drive = Get-PSDrive -Name C

while ($Drive.Used -lt $Seuil) {
    Write-Output "Espace utilisé sur C: $($Drive.Used / 1GB) Go. En-dessous du seuil ($($Seuil / 1GB) Go)."
    Start-Sleep -Seconds 60
    $Drive = Get-PSDrive -Name C
}
Write-Output "⚠️ Seuil d'espace disque dépassé : $($Drive.Used / 1GB) Go."
```

---

#### **d. Utilisation de `do-while` pour surveiller un service**
```powershell
$ServiceName = "Spooler"
do {
    $ServiceStatus = (Get-Service -Name $ServiceName).Status
    Write-Output "État actuel du service $ServiceName : $ServiceStatus"
    Start-Sleep -Seconds 10
} while ($ServiceStatus -ne "Running")

Write-Output "Le service $ServiceName est en cours d'exécution."
```

---

#### **e. `do-until` pour exécuter une tâche récurrente**
```powershell
$FilePath = "C:\Temp\fichier_test.txt"
do {
    if (-Not (Test-Path -Path $FilePath)) {
        Write-Output "Le fichier n'existe pas. Création en cours..."
        New-Item -Path $FilePath -ItemType File
    } else {
        Write-Output "Le fichier existe déjà."
    }
    Start-Sleep -Seconds 5
} until (Test-Path -Path $FilePath)
```

---

#### **f. Utilisation de `foreach-object` pour analyser des données**
```powershell
Get-Process | Where-Object { $_.CPU -gt 10 } | ForEach-Object {
    Write-Output "Processus consommateur : $($_.Name), CPU : $($_.CPU)%"
}
```

---

### **Combinaisons Conditionnelles et Itératives**

#### **a. Vérifier et trier les fichiers volumineux**
```powershell
$Dossier = "C:\Temp"
$FichiersVolumineux = Get-ChildItem -Path $Dossier -Recurse | Where-Object { $_.Length -gt 500MB }

foreach ($Fichier in $FichiersVolumineux) {
    Write-Output "Fichier volumineux détecté : $($Fichier.Name) - Taille : $($Fichier.Length / 1MB) Mo."
}
```

---

#### **b. Vérifier l’état de plusieurs services**
```powershell
$Services = @("wuauserv", "bits", "spooler")

foreach ($Service in $Services) {
    $Status = (Get-Service -Name $Service).Status
    if ($Status -eq "Stopped") {
        Write-Output "Service $Service arrêté. Démarrage en cours..."
        Start-Service -Name $Service
    } else {
        Write-Output "Service $Service déjà en cours d'exécution."
    }
}
```

---

Ces exemples couvrent des cas d'utilisation concrets et variés, avec des structures conditionnelles et itératives. Si vous souhaitez des ajustements ou avez un autre besoin, faites-le-moi savoir !