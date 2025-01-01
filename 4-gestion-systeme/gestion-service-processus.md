### **Gestion des Processus Windows**

PowerShell offre des cmdlets puissantes pour gérer les processus sur un système Windows, comme les surveiller, les terminer ou interagir avec eux.

---

### **1. Gestion des Processus avec `Get-Process` et Autres Cmdlets**

#### **a. `Get-Process`**
- Liste tous les processus en cours d’exécution.
- Affiche des détails tels que le nom, l’ID (PID), l’utilisation CPU, la mémoire, etc.

##### **Syntaxe :**
```powershell
Get-Process [-Name <Nom>] [-Id <ID>] [-ComputerName <NomMachine>]
```

##### **Exemples :**
1. **Lister tous les processus :**
   ```powershell
   Get-Process
   ```

2. **Filtrer par nom de processus :**
   ```powershell
   Get-Process -Name notepad
   ```

3. **Filtrer par ID de processus :**
   ```powershell
   Get-Process -Id 1234
   ```

4. **Obtenir des processus sur une machine distante :**
   ```powershell
   Get-Process -ComputerName "Serveur01"
   ```

---

#### **b. `Stop-Process`**
- Arrête un processus en fonction de son nom ou de son ID.

##### **Syntaxe :**
```powershell
Stop-Process [-Name <Nom>] [-Id <ID>] [-Force]
```

##### **Exemples :**
1. **Arrêter un processus par son nom :**
   ```powershell
   Stop-Process -Name notepad
   ```

2. **Arrêter un processus par son ID :**
   ```powershell
   Stop-Process -Id 1234
   ```

3. **Forcer l’arrêt d’un processus :**
   ```powershell
   Stop-Process -Name notepad -Force
   ```

---

#### **c. `Start-Process`**
- Permet de lancer un nouveau processus.

##### **Syntaxe :**
```powershell
Start-Process [-FilePath <Chemin>] [-ArgumentList <Arguments>] [-Wait]
```

##### **Exemples :**
1. **Ouvrir une application (ex : Bloc-notes) :**
   ```powershell
   Start-Process -FilePath "notepad.exe"
   ```

2. **Ouvrir un fichier avec une application par défaut :**
   ```powershell
   Start-Process -FilePath "C:\Temp\document.txt"
   ```

3. **Exécuter une commande en attendant sa fin :**
   ```powershell
   Start-Process -FilePath "cmd.exe" -ArgumentList "/C ping google.com" -Wait
   ```

---

#### **d. Surveillance des Processus**
1. **Lister les processus triés par utilisation CPU décroissante :**
   ```powershell
   Get-Process | Sort-Object CPU -Descending
   ```

2. **Afficher les 5 processus consommant le plus de mémoire :**
   ```powershell
   Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5
   ```

---

### **2. Gestion des Services Windows**

Les services Windows peuvent être surveillés et contrôlés via PowerShell à l’aide de cmdlets comme `Get-Service`, `Start-Service`, et `Stop-Service`.

---

#### **a. `Get-Service`**
- Liste les services installés sur la machine, qu’ils soient en cours d’exécution ou non.

##### **Syntaxe :**
```powershell
Get-Service [-Name <Nom>] [-DisplayName <NomAffichage>] [-ComputerName <NomMachine>]
```

##### **Exemples :**
1. **Lister tous les services :**
   ```powershell
   Get-Service
   ```

2. **Afficher les services en cours d’exécution uniquement :**
   ```powershell
   Get-Service | Where-Object { $_.Status -eq "Running" }
   ```

3. **Filtrer par nom de service :**
   ```powershell
   Get-Service -Name W32Time
   ```

4. **Lister les services d’une machine distante :**
   ```powershell
   Get-Service -ComputerName "Serveur01"
   ```

---

#### **b. `Start-Service`**
- Démarre un service arrêté.

##### **Syntaxe :**
```powershell
Start-Service -Name <Nom> [-Force]
```

##### **Exemples :**
1. **Démarrer un service spécifique :**
   ```powershell
   Start-Service -Name W32Time
   ```

2. **Forcer le démarrage d’un service :**
   ```powershell
   Start-Service -Name Spooler -Force
   ```

---

#### **c. `Stop-Service`**
- Arrête un service en cours d’exécution.

##### **Syntaxe :**
```powershell
Stop-Service -Name <Nom> [-Force]
```

##### **Exemples :**
1. **Arrêter un service :**
   ```powershell
   Stop-Service -Name W32Time
   ```

2. **Forcer l’arrêt d’un service :**
   ```powershell
   Stop-Service -Name Spooler -Force
   ```

---

#### **d. `Restart-Service`**
- Redémarre un service.

##### **Syntaxe :**
```powershell
Restart-Service -Name <Nom> [-Force]
```

##### **Exemples :**
1. **Redémarrer un service :**
   ```powershell
   Restart-Service -Name W32Time
   ```

2. **Forcer le redémarrage :**
   ```powershell
   Restart-Service -Name Spooler -Force
   ```

---

### **Exemple Complet**

#### **1. Gestion des Processus**
```powershell
# Lister les processus avec plus de 10% de CPU
Get-Process | Where-Object { $_.CPU -gt 10 }

# Terminer tous les processus nommés "notepad"
Get-Process -Name notepad | Stop-Process
```

#### **2. Gestion des Services**
```powershell
# Afficher les services en cours d’exécution
Get-Service | Where-Object { $_.Status -eq "Running" }

# Démarrer le service de temps Windows
Start-Service -Name W32Time

# Arrêter le service d’impression
Stop-Service -Name Spooler
```

---

### **Résumé des Cmdlets**

| Cmdlet              | Description                                    |
|---------------------|-----------------------------------------------|
| `Get-Process`       | Liste les processus en cours.                 |
| `Start-Process`     | Démarre une nouvelle application ou commande. |
| `Stop-Process`      | Termine un processus spécifique.              |
| `Get-Service`       | Liste les services installés sur le système.  |
| `Start-Service`     | Démarre un service arrêté.                    |
| `Stop-Service`      | Arrête un service en cours d’exécution.       |
| `Restart-Service`   | Redémarre un service.                         |

---

### **Conclusion**
PowerShell facilite la gestion des processus et des services sur les systèmes Windows grâce à des cmdlets dédiées. Ces cmdlets permettent de surveiller l’état des processus, de les contrôler et d’interagir efficacement avec les services système pour des tâches d’administration et de dépannage.