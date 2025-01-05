### Mise à jour de la consigne avec initialisation des fichiers

---

### **7. Comparer deux dossiers**

#### **Consigne mise à jour :**
1. Créez les fichiers suivants dans les dossiers `C:\NavigationTP\Logs\Application` et `C:\NavigationTP\Logs\System` :
   - Dans `Application` : Créez un fichier nommé `app-log1.txt` avec le contenu suivant : *"Application Log 1"*.
   - Dans `System` : Créez un fichier nommé `sys-log1.txt` avec le contenu suivant : *"System Log 1"*.

2. Comparez le contenu des dossiers `C:\NavigationTP\Logs\Application` et `C:\NavigationTP\Logs\System` :
   - Listez les fichiers présents dans `Application` mais absents dans `System`.

---

### **Solution complète :**

1. **Créer les dossiers et fichiers nécessaires :**
   ```powershell
   # Créer les dossiers s'ils n'existent pas déjà
   New-Item -Path "C:\NavigationTP\Logs\Application" -ItemType Directory -Force
   New-Item -Path "C:\NavigationTP\Logs\System" -ItemType Directory -Force

   # Ajouter les fichiers dans les dossiers
   Set-Content -Path "C:\NavigationTP\Logs\Application\app-log1.txt" -Value "Application Log 1"
   Set-Content -Path "C:\NavigationTP\Logs\System\sys-log1.txt" -Value "System Log 1"
   ```

2. **Comparer les deux dossiers :**
   ```powershell
   Compare-Object -ReferenceObject (Get-ChildItem -Path "C:\NavigationTP\Logs\Application" | Select-Object -ExpandProperty Name) `
                  -DifferenceObject (Get-ChildItem -Path "C:\NavigationTP\Logs\System" | Select-Object -ExpandProperty Name) `
                  -IncludeEqual -PassThru | Where-Object { $_.SideIndicator -eq "<=" }
   ```

---

### **Explication des étapes**

1. **Création des dossiers et fichiers** :
   - Le dossier `Application` reçoit un fichier `app-log1.txt` contenant `"Application Log 1"`.
   - Le dossier `System` reçoit un fichier `sys-log1.txt` contenant `"System Log 1"`.
   

2. **Utilisation de `Compare-Object`** :
   - Le paramètre `-ReferenceObject` prend la liste des fichiers du dossier `Application`.
   - Le paramètre `-DifferenceObject` prend la liste des fichiers du dossier `System`.
   - Le filtre `Where-Object { $_.SideIndicator -eq "<=" }` liste uniquement les fichiers présents dans `Application` mais absents dans `System`.

---

Avec cette mise à jour, la consigne est claire, et l’opération inclut l’initialisation des fichiers avant la comparaison. 😊