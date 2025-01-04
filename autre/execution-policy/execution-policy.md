### **`Get-ExecutionPolicy` : Description**

La commande **`Get-ExecutionPolicy`** dans PowerShell permet de connaître la **politique d'exécution** (execution policy) en vigueur dans votre environnement PowerShell. Cette politique définit le niveau de restriction appliqué pour exécuter des scripts dans PowerShell, afin de protéger l'utilisateur contre l'exécution accidentelle ou malveillante de scripts non approuvés.

---

### **Pourquoi la politique d'exécution est importante ?**
La politique d'exécution est une mesure de sécurité intégrée à PowerShell. Elle contrôle si les scripts peuvent s'exécuter et dans quelles conditions. Par défaut, PowerShell est configuré pour exécuter uniquement les scripts qui sont considérés comme sûrs.

---

### **Utilisation de `Get-ExecutionPolicy`**

#### Syntaxe de base :
```powershell
Get-ExecutionPolicy
```

#### Pour vérifier la politique d'exécution pour le **contexte actuel** :
```powershell
Get-ExecutionPolicy -Scope CurrentUser
```

#### Pour lister toutes les politiques définies (par contexte) :
```powershell
Get-ExecutionPolicy -List
```

---

### **Les niveaux de restriction des politiques d'exécution**
Voici les principales politiques d'exécution disponibles dans PowerShell :

1. **Restricted** (par défaut sur Windows) :
   - Aucune exécution de scripts n'est autorisée.
   - Seules les commandes interactives sont permises.

2. **AllSigned** :
   - Autorise uniquement les scripts signés numériquement par un éditeur de confiance.
   - Demande confirmation avant d'exécuter un script signé par un éditeur non approuvé.

3. **RemoteSigned** :
   - Autorise les scripts locaux, même s'ils ne sont pas signés.
   - Exige que les scripts téléchargés depuis Internet soient signés par un éditeur de confiance.

4. **Unrestricted** :
   - Tous les scripts sont autorisés à s'exécuter.
   - Les scripts non signés téléchargés depuis Internet affichent un avertissement avant leur exécution.

5. **Bypass** :
   - Aucune restriction n'est appliquée. Idéal pour les environnements automatisés.

6. **Undefined** :
   - Aucune politique n'est définie pour ce contexte. Si aucune politique n'est définie, le système applique la politique par défaut (souvent **Restricted**).

---

### **Changer la politique d'exécution**
Pour modifier la politique d'exécution, utilisez la commande **`Set-ExecutionPolicy`**.

Exemple : Passer en mode **RemoteSigned** (souvent utilisé pour permettre l'exécution sécurisée de scripts locaux et téléchargés de sources fiables) :
```powershell
Set-ExecutionPolicy RemoteSigned
```

Si vous voulez modifier la politique pour un utilisateur ou un contexte spécifique :
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

### **Contexte des politiques (`-Scope`)**
Les politiques d'exécution peuvent être définies à plusieurs niveaux de contexte. Voici les principaux :

1. **MachinePolicy** :
   - Politique définie par un administrateur via une stratégie de groupe (Group Policy).
   - Priorité la plus élevée.

2. **UserPolicy** :
   - Politique définie par un administrateur pour un utilisateur via une stratégie de groupe.

3. **Process** :
   - Politique spécifique à la session PowerShell en cours. Elle n'affecte pas d'autres sessions ou utilisateurs.

4. **CurrentUser** :
   - Politique spécifique à l'utilisateur actuel.

5. **LocalMachine** :
   - Politique appliquée à tous les utilisateurs de la machine.

---

### **Exemple pratique**
1. Vérifier la politique actuelle :
   ```powershell
   Get-ExecutionPolicy
   ```

2. Autoriser l'exécution de scripts locaux :
   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```

3. Vérifier les politiques sur tous les contextes :
   ```powershell
   Get-ExecutionPolicy -List
   ```

---

### **Attention : Sécurité !**
- **Ne jamais utiliser `Unrestricted` ou `Bypass` dans des environnements sensibles**, car cela supprime toute protection contre les scripts potentiellement malveillants.
- Préférez **RemoteSigned** ou **AllSigned** pour un bon équilibre entre sécurité et flexibilité.

Le contrôle de la politique d'exécution est essentiel pour un usage sécurisé de PowerShell, notamment lors de l'automatisation avec des scripts.