### **Gestion Réseau avec PowerShell**

PowerShell offre un ensemble riche de cmdlets pour gérer, surveiller et diagnostiquer des réseaux. Ces outils permettent de tester la connectivité, analyser les ports, gérer les adresses IP et configurer les interfaces réseau.

---

### **1. Cmdlets Réseau de Base**

#### **a. Tester la connectivité : `Test-Connection`**
- Permet de vérifier la connectivité réseau (similaire à `ping` en ligne de commande).
  
##### **Syntaxe :**
```powershell
Test-Connection -ComputerName <NomOuIP> [-Count <NombreDePaquets>]
```

##### **Exemples :**
1. **Tester la connectivité vers une machine :**
   ```powershell
   Test-Connection -ComputerName google.com
   ```

2. **Envoyer 5 paquets :**
   ```powershell
   Test-Connection -ComputerName google.com -Count 5
   ```

3. **Tester plusieurs machines :**
   ```powershell
   "google.com", "192.168.1.1" | ForEach-Object { Test-Connection -ComputerName $_ -Count 1 }
   ```

---

#### **b. Obtenir des informations IP : `Get-NetIPAddress`**
- Fournit des informations sur les adresses IP configurées sur la machine.

##### **Syntaxe :**
```powershell
Get-NetIPAddress [-InterfaceAlias <NomInterface>] [-AddressFamily <IPv4|IPv6>]
```

##### **Exemples :**
1. **Lister toutes les adresses IP :**
   ```powershell
   Get-NetIPAddress
   ```

2. **Afficher uniquement les adresses IPv4 :**
   ```powershell
   Get-NetIPAddress -AddressFamily IPv4
   ```

3. **Obtenir les adresses IP pour une interface spécifique :**
   ```powershell
   Get-NetIPAddress -InterfaceAlias "Ethernet"
   ```

---

#### **c. Résolution DNS : `Resolve-DnsName`**
- Effectue une résolution DNS pour un nom de domaine.

##### **Syntaxe :**
```powershell
Resolve-DnsName -Name <NomDomaine>
```

##### **Exemples :**
1. **Résoudre un nom de domaine :**
   ```powershell
   Resolve-DnsName -Name google.com
   ```

2. **Résolution DNS avec type d’enregistrement spécifique :**
   ```powershell
   Resolve-DnsName -Name google.com -Type A
   ```

---

### **2. Analyse des Ports et des Connexions Réseau**

#### **a. Analyse des ports : `Test-NetConnection`**
- Vérifie l’état des ports TCP sur une machine cible.

##### **Syntaxe :**
```powershell
Test-NetConnection -ComputerName <NomOuIP> -Port <Port>
```

##### **Exemples :**
1. **Vérifier la connectivité TCP vers un serveur web :**
   ```powershell
   Test-NetConnection -ComputerName google.com -Port 80
   ```

2. **Tester une connexion RDP (port 3389) :**
   ```powershell
   Test-NetConnection -ComputerName 192.168.1.10 -Port 3389
   ```

---

#### **b. Afficher les connexions réseau actives : `Get-NetTCPConnection`**
- Fournit des informations sur les connexions TCP actives.

##### **Syntaxe :**
```powershell
Get-NetTCPConnection [-State <État>] [-LocalPort <Port>]
```

##### **Exemples :**
1. **Lister toutes les connexions actives :**
   ```powershell
   Get-NetTCPConnection
   ```

2. **Filtrer les connexions par état :**
   ```powershell
   Get-NetTCPConnection -State Established
   ```

3. **Afficher les connexions pour un port local spécifique :**
   ```powershell
   Get-NetTCPConnection -LocalPort 80
   ```

---

### **3. Gestion des Interfaces Réseau**

#### **a. Lister les interfaces réseau : `Get-NetAdapter`**
- Affiche les informations sur les interfaces réseau disponibles.

##### **Syntaxe :**
```powershell
Get-NetAdapter [-Name <NomInterface>]
```

##### **Exemples :**
1. **Lister toutes les interfaces :**
   ```powershell
   Get-NetAdapter
   ```

2. **Afficher une interface spécifique :**
   ```powershell
   Get-NetAdapter -Name "Ethernet"
   ```

---

#### **b. Activer/Désactiver une interface réseau : `Enable-NetAdapter` / `Disable-NetAdapter`**
- Permet d’activer ou de désactiver une interface réseau.

##### **Syntaxe :**
```powershell
Enable-NetAdapter -Name <NomInterface>
Disable-NetAdapter -Name <NomInterface>
```

##### **Exemples :**
1. **Désactiver une interface réseau :**
   ```powershell
   Disable-NetAdapter -Name "Wi-Fi"
   ```

2. **Activer une interface réseau :**
   ```powershell
   Enable-NetAdapter -Name "Wi-Fi"
   ```

---

#### **c. Configurer une adresse IP : `New-NetIPAddress`**
- Assigne une adresse IP statique à une interface réseau.

##### **Syntaxe :**
```powershell
New-NetIPAddress -InterfaceAlias <NomInterface> -IPAddress <AdresseIP> -PrefixLength <LongueurPréfixe> -DefaultGateway <Passerelle>
```

##### **Exemple :**
```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.1.100 -PrefixLength 24 -DefaultGateway 192.168.1.1
```

---

#### **d. Réinitialiser une interface réseau : `Restart-NetAdapter`**
- Redémarre une interface réseau.

##### **Syntaxe :**
```powershell
Restart-NetAdapter -Name <NomInterface>
```

##### **Exemple :**
```powershell
Restart-NetAdapter -Name "Ethernet"
```

---

### **Exemple Complet : Script de Diagnostic Réseau**

```powershell
# Script : Diagnostic Réseau
# Description : Teste la connectivité réseau, analyse les connexions et vérifie l’état des interfaces.

# Étape 1 : Tester la connectivité vers une cible
$Cible = "google.com"
Write-Output "Test de connectivité vers $Cible..."
Test-Connection -ComputerName $Cible -Count 4

# Étape 2 : Vérifier l’état des interfaces réseau
Write-Output "État des interfaces réseau :"
Get-NetAdapter | Select-Object Name, Status, LinkSpeed

# Étape 3 : Analyse des connexions réseau actives
Write-Output "Connexions TCP établies :"
Get-NetTCPConnection -State Established | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort
```

---

### **Résumé des Cmdlets Réseau**

| Cmdlet                  | Description                                   |
|-------------------------|-----------------------------------------------|
| `Test-Connection`       | Vérifie la connectivité réseau (ping).       |
| `Get-NetIPAddress`      | Liste les adresses IP configurées.           |
| `Resolve-DnsName`       | Effectue une résolution DNS.                 |
| `Test-NetConnection`    | Vérifie l’état des ports TCP.                |
| `Get-NetTCPConnection`  | Affiche les connexions TCP actives.          |
| `Get-NetAdapter`        | Liste les interfaces réseau.                 |
| `Enable-NetAdapter`     | Active une interface réseau.                 |
| `Disable-NetAdapter`    | Désactive une interface réseau.              |
| `New-NetIPAddress`      | Configure une adresse IP statique.           |
| `Restart-NetAdapter`    | Redémarre une interface réseau.              |

---

### **Conclusion**
Avec les cmdlets réseau, PowerShell fournit des outils puissants pour diagnostiquer et configurer des connexions réseau. Que ce soit pour tester la connectivité, analyser les ports ou gérer les interfaces réseau, ces cmdlets sont indispensables pour les administrateurs système.