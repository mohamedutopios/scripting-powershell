### **Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets**

---

### **1. Cmdlets (Command-lets)**

#### **Qu’est-ce qu’une cmdlet ?**
- Une cmdlet est une commande intégrée dans PowerShell pour effectuer des actions spécifiques.
- Elle suit le schéma de **verbe-nom** (par exemple, `Get-Process`, `Set-Item`).

#### **Caractéristiques :**
- Les cmdlets sont des objets .NET, ce qui permet de manipuler directement leurs propriétés et méthodes.
- Elles sont différentes des commandes classiques des autres shells (comme Bash), car elles retournent des objets, pas du texte.

#### **Structure générale d’une cmdlet :**
```powershell
<Verbe>-<Nom> [-Paramètres] [Valeur(s)]
```

#### **Exemples courants de cmdlets :**
| Cmdlet                | Description                                   |
|-----------------------|-----------------------------------------------|
| `Get-Help`            | Affiche de l'aide sur une cmdlet ou un sujet. |
| `Get-Command`         | Liste toutes les cmdlets disponibles.        |
| `Get-Process`         | Liste les processus en cours.                |
| `Set-Location`        | Change le répertoire de travail.             |
| `New-Item`            | Crée un fichier ou un dossier.               |

#### **Exemple pratique :**
```powershell
# Récupère une liste des processus
Get-Process

# Affiche des détails sur la cmdlet Get-Process
Get-Help Get-Process
```

---

### **2. Pipelines**

#### **Qu’est-ce qu’un pipeline ?**
- Le pipeline (`|`) est un mécanisme pour envoyer la sortie d’une cmdlet en entrée d’une autre.
- C’est une manière de **chaîner plusieurs commandes** pour effectuer des traitements complexes.

#### **Fonctionnement du pipeline :**
1. La cmdlet produit une sortie sous forme d’objet(s).
2. Ces objets sont envoyés directement à la cmdlet suivante comme entrée.

#### **Exemples simples :**
1. **Lister les processus et filtrer par nom :**
   ```powershell
   Get-Process | Where-Object {$_.Name -eq "notepad"}
   ```

2. **Afficher les fichiers d'un dossier triés par taille :**
   ```powershell
   Get-ChildItem | Sort-Object Length
   ```

3. **Exporter des données vers un fichier CSV :**
   ```powershell
   Get-Process | Export-Csv -Path processes.csv -NoTypeInformation
   ```

#### **Pipeline avec plusieurs étapes :**
```powershell
Get-Process |
    Where-Object {$_.CPU -gt 10} | # Filtre les processus avec une consommation CPU > 10
    Sort-Object CPU -Descending | # Trie par utilisation CPU décroissante
    Select-Object -First 5         # Sélectionne les 5 premiers résultats
```

---

### **3. Objets en PowerShell**

#### **Pourquoi les objets sont importants ?**
- PowerShell traite tout comme un **objet**.
- Contrairement à d'autres shells où les commandes retournent du texte brut, PowerShell retourne des objets .NET.

#### **Structure des objets :**
Un objet possède :
- **Propriétés** : Des attributs contenant des informations sur l'objet.
- **Méthodes** : Des actions ou comportements que l'objet peut effectuer.

#### **Exploration des objets :**
1. **Lister les propriétés et méthodes d’un objet :**
   ```powershell
   Get-Process | Get-Member
   ```

   Exemple de sortie pour `Get-Process` :
   ```
   Name                      MemberType   Definition
   ----                      ----------   ----------
   CPU                       Property     System.Double CPU {get;}
   StartTime                 Property     System.DateTime StartTime {get;}
   Kill                      Method       void Kill()
   ```

2. **Accéder aux propriétés d’un objet :**
   ```powershell
   Get-Process | Select-Object Name, CPU
   ```

3. **Appeler une méthode :**
   ```powershell
   # Terminer un processus
   Get-Process notepad | ForEach-Object { $_.Kill() }
   ```

#### **Manipulation avancée des objets :**
- **Filtrer les objets :**
  ```powershell
  Get-Process | Where-Object {$_.WorkingSet -gt 500MB}
  ```

- **Modifier les propriétés d’un objet :**
  ```powershell
  $service = Get-Service | Select-Object -First 1
  $service.Status = "Stopped"  # Modification d'une propriété
  ```

---

### **4. Combinaison cmdlets, pipelines et objets**

#### **Exemple pratique 1 : Filtrer les fichiers d'un répertoire**
```powershell
Get-ChildItem -Path C:\Windows -Recurse | 
    Where-Object {$_.Length -gt 1MB} | 
    Select-Object Name, Length
```

#### **Exemple pratique 2 : Rapport sur les services**
```powershell
Get-Service | 
    Where-Object {$_.Status -eq "Running"} | 
    Select-Object Name, Status, StartType | 
    Export-Csv -Path running-services.csv -NoTypeInformation
```

#### **Exemple pratique 3 : Trouver les 5 processus utilisant le plus de mémoire**
```powershell
Get-Process |
    Sort-Object -Property WorkingSet -Descending |
    Select-Object -First 5 Name, WorkingSet
```

---

### **5. Bonnes pratiques**
1. **Utilisez `Get-Help` pour comprendre les cmdlets :**
   ```powershell
   Get-Help <Cmdlet> -Examples
   ```

2. **Utilisez le pipeline pour simplifier le traitement des données :**
   - Chaque étape traite un petit morceau du travail.

3. **Utilisez `Get-Member` pour explorer les propriétés/méthodes des objets.**
   ```powershell
   Get-Service | Get-Member
   ```

---

### **Conclusion**
La puissance de PowerShell réside dans sa capacité à manipuler des objets, à chaîner des cmdlets avec des pipelines, et à traiter des données complexes. Une compréhension solide de ces concepts permet de maximiser son efficacité pour l’automatisation des tâches administratives.