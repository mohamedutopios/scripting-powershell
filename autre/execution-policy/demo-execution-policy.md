Voici des démonstrations pour tester différents cas d'utilisation liés à **`Get-ExecutionPolicy`** et la gestion des politiques d'exécution dans PowerShell.

---

### **Démonstration 1 : Vérifier la politique d'exécution actuelle**
Cette commande montre la politique active pour le contexte par défaut (**LocalMachine**).
```powershell
Get-ExecutionPolicy
```
- **But** : Identifier si la politique actuelle est restrictive (`Restricted`) ou permissive (`RemoteSigned`, etc.).

---

### **Démonstration 2 : Vérifier la politique spécifique à un scope**
Testez les politiques appliquées à différents scopes :
```powershell
Get-ExecutionPolicy -Scope CurrentUser
Get-ExecutionPolicy -Scope LocalMachine
Get-ExecutionPolicy -Scope Process
```
- **But** : Comprendre les politiques appliquées à différents niveaux.

---

### **Démonstration 3 : Lister toutes les politiques définies**
Pour voir toutes les politiques définies sur votre système :
```powershell
Get-ExecutionPolicy -List
```
- **But** : Identifier les priorités de chaque politique (MachinePolicy > UserPolicy > Process > CurrentUser > LocalMachine).

---

### **Démonstration 4 : Tester une politique au niveau de la session**
Appliquez une politique temporaire pour la session PowerShell actuelle :
```powershell
Set-ExecutionPolicy Bypass -Scope Process
Get-ExecutionPolicy -Scope Process
```
- **But** : Autoriser temporairement tous les scripts sans modifier les politiques globales.
- **Test** : Fermez PowerShell et relancez-le, puis vérifiez si la politique revient à son état initial.

---

### **Démonstration 5 : Modifier la politique pour l'utilisateur actuel**
Changez la politique d'exécution uniquement pour l'utilisateur actuel :
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Get-ExecutionPolicy -Scope CurrentUser
```
- **But** : Permettre l'exécution de scripts locaux pour un utilisateur spécifique sans affecter les autres.

---

### **Démonstration 6 : Bloquer l'exécution des scripts**
Appliquez une politique restrictive pour interdire les scripts :
```powershell
Set-ExecutionPolicy Restricted -Scope CurrentUser
```
Testez ensuite en essayant d'exécuter un script PowerShell simple :
```powershell
.\TestScript.ps1
```
- **But** : Vérifier que la politique bloque effectivement l'exécution.

---

### **Démonstration 7 : Appliquer une politique globale**
Changez la politique pour tous les utilisateurs :
```powershell
Set-ExecutionPolicy AllSigned -Scope LocalMachine
```
- **But** : Tester une politique stricte où seuls les scripts signés sont autorisés.

---

### **Démonstration 8 : Tester un script téléchargé**
1. Téléchargez un script PowerShell depuis Internet.
2. Vérifiez si l'exécution est bloquée avec une politique **RemoteSigned** :
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope LocalMachine
   .\DownloadedScript.ps1
   ```
3. Comparez avec une politique **Unrestricted** :
   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope LocalMachine
   .\DownloadedScript.ps1
   ```

---

### **Démonstration 9 : Restaurer une politique par défaut**
Pour remettre une politique sécurisée après les tests :
```powershell
Set-ExecutionPolicy Restricted -Scope LocalMachine
```
- **But** : Revenir à un état sécurisé après les expérimentations.

---

### **Démonstration 10 : Identifier la politique appliquée dans un script**
Ajoutez cette commande dans un script pour afficher la politique en vigueur pendant son exécution :
```powershell
Write-Host "Current Execution Policy: $(Get-ExecutionPolicy)"
```
Exécutez le script pour vérifier la politique.

---

### **Mesures de sécurité**
- Pour protéger votre environnement, évitez d'utiliser `Unrestricted` ou `Bypass` sur des machines de production.
- Travaillez dans des sessions PowerShell spécifiques avec **`-Scope Process`** pour limiter les modifications.

Ces démonstrations vous permettent d'explorer et de comprendre les politiques d'exécution tout en restant sécurisé et méthodique.