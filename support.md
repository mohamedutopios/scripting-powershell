---
marp: true
title: Prometheus
theme: utopios
paginate: true
author: Mohamed Aijjou
header: "![h:70px](https://utopios-marp-assets.s3.eu-west-3.amazonaws.com/logo_blanc.svg)"
footer: "Utopios® Tous droits réservés"
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Powershell

---

## Sommaire

1. Introduction et bases de PowerShell
2. Manipulation avancée et scripting
3. Gestion des systèmes et des services Windows
4. Automatisation avancée
5. Réseaux et sécurité
6. Urbanisation du SI Hybride
7. Elements du Cloud Broker
8. Impact et grandes tendances

</div>

---

<!-- _class: lead -->
<!-- _paginate: false -->

## Introduction et bases de PowerShell

---

## Introduction et bases de PowerShell

### Introduction

<br/>

<div style="font-size:35px">

#### **1. Historique de PowerShell**
- **Origines :**
  - Créé par Microsoft pour fournir un shell en ligne de commande et un langage de script destiné à l’administration système.
  - Introduit pour la première fois en **2006** sous le nom **Monad** (nom de code).

</div>

---

## Introduction et bases de PowerShell

### Introduction

<div style="font-size:20px">

#### **1. Historique de PowerShell**

- **Évolutions :**
  - **PowerShell 1.0 (2006)** : Sortie initiale, intégrée à Windows Server 2008 et Windows Vista.
  - **PowerShell 2.0 (2009)** : Ajout de nombreuses fonctionnalités, dont PowerShell Remoting via WinRM.
  - **PowerShell 3.0 (2012)** : Intégré à Windows Server 2012 et Windows 8, avec une meilleure prise en charge des modules.
  - **PowerShell 4.0 (2013)** : Introduction de Desired State Configuration (DSC).
  - **PowerShell 5.0/5.1 (2016)** : Intégration avec Windows Management Framework (WMF), prise en charge des classes et des nouveaux cmdlets.
  - **PowerShell Core 6.x (2018)** : Passage à une version multiplateforme (Windows, Linux, macOS), basé sur .NET Core.
  - **PowerShell 7.x (2020)** : Version actuelle, entièrement multiplateforme, basée sur .NET 5/6, avec de meilleures performances et compatibilité accrue avec les scripts Windows PowerShell.

</div>

---


<div style="font-size:15px">

| Version             | Année de sortie | Nouveautés clés                                         | Compatibilité          |
|---------------------|-----------------|--------------------------------------------------------|-----------------------|
| PowerShell 1.0      | 2006            | Cmdlets de base, pipelines                             | Windows uniquement    |
| PowerShell 2.0      | 2009            | Remoting, modules                                      | Windows uniquement    |
| PowerShell 3.0      | 2012            | Améliorations des workflows, tâches planifiées         | Windows uniquement    |
| PowerShell 5.1      | 2016            | Classes, gestion des paquets, DSC amélioré            | Windows uniquement    |
| PowerShell Core 6.x | 2018            | Multiplateforme, open source                          | Windows, macOS, Linux |
| PowerShell 7.x      | 2020+           | Multiplateforme, basée sur .NET 5/6                   | Windows, macOS, Linux |


</div>

---

## Introduction et bases de PowerShell

#### Introduction

<div style="font-size:17px">

#### **3. Cas d’usage de PowerShell**
PowerShell est conçu pour répondre aux besoins d’administration et d’automatisation dans des environnements Windows et multiplateformes. Voici ses principaux cas d’usage :

1. **Administration système et automatisation :**
   - Gestion des utilisateurs et des groupes locaux et Active Directory.
   - Gestion des processus, services, et planification des tâches.
   - Surveillance et analyse des journaux d'événements.

2. **Gestion des fichiers et des dossiers :**
   - Création, copie, déplacement et suppression de fichiers et dossiers.
   - Recherche avancée dans les fichiers grâce aux filtres.
   - Analyse et transformation des données (CSV, JSON, XML).

3. **Gestion des infrastructures réseau :**
   - Configuration et surveillance des interfaces réseau.
   - Tests de connectivité et résolution DNS.
   - Automatisation des tâches réseau (paramétrage de pare-feu, VPN, etc.).
</div>

---

## Introduction et bases de PowerShell

#### Introduction

<div style="font-size:17px">

#### **3. Cas d’usage de PowerShell**

1. **Déploiement et configuration :**
   - Déploiement de logiciels via des scripts automatisés.
   - Configuration des serveurs avec **Desired State Configuration (DSC)**.
   - Automatisation des mises à jour et correctifs.

2. **Gestion de la sécurité :**
   - Audit des permissions sur les fichiers et dossiers.
   - Gestion des certificats numériques.
   - Création de scripts sécurisés et gestion des credentials.

3. **Intégration et gestion de Cloud :**
   - Interaction avec Azure, AWS, ou Google Cloud à travers leurs modules spécifiques.
   - Gestion des machines virtuelles et ressources cloud.

4. **Scripting multiplateforme :**
   - Grâce à PowerShell Core et PowerShell 7.x, gestion des systèmes Windows, Linux et macOS avec le même outil.
</div>

---

## Introduction et bases de PowerShell

#### Introduction

<div style="font-size:30px">

#### **Avantages de PowerShell**

- Basé sur **.NET Framework/Core** : permet de manipuler des objets directement au lieu de simples textes.
- **Extensibilité :** supporte des modules personnalisés et des API.
- **Interopérabilité :** fonctionne sur plusieurs plateformes et peut interagir avec d'autres outils comme Ansible, Terraform, etc.
- **Communauté active :** riche en modules préexistants sur des plateformes comme le **PowerShell Gallery**.

</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:25px">

#### **1. Vérification de la version PowerShell existante**
1. **Ouvrir une session PowerShell :**
   - Sous Windows : Rechercher `PowerShell` dans le menu Démarrer et cliquer sur **Windows PowerShell** ou **PowerShell 7**.
   - Sous macOS ou Linux : Ouvrir un terminal.

2. **Commande pour vérifier la version :**
   ```powershell
   $PSVersionTable
   ```
   - La valeur de `PSVersion` indique la version installée.
   - Si aucune version n'est trouvée, PowerShell n'est pas installé.

</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:22px">

#### **2. Installation de PowerShell sur différentes plateformes**

##### **a. Installation sur Windows**
- **Windows PowerShell (version classique)** : Déjà inclus dans Windows 7, 8.1, 10, 11, et Windows Server.
- **PowerShell 7+ (version multiplateforme)** :
  1. Télécharger l’installateur depuis la page officielle :  
     [https://github.com/PowerShell/PowerShell/releases](https://github.com/PowerShell/PowerShell/releases).
  2. Choisir le package **.msi** correspondant à votre architecture (x64 ou x86).
  3. Suivre l’assistant d’installation.

- **Via Winget (gestionnaire de paquets Windows 10/11)** :
  ```powershell
  winget install --id Microsoft.Powershell --source winget
  ```

</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:25px">

#### **2. Installation de PowerShell sur différentes plateformes**

##### **b. Installation sur macOS**
1. Ouvrir le terminal.
2. Installer PowerShell via **Homebrew** :
   ```bash
   brew install --cask powershell
   ```
3. Lancer PowerShell :
   ```bash
   pwsh
   ```
</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:25px">

#### **2. Installation de PowerShell sur différentes plateformes**

##### **c. Installation sur Linux**
1. **Ajouter le dépôt officiel :**
   - Pour Ubuntu/Debian :
     ```bash
     sudo apt-get update
     sudo apt-get install -y wget apt-transport-https software-properties-common
     wget -q "https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb" -O packages-microsoft-prod.deb
     sudo dpkg -i packages-microsoft-prod.deb
     ```
   - Pour CentOS/RedHat :
     ```bash
     sudo dnf install -y https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
     ```
</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:23px">

#### **2. Installation de PowerShell sur différentes plateformes**

##### **c. Installation sur Linux**
2. **Installer PowerShell :**
   - Pour Ubuntu/Debian :
     ```bash
     sudo apt-get update
     sudo apt-get install -y powershell
     ```
   - Pour CentOS/RedHat :
     ```bash
     sudo dnf install -y powershell
     ```

3. Lancer PowerShell :
   ```bash
   pwsh
   ```

</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:15px">

#### **3. Configuration de l’environnement PowerShell**

##### **a. Modifier le profil utilisateur PowerShell**
1. **Vérifier l'existence du profil utilisateur :**
   ```powershell
   Test-Path $PROFILE
   ```
   - Si `False`, créer le fichier de profil :
     ```powershell
     New-Item -Path $PROFILE -Type File -Force
     ```

2. **Éditer le fichier de profil :**
   ```powershell
   notepad $PROFILE
   ```
   - Exemple de contenu pour personnaliser l’environnement :
     ```powershell
     # Couleur de la console
     $host.UI.RawUI.BackgroundColor = "DarkBlue"
     $host.UI.RawUI.ForegroundColor = "White"
     Clear-Host

     # Alias personnalisés
     Set-Alias ll Get-ChildItem
     Set-Alias cls Clear-Host
     ```
</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:20px">

#### **3. Configuration de l’environnement PowerShell**

##### **b. Activer l’exécution de scripts**
- Par défaut, PowerShell limite l'exécution de scripts pour des raisons de sécurité.
1. **Vérifier la politique actuelle :**
   ```powershell
   Get-ExecutionPolicy
   ```
2. **Modifier la politique (si nécessaire) :**
   - Pour permettre tous les scripts locaux :
     ```powershell
     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     ```
   - Pour désactiver les restrictions :
     ```powershell
     Set-ExecutionPolicy Unrestricted -Scope CurrentUser
     ```
   - **Note :** Cette commande nécessite des droits administratifs.

</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:23px">

#### **3. Configuration de l’environnement PowerShell**

##### **c. Installer des modules supplémentaires**
1. Utiliser le PowerShell Gallery pour installer des modules :
   ```powershell
   Install-Module -Name Az -AllowClobber -Scope CurrentUser
   ```
2. Vérifier les modules installés :
   ```powershell
   Get-InstalledModule
   ```

##### **d. Tester l’installation**
- Exécuter une commande pour valider le bon fonctionnement :
  ```powershell
  Get-Process
  ```

</div>

---

## Introduction et bases de PowerShell

#### Installation et configuration de l’environnement PowerShell

<div style="font-size:30px">

#### **4. Personnalisation avancée (facultatif)**
- Installer un thème personnalisé pour Visual Studio Code avec PowerShell Extension.
- Ajouter des outils tiers comme **Oh-My-Posh** pour un prompt stylé :
  ```powershell
  Install-Module -Name oh-my-posh -Scope CurrentUser
  ```

</div>

---

## Introduction et bases de PowerShell

#### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:30px">

### **1. PowerShell ISE (Integrated Scripting Environment)**

#### **Présentation :**
- PowerShell ISE est un environnement graphique fourni par Microsoft pour éditer, tester et exécuter des scripts PowerShell.
- Disponible par défaut sur Windows, jusqu’à PowerShell 5.1 (il n'est pas inclus avec PowerShell Core ou PowerShell 7).
</div>

---

## Introduction et bases de PowerShell

#### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:18px">

### **1. PowerShell ISE (Integrated Scripting Environment)**

#### **Caractéristiques principales :**
- Interface intuitive et intégrée pour l'écriture et le débogage de scripts PowerShell.
- Support du multi-panneaux :
  - **Panneau Script** : Éditeur pour écrire des scripts PowerShell.
  - **Panneau Console** : Exécution des commandes et retour des résultats.
- Fonctionnalités d'aide à l'écriture :
  - Coloration syntaxique.
  - Intellisense pour la complétion automatique des cmdlets et des paramètres.
- Outils intégrés :
  - Aide interactive (`Ctrl + J` pour les modèles).
  - Débogueur intégré avec points d'arrêt.

</div>

---

## Introduction et bases de PowerShell

#### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:18px">

### **1. PowerShell ISE (Integrated Scripting Environment)**

#### **Naviguer dans l'interface PowerShell ISE :**
1. **Ouvrir PowerShell ISE :**
   - Rechercher `PowerShell ISE` dans le menu Démarrer.
   - Utiliser la commande suivante dans une console PowerShell classique :
     ```powershell
     ise
     ```

2. **Structure de l’interface :**
   - **Barre d'outils** : Boutons pour exécuter, arrêter, déboguer ou enregistrer les scripts.
   - **Panneau Script** (en haut) : Éditeur de texte pour les scripts `.ps1`.
   - **Panneau Console** (en bas) : Exécute les commandes interactives ou teste des extraits de script.
   - **Panneau des variables** (facultatif) : Affiche les variables en cours d'utilisation.


</div>

---

## Introduction et bases de PowerShell

#### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:25px">

### **1. PowerShell ISE (Integrated Scripting Environment)**

#### **Naviguer dans l'interface PowerShell ISE :**
3. **Exécution d’un script :**
   - Charger un script PowerShell (`.ps1`) dans le panneau script.
   - Cliquer sur **Run Script (F5)** ou sur **Run Selection (F8)** pour exécuter une sélection.

</div>

---

## Introduction et bases de PowerShell

#### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:23px">

### **1. PowerShell ISE (Integrated Scripting Environment)**

#### **Avantages et limitations :**
- **Avantages :**
  - Simple à utiliser pour débuter en PowerShell.
  - Débogueur intégré avec points d’arrêt.
  - Ne nécessite pas de configuration supplémentaire.
- **Limitations :**
  - Ne prend pas en charge PowerShell Core ou 7+.
  - Pas aussi performant et extensible que Visual Studio Code.

</div>

---


## Introduction et bases de PowerShell

#### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:22px">

### **2. Visual Studio Code avec l'extension PowerShell**

#### **Présentation :**
- Visual Studio Code (VS Code) est un éditeur de code moderne et multiplateforme.
- Avec l’extension PowerShell, il devient un environnement puissant pour éditer, déboguer et exécuter des scripts PowerShell.
- Compatible avec PowerShell 5.1, Core et 7+.

#### **Installation de Visual Studio Code et de l'extension PowerShell :**
1. **Télécharger et installer Visual Studio Code :**
   - Depuis le site officiel : [https://code.visualstudio.com/](https://code.visualstudio.com/).

</div>

---

## Introduction et bases de PowerShell

#### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:18px">

### **2. Visual Studio Code avec l'extension PowerShell**

#### **Installation de Visual Studio Code et de l'extension PowerShell :**
2. **Installer l’extension PowerShell :**
   - Ouvrir VS Code.
   - Aller dans le **Marketplace** (icône Extensions ou `Ctrl+Shift+X`).
   - Rechercher `PowerShell` et cliquer sur **Install**.
   - Extension officielle : `PowerShell by Microsoft`.

3. **Configurer PowerShell comme terminal par défaut :**
   - Ouvrir les **Paramètres** de VS Code (`Ctrl+,`).
   - Ajouter ou modifier dans `settings.json` :
     ```json
     "terminal.integrated.defaultProfile.windows": "PowerShell"
     ```

</div>

---

### Introduction et bases de PowerShell

##### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:17px">

### **2. Visual Studio Code avec l'extension PowerShell**

#### **Naviguer dans l'interface Visual Studio Code :**
1. **Structure de l’interface :**
   - **Barre latérale gauche** : Contient les fonctionnalités principales (explorateur de fichiers, recherche, contrôle de version, extensions).
   - **Éditeur principal** : Fenêtre pour éditer les fichiers PowerShell (`.ps1`).
   - **Terminal intégré** (en bas) : Pour exécuter des commandes PowerShell en ligne.

2. **Écrire et exécuter un script PowerShell :**
   - Créer un nouveau fichier PowerShell : `File > New File` et sauvegarder avec l’extension `.ps1`.
   - Taper votre script dans l’éditeur.
   - Exécuter le script :
     - Cliquer sur **Run Script** (triangle vert en haut à droite).
     - Utiliser le raccourci `F5`.

</div>

---

## Introduction et bases de PowerShell

#### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:25px">

### **2. Visual Studio Code avec l'extension PowerShell**

#### **Naviguer dans l'interface Visual Studio Code :**

3. **Déboguer un script :**
   - Ajouter un point d’arrêt en cliquant dans la marge à gauche de l'éditeur.
   - Lancer le débogage (`F5`).
   - Utiliser les commandes du débogueur pour avancer dans le script (Step Into, Step Over).

</div>

---

### Introduction et bases de PowerShell

##### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:17px">

### **2. Visual Studio Code avec l'extension PowerShell**

#### **Fonctionnalités supplémentaires avec l'extension PowerShell :**
- Coloration syntaxique avancée.
- Suggestions et auto-complétion pour les cmdlets, paramètres et variables.
- Intégration avec Git pour le contrôle de version.
- Débogueur interactif amélioré.

#### **Avantages et limitations :**
- **Avantages :**
  - Multiplateforme et extensible.
  - Interface moderne avec support pour les extensions.
  - Compatible avec toutes les versions de PowerShell.
- **Limitations :**
  - Nécessite une configuration initiale pour les débutants.

</div>

---

### Introduction et bases de PowerShell

##### Compréhension de l'interface PowerShell ISE et de Visual Studio Code

<div style="font-size:17px">



| Fonctionnalité                | PowerShell ISE                  | Visual Studio Code                    |
|-------------------------------|----------------------------------|---------------------------------------|
| **Compatibilité**             | Windows uniquement (PowerShell 5.1) | Multiplateforme (Windows, Linux, macOS) |
| **Performances**              | Moins rapide                    | Très rapide                           |
| **Débogage**                  | Intégré                         | Débogueur amélioré                    |
| **Extensibilité**             | Limité                          | Nombreuses extensions disponibles     |
| **Interface utilisateur**     | Simple                          | Moderne et personnalisable            |
| **Mises à jour**              | Arrêtées                        | Actives                               |

</div>

---

### Introduction et bases de PowerShell

##### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:22px">


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
</div>

---
#### Introduction et bases de PowerShell

###### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:18px">

### **1. Cmdlets (Command-lets)**

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

</div>

---

#### Introduction et bases de PowerShell

###### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:21px">

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

</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:25px">

### **2. Pipelines**

#### **Exemples simples :**
2. **Afficher les fichiers d'un dossier triés par taille :**
   ```powershell
   Get-ChildItem | Sort-Object Length
   ```

3. **Exporter des données vers un fichier CSV :**
   ```powershell
   Get-Process | Export-Csv -Path processes.csv -NoTypeInformation
   ```


</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:30px">

### **2. Pipelines**

#### **Pipeline avec plusieurs étapes :**
```powershell
Get-Process |
    Where-Object {$_.CPU -gt 10} | # Filtre les processus avec une consommation CPU > 10
    Sort-Object CPU -Descending | # Trie par utilisation CPU décroissante
    Select-Object -First 5         # Sélectionne les 5 premiers résultats
```

</div>

---


## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:22px">

### **3. Objets en PowerShell**

#### **Pourquoi les objets sont importants ?**
- PowerShell traite tout comme un **objet**.
- Contrairement à d'autres shells où les commandes retournent du texte brut, PowerShell retourne des objets .NET.

#### **Structure des objets :**
Un objet possède :
- **Propriétés** : Des attributs contenant des informations sur l'objet.
- **Méthodes** : Des actions ou comportements que l'objet peut effectuer.

</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:22px">

### **3. Objets en PowerShell**

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

</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:24px">

### **3. Objets en PowerShell**

#### **Exploration des objets :**
2. **Accéder aux propriétés d’un objet :**
   ```powershell
   Get-Process | Select-Object Name, CPU
   ```

3. **Appeler une méthode :**
   ```powershell
   # Terminer un processus
   Get-Process notepad | ForEach-Object { $_.Kill() }
   ```


</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:25px">

### **3. Objets en PowerShell**

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

</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:24px">

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

</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:25px">

### **4. Combinaison cmdlets, pipelines et objets**

#### **Exemple pratique 3 : Trouver les 5 processus utilisant le plus de mémoire**
```powershell
Get-Process |
    Sort-Object -Property WorkingSet -Descending |
    Select-Object -First 5 Name, WorkingSet
```

</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:24px">

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

</div>

---

## Introduction et bases de PowerShell

#### Introduction à la syntaxe PowerShell : Cmdlets, Pipelines et Objets

<div style="font-size:24px">

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

</div>

---


<!-- _class: lead -->
<!-- _paginate: false -->

## Les commandes de base

---

## Les commandes de base

#### Cmdlets Fondamentaux en PowerShell

<div style="font-size:35px">

<br>

- PowerShell offre plusieurs cmdlets de base qui permettent de découvrir, d’apprendre et de maîtriser ses fonctionnalités. 
- Ces cmdlets sont essentiels pour explorer l’environnement PowerShell et interagir avec celui-ci.
  
</div>

---

## Les commandes de base

#### Cmdlets Fondamentaux en PowerShell

<div style="font-size:23px">

### **1. `Get-Command`**

#### **Description :**
- Permet de **lister toutes les commandes disponibles** dans l’environnement PowerShell, y compris les cmdlets, alias, fonctions, scripts et applications externes.

#### **Syntaxe :**
```powershell
Get-Command [-Name <Nom>] [-CommandType <Type>] [-Module <NomModule>]
```

#### **Exemples :**
1. **Lister toutes les commandes disponibles :**
   ```powershell
   Get-Command
   ```

</div>

---

## Les commandes de base

#### Cmdlets Fondamentaux en PowerShell

<div style="font-size:23px">

### **1. `Get-Command`**

#### **Exemples :**
2. **Rechercher une commande spécifique :**
   ```powershell
   Get-Command -Name Get-Process
   ```

3. **Lister uniquement les cmdlets :**
   ```powershell
   Get-Command -CommandType Cmdlet
   ```

4. **Lister les commandes d’un module spécifique :**
   ```powershell
   Get-Command -Module Microsoft.PowerShell.Management
   ```
</div>

---

## Les commandes de base

#### Cmdlets Fondamentaux en PowerShell

<div style="font-size:20px">

### **2. `Get-Help`**

#### **Description :**
- Fournit **des informations détaillées** sur une cmdlet, une commande ou un concept spécifique.

#### **Syntaxe :**

```powershell
Get-Help <Cmdlet> [-Full] [-Examples] [-Online]
```

#### **Exemples :**
1. **Afficher une aide rapide pour une cmdlet :**
   ```powershell
   Get-Help Get-Process
   ```

2. **Afficher des exemples d’utilisation :**
   ```powershell
   Get-Help Get-Process -Examples
   ```

</div>

---

## Les commandes de base

#### Cmdlets Fondamentaux en PowerShell

<div style="font-size:24px">

### **2. `Get-Help`**


#### **Exemples :**
3. **Afficher des détails complets :**
   ```powershell
   Get-Help Get-Process -Full
   ```

4. **Ouvrir la documentation en ligne (si disponible) :**
   ```powershell
   Get-Help Get-Process -Online
   ```
#### **Astuce :** Si l’aide n’est pas à jour, vous pouvez la mettre à jour avec :
```powershell
Update-Help
```

</div>

---

## Les commandes de base

#### Cmdlets Fondamentaux en PowerShell

<div style="font-size:23px">

### **3. `Get-Alias`**

#### **Description :**
- Permet de **découvrir les alias** des cmdlets PowerShell. Les alias sont des raccourcis pour certaines cmdlets, souvent inspirés des commandes utilisées dans d'autres shells comme Bash.

#### **Syntaxe :**
```powershell
Get-Alias [-Name <NomAlias>] [-Definition <Cmdlet>]
```

#### **Exemples :**
1. **Lister tous les alias disponibles :**
   ```powershell
   Get-Alias
   ```

</div>

---

## Les commandes de base

#### Cmdlets Fondamentaux en PowerShell

<div style="font-size:24px">

### **3. `Get-Alias`**

#### **Exemples :**
2. **Trouver la cmdlet correspondant à un alias spécifique :**
   ```powershell
   Get-Alias -Name gci
   ```

3. **Trouver les alias associés à une cmdlet spécifique :**
   ```powershell
   Get-Alias -Definition Get-ChildItem
   ```

4. **Créer un alias personnalisé :**
   ```powershell
   Set-Alias -Name ll -Value Get-ChildItem
   ```

</div>

---

#### Les commandes de base

##### Cmdlets Fondamentaux en PowerShell

<div style="font-size:18px">

### **4. `Get-Module`**

#### **Description :**
- Fournit des informations sur les modules PowerShell disponibles et chargés.

#### **Syntaxe :**
```powershell
Get-Module [-Name <NomModule>] [-ListAvailable]
```

#### **Exemples :**
1. **Lister les modules chargés actuellement :**
   ```powershell
   Get-Module
   ```

2. **Lister tous les modules disponibles sur le système :**
   ```powershell
   Get-Module -ListAvailable
   ```

3. **Charger un module spécifique :**
   ```powershell
   Import-Module -Name ActiveDirectory
   ```

</div>

---

#### Les commandes de base

##### Cmdlets Fondamentaux en PowerShell

<div style="font-size:18px">

### **5. `Get-Process`**

#### **Description :**
- Affiche les informations sur les processus en cours d’exécution.

#### **Syntaxe :**
```powershell
Get-Process [-Name <NomProcessus>] [-Id <IDProcessus>] [-ComputerName <NomMachine>]
```

#### **Exemples :**
1. **Lister tous les processus en cours :**
   ```powershell
   Get-Process
   ```

2. **Afficher les détails d’un processus spécifique :**
   ```powershell
   Get-Process -Name notepad
   ```

3. **Terminer un processus spécifique (avec `Stop-Process`) :**
   ```powershell
   Get-Process -Name notepad | Stop-Process
   ```

</div>

---

### Les commandes de base

#### Cmdlets Fondamentaux en PowerShell

<div style="font-size:21px">

### **6. `Set-Location`**

#### **Description :**
- Change le répertoire de travail courant.

#### **Syntaxe :**
```powershell
Set-Location [-Path <Chemin>]
```

#### **Exemples :**
1. **Naviguer vers un répertoire spécifique :**
   ```powershell
   Set-Location -Path C:\Windows
   ```

2. **Utiliser des alias pour changer de répertoire :**
   ```powershell
   cd C:\Users
   ```

</div>

---

#### Les commandes de base

##### Cmdlets Fondamentaux en PowerShell

<div style="font-size:18px">


### **7. `Get-ChildItem`**

#### **Description :**
- Liste le contenu d’un répertoire (équivalent de `ls` en Linux).

#### **Syntaxe :**
```powershell
Get-ChildItem [-Path <Chemin>] [-Filter <Filtre>] [-Recurse]
```

#### **Exemples :**
1. **Lister les fichiers dans le répertoire courant :**
   ```powershell
   Get-ChildItem
   ```

2. **Lister les fichiers avec un filtre :**
   ```powershell
   Get-ChildItem -Filter *.txt
   ```

3. **Rechercher récursivement dans les sous-dossiers :**
   ```powershell
   Get-ChildItem -Path C:\ -Recurse
   ```

</div>

---

#### Les commandes de base

##### Cmdlets Fondamentaux en PowerShell

<div style="font-size:29px">


### **8. `Clear-Host`**

#### **Description :**
- Efface l’affichage dans la console PowerShell (équivalent de `clear` en Linux).

#### **Syntaxe :**
```powershell
Clear-Host
```

#### **Exemple :**
```powershell
Clear-Host
```


</div>

---

#### Les commandes de base

##### Cmdlets Fondamentaux en PowerShell

<div style="font-size:29px">


| Cmdlet           | Description                                      |
|------------------|--------------------------------------------------|
| `Get-Command`    | Liste toutes les commandes disponibles.          |
| `Get-Help`       | Fournit des informations détaillées sur une cmdlet. |
| `Get-Alias`      | Montre les alias associés aux cmdlets.           |
| `Get-Module`     | Affiche les modules disponibles ou chargés.      |
| `Get-Process`    | Liste les processus en cours.                    |
| `Set-Location`   | Change le répertoire de travail courant.         |
| `Get-ChildItem`  | Affiche le contenu d’un répertoire.              |
| `Clear-Host`     | Efface l’écran de la console.                    |



</div>

---

## Les commandes de base

#### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:35px">

<br>

- PowerShell offre des cmdlets puissantes pour naviguer et manipuler le système de fichiers.
- Les principales cmdlets utilisées pour explorer et changer de répertoire sont **`Get-ChildItem`** et **`Set-Location`**.


</div>

---

### Les commandes de base

##### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:18px">

### **1. `Get-ChildItem`**

#### **Description :**
- Permet de lister le contenu d’un répertoire.
- Peut être utilisé pour rechercher des fichiers, des dossiers ou d’autres types d’éléments.
- Alias courants : `gci`, `ls`, `dir`.

#### **Syntaxe :**
```powershell
Get-ChildItem [-Path <Chemin>] [-Filter <Filtre>] [-Recurse] [-File] [-Directory]
```

#### **Paramètres clés :**
- **`-Path`** : Spécifie le chemin d’accès au répertoire (par défaut, le répertoire courant).
- **`-Filter`** : Filtre les résultats par nom ou extension.
- **`-Recurse`** : Recherche récursive dans les sous-dossiers.
- **`-File`** : Liste uniquement les fichiers.
- **`-Directory`** : Liste uniquement les répertoires.


</div>

---

#### Les commandes de base

###### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:13px">

### **1. `Get-ChildItem`**

#### **Exemples pratiques :**
1. **Lister le contenu du répertoire courant :**
   ```powershell
   Get-ChildItem
   ```

2. **Lister les fichiers dans un répertoire spécifique :**
   ```powershell
   Get-ChildItem -Path C:\Users
   ```

3. **Lister uniquement les fichiers d’un type spécifique (par exemple, `.txt`) :**
   ```powershell
   Get-ChildItem -Path C:\Documents -Filter *.txt
   ```

4. **Recherche récursive dans les sous-dossiers :**
   ```powershell
   Get-ChildItem -Path C:\Projects -Recurse
   ```

5. **Lister uniquement les dossiers :**
   ```powershell
   Get-ChildItem -Path C:\ -Directory
   ```

6. **Lister uniquement les fichiers :**
   ```powershell
   Get-ChildItem -Path C:\ -File
   ```

7. **Afficher des informations spécifiques (nom, taille) :**
   ```powershell
   Get-ChildItem -Path C:\Documents | Select-Object Name, Length
   
</div>

---

#### Les commandes de base

###### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:28px">

### **2. `Set-Location`**

#### **Description :**
- Change le répertoire de travail courant dans PowerShell.
- Alias courants : `cd`, `chdir`.

#### **Syntaxe :**
```powershell
Set-Location [-Path] <Chemin>
```

#### **Paramètres clés :**
- **`-Path`** : Spécifie le chemin d’accès au répertoire où se déplacer.

</div>

---


#### Les commandes de base

###### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:14px">

### **2. `Set-Location`**

#### **Exemples pratiques :**
1. **Changer vers un répertoire spécifique :**
   ```powershell
   Set-Location -Path C:\Users
   ```

2. **Utiliser un alias pour naviguer :**
   ```powershell
   cd C:\Documents
   ```

3. **Retourner au répertoire précédent :**
   ```powershell
   Set-Location -Path -
   ```

4. **Aller directement au répertoire de l'utilisateur :**
   ```powershell
   Set-Location -Path $HOME
   ```

5. **Naviguer dans un chemin relatif :**
   - Si le répertoire courant est `C:\Users`, aller dans `Documents` :
     ```powershell
     cd Documents
     ```

6. **Afficher le répertoire courant :**
   ```powershell
   Get-Location
   ```

</div>

---

## Les commandes de base

#### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:27px">

### **Combinaison des cmdlets :**

#### **Exemple pratique 1 : Lister tous les fichiers `.log` d’un répertoire spécifique et changer de répertoire**
```powershell
Get-ChildItem -Path C:\Logs -Filter *.log
Set-Location -Path C:\Logs
```

#### **Exemple pratique 2 : Recherche récursive et navigation**
```powershell
# Rechercher un fichier spécifique et naviguer dans son répertoire parent
Get-ChildItem -Path C:\Projects -Recurse -Filter myfile.txt |
    ForEach-Object { Set-Location -Path $_.DirectoryName }
```

</div>

---
## Les commandes de base

#### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:30px">


### **Combinaison des cmdlets :**
#### **Exemple pratique 3 : Naviguer et afficher uniquement les fichiers importants**
```powershell
Set-Location -Path C:\Reports
Get-ChildItem -File | Where-Object { $_.Length -gt 1MB }
```

</div>

---

## Les commandes de base

#### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:35px">


### **Alias utiles pour ces cmdlets :**
| Cmdlet         | Alias   | Description                          |
|----------------|---------|--------------------------------------|
| `Get-ChildItem`| `gci`, `ls`, `dir` | Liste le contenu d’un répertoire. |
| `Set-Location` | `cd`, `chdir`      | Change le répertoire courant.     |

</div>

---

## Les commandes de base

#### Navigation dans le système de fichiers avec PowerShell

<div style="font-size:24px">



| Commande                                   | Description                                                                 |
|-------------------------------------------|-----------------------------------------------------------------------------|
| `Get-ChildItem`                           | Liste les fichiers et dossiers dans le répertoire courant ou spécifié.     |
| `Get-ChildItem -Recurse`                  | Recherche récursive dans les sous-dossiers.                                |
| `Get-ChildItem -File`                     | Liste uniquement les fichiers.                                             |
| `Get-ChildItem -Directory`                | Liste uniquement les répertoires.                                          |
| `Set-Location <Chemin>`                   | Change le répertoire de travail courant.                                   |
| `Get-Location`                            | Affiche le répertoire de travail actuel.                                   |
| `cd ..`                                   | Monte d’un niveau dans la hiérarchie des dossiers.                         |
| `Set-Location -Path -`                    | Revient au répertoire précédent.                                           |
</div>

---

## Les commandes de base

### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:35px">

<br>

- PowerShell offre un ensemble complet de cmdlets pour gérer efficacement les fichiers et les dossiers. 
- Ces cmdlets permettent de créer, supprimer, copier, déplacer et renommer des fichiers ou des dossiers avec une syntaxe simple et intuitive.

</div>

---

## Les commandes de base

### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:16px">

### **1. Création de fichiers et dossiers**

#### **Cmdlet : `New-Item`**
- Permet de créer des fichiers ou des dossiers.

#### **Syntaxe :**
```powershell
New-Item -Path <Chemin> -ItemType <Type> -Name <Nom> [-Value <Contenu>]
```

#### **Exemples :**
1. **Créer un fichier vide :**
   ```powershell
   New-Item -Path C:\Temp -Name example.txt -ItemType File
   ```

2. **Créer un fichier avec du contenu :**
   ```powershell
   New-Item -Path C:\Temp -Name example.txt -ItemType File -Value "Hello, World!"
   ```

3. **Créer un dossier :**
   ```powershell
   New-Item -Path C:\Temp -Name MyFolder -ItemType Directory
   ```

</div>

---
### Les commandes de base

##### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:15px">

### **2. Suppression de fichiers et dossiers**

#### **Cmdlet : `Remove-Item`**
- Supprime des fichiers ou des dossiers.

#### **Syntaxe :**
```powershell
Remove-Item -Path <Chemin> [-Recurse] [-Force]
```

#### **Exemples :**
1. **Supprimer un fichier :**
   ```powershell
   Remove-Item -Path C:\Temp\example.txt
   ```

2. **Supprimer un dossier vide :**
   ```powershell
   Remove-Item -Path C:\Temp\MyFolder
   ```

3. **Supprimer un dossier avec tout son contenu :**
   ```powershell
   Remove-Item -Path C:\Temp\MyFolder -Recurse
   ```

4. **Forcer la suppression (même si verrouillé) :**
   ```powershell
   Remove-Item -Path C:\Temp\example.txt -Force
   ```

</div>

---

### Les commandes de base

#### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:17px">

### **3. Copie de fichiers et dossiers**

#### **Cmdlet : `Copy-Item`**
- Permet de copier des fichiers ou des dossiers.

#### **Syntaxe :**
```powershell
Copy-Item -Path <Source> -Destination <Destination> [-Recurse] [-Force]
```

#### **Exemples :**
1. **Copier un fichier :**
   ```powershell
   Copy-Item -Path C:\Temp\example.txt -Destination C:\Backup
   ```

2. **Copier un dossier et son contenu :**
   ```powershell
   Copy-Item -Path C:\Temp\MyFolder -Destination C:\Backup -Recurse
   ```

3. **Forcer la copie (écrase les fichiers existants) :**
   ```powershell
   Copy-Item -Path C:\Temp\example.txt -Destination C:\Backup -Force
   ```

</div>

---


#### Les commandes de base

##### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:15px">

### **4. Déplacement de fichiers et dossiers**

#### **Cmdlet : `Move-Item`**
- Permet de déplacer ou renommer des fichiers ou des dossiers.

#### **Syntaxe :**
```powershell
Move-Item -Path <Source> -Destination <Destination> [-Force]
```

#### **Exemples :**
1. **Déplacer un fichier :**
   ```powershell
   Move-Item -Path C:\Temp\example.txt -Destination C:\Backup
   ```

2. **Déplacer un dossier et son contenu :**
   ```powershell
   Move-Item -Path C:\Temp\MyFolder -Destination C:\Backup
   ```

3. **Renommer un fichier ou dossier lors du déplacement :**
   ```powershell
   Move-Item -Path C:\Temp\example.txt -Destination C:\Temp\new_example.txt
   ```

4. **Forcer le déplacement :**
   ```powershell
   Move-Item -Path C:\Temp\example.txt -Destination C:\Backup -Force
   ```

</div>

---

#### Les commandes de base

##### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:20px">

### **5. Renommage de fichiers et dossiers**

#### **Cmdlet : `Rename-Item`**
- Renomme un fichier ou un dossier.

#### **Syntaxe :**
```powershell
Rename-Item -Path <Chemin> -NewName <NouveauNom>
```

#### **Exemples :**
1. **Renommer un fichier :**
   ```powershell
   Rename-Item -Path C:\Temp\example.txt -NewName new_example.txt
   ```

2. **Renommer un dossier :**
   ```powershell
   Rename-Item -Path C:\Temp\MyFolder -NewName MyNewFolder
   ```

</div>

---

#### Les commandes de base

##### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:15px">

### **6. Vérification des fichiers et dossiers**

#### **Cmdlet : `Test-Path`**
- Vérifie si un fichier ou un dossier existe.

#### **Syntaxe :**
```powershell
Test-Path -Path <Chemin>
```

#### **Exemples :**
1. **Vérifier si un fichier existe :**
   ```powershell
   Test-Path -Path C:\Temp\example.txt
   ```

2. **Vérifier si un dossier existe :**
   ```powershell
   Test-Path -Path C:\Temp\MyFolder
   ```

3. **Condition basée sur l'existence d'un fichier :**
   ```powershell
   if (Test-Path -Path C:\Temp\example.txt) {
       Write-Output "Le fichier existe."
   } else {
       Write-Output "Le fichier n'existe pas."
   }
   ```

</div>

---

#### Les commandes de base

##### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:25px">

### **Exemple pratique : Gestion complète d’un fichier**

1. **Créer un fichier avec du contenu, le copier, le déplacer, puis le supprimer :**
   ```powershell
   # Créer un fichier avec du contenu
   New-Item -Path C:\Temp -Name example.txt -ItemType File -Value "Contenu initial"

   # Copier le fichier
   Copy-Item -Path C:\Temp\example.txt -Destination C:\Backup

   # Déplacer et renommer le fichier
   Move-Item -Path C:\Temp\example.txt -Destination C:\Temp\renamed_example.txt

   # Supprimer le fichier
   Remove-Item -Path C:\Temp\renamed_example.txt
   ```

</div>

---

## Les commandes de base

### Gestion des fichiers et des dossiers avec PowerShell

<div style="font-size:30px">

##### **Résumé des cmdlets pour la gestion des fichiers et dossiers**

| Cmdlet          | Description                                   |
|------------------|-----------------------------------------------|
| `New-Item`       | Crée un fichier ou un dossier.                |
| `Remove-Item`    | Supprime un fichier ou un dossier.            |
| `Copy-Item`      | Copie un fichier ou un dossier.               |
| `Move-Item`      | Déplace ou renomme un fichier ou un dossier.  |
| `Rename-Item`    | Renomme un fichier ou un dossier.             |
| `Test-Path`      | Vérifie l’existence d’un fichier ou d’un dossier.|

</div>

---

## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<br>

<div style="font-size:36px">


- Le pipeline (`|`) est l'un des concepts fondamentaux de PowerShell. 
- Il permet de chaîner plusieurs cmdlets en envoyant la **sortie d’une cmdlet** en **entrée d’une autre cmdlet**, facilitant ainsi des traitements complexes en une seule commande.
</div>

---

## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:28px">

### **1. Comment fonctionne le pipeline en PowerShell ?**
- PowerShell traite la sortie d’une cmdlet sous forme d’objets (pas du texte brut comme dans d'autres shells).
- Ces objets sont transmis au pipeline et deviennent l’entrée de la cmdlet suivante.
- Cela permet de manipuler directement les propriétés et méthodes des objets.

#### **Syntaxe :**
```powershell
<Cmdlet1> | <Cmdlet2> | <Cmdlet3>
```

</div>

---
## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:24px">

### **2. Exemples de base avec des pipelines**

#### **Lister, filtrer et trier des fichiers**
1. **Lister les fichiers et dossiers, puis filtrer les fichiers uniquement :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Where-Object {$_.PSIsContainer -eq $false}
   ```

2. **Lister les fichiers `.txt` triés par taille décroissante :**
   ```powershell
   Get-ChildItem -Path C:\Temp -Filter *.txt | Sort-Object -Property Length -Descending
   ```

3. **Lister les 5 plus gros fichiers dans un dossier :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Sort-Object -Property Length -Descending | Select-Object -First 5
   ```

</div>

---

## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:24px">

### **3. Manipulation des processus**

#### **Afficher les processus consommant beaucoup de CPU :**
```powershell
Get-Process | Where-Object {$_.CPU -gt 10}
```

#### **Trier les processus par mémoire utilisée et afficher les 3 premiers :**
```powershell
Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 3
```

#### **Arrêter tous les processus nommés "notepad" :**
```powershell
Get-Process -Name notepad | Stop-Process
```

</div>

---

## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:29px">

### **4. Exportation de données**

#### **Exporter la liste des services en cours d’exécution dans un fichier CSV :**
```powershell
Get-Service | Where-Object {$_.Status -eq "Running"} | Export-Csv -Path C:\Temp\Services.csv -NoTypeInformation
```

#### **Exporter les 10 fichiers les plus récents dans un dossier :**
```powershell
Get-ChildItem -Path C:\Temp | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 10 | Export-Csv -Path C:\Temp\RecentFiles.csv -NoTypeInformation
```

</div>

---

## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:24px">

### **5. Combinaisons avancées**

#### **Rechercher des fichiers spécifiques et en afficher les détails :**
```powershell
Get-ChildItem -Path C:\Projects -Filter *.log -Recurse |
    Where-Object {$_.Length -gt 1MB} |
    Select-Object Name, Length, LastWriteTime
```

#### **Lister les services en cours, trier par nom, et générer un rapport HTML :**
```powershell
Get-Service | Where-Object {$_.Status -eq "Running"} | Sort-Object -Property Name | ConvertTo-Html -Property Name, Status, StartType | Out-File -Path C:\Temp\ServicesReport.html
```

#### **Analyser les journaux d'événements Windows :**
```powershell
Get-EventLog -LogName System | Where-Object {$_.EntryType -eq "Error"} | Select-Object Source, EventID, Message
```

</div>

---

## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:20px">

### **6. Utilisation avec des scripts personnalisés**

#### **Transformation de données en chaîne avec des fonctions :**
- Les pipelines fonctionnent aussi avec les **scripts personnalisés** et les **fonctions**.

1. **Créer une fonction pour filtrer des fichiers :**
   ```powershell
   function Get-LargeFiles {
       param(
           [string]$Path,
           [int]$Size
       )
       Get-ChildItem -Path $Path -Recurse | Where-Object {$_.Length -gt $Size}
   }
   ```

2. **Utiliser la fonction dans un pipeline :**
   ```powershell
   Get-LargeFiles -Path C:\Temp -Size 100KB | Select-Object Name, Length
   ```

</div>

---

## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:30px">

### **7. Étapes multiples avec des pipelines**

#### **Pipeline avec plusieurs étapes pour un traitement complexe :**
```powershell
# Étape 1 : Récupérer tous les fichiers
# Étape 2 : Filtrer les fichiers .txt
# Étape 3 : Trier par taille décroissante
# Étape 4 : Afficher les 3 plus gros fichiers
Get-ChildItem -Path C:\Temp |
    Where-Object {$_.Extension -eq ".txt"} |
    Sort-Object -Property Length -Descending |
    Select-Object -First 3
```

</div>

---

## Les commandes de base

### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:20px">

### **8. Astuces pour travailler avec les pipelines**

#### **Afficher les résultats intermédiaires avec `Write-Output` :**
- Pour déboguer des pipelines complexes, utilisez `Write-Output` ou `Out-Host` pour afficher les résultats intermédiaires.

```powershell
Get-ChildItem -Path C:\Temp |
    Write-Output |
    Where-Object {$_.Length -gt 1MB} |
    Select-Object Name, Length
```

#### **Utiliser des commandes personnalisées dans les pipelines :**
- Les cmdlets personnalisées, comme `ForEach-Object` ou `Select-Object`, peuvent être utilisées pour manipuler ou transformer les objets.

```powershell
Get-ChildItem -Path C:\Temp |
    ForEach-Object { $_.Name.ToUpper() }
```

</div>

---

### Les commandes de base

#### Utilisation des Pipelines pour Chaîner des Cmdlets

<div style="font-size:20px">

### **Résumé des Cmdlets courantes pour les pipelines**

| Cmdlet             | Description                                          |
|--------------------|------------------------------------------------------|
| `Where-Object`     | Filtrer les objets selon une condition.              |
| `Sort-Object`      | Trier les objets par une ou plusieurs propriétés.    |
| `Select-Object`    | Sélectionner des propriétés ou limiter les résultats.|
| `Export-Csv`       | Exporter les données dans un fichier CSV.            |
| `ConvertTo-Html`   | Convertir les données en tableau HTML.               |
| `Out-File`         | Sauvegarder les résultats dans un fichier texte.     |
| `ForEach-Object`   | Exécuter un script sur chaque objet du pipeline.     |

</div>

---


<!-- _class: lead -->
<!-- _paginate: false -->

## Scripting : Variables et structures de données - Contrôle de flux

---

#### Variables et structures de données - Contrôle de flux

##### Variables et structures de données

<div style="font-size:17px">

#### **1. Déclaration de Variables**

- En PowerShell, les variables commencent toujours par un symbole `$`.
- Une variable peut être déclarée et initialisée sans type explicite (PowerShell est typé dynamiquement).

#### **Syntaxe :**
```powershell
$NomVariable = Valeur
```

#### **Exemples :**
1. **Déclarer et assigner une valeur à une variable :**
   ```powershell
   $Nom = "Alice"
   $Age = 30
   ```

2. **Afficher la valeur d’une variable :**
   ```powershell
   Write-Output $Nom
   ```

3. **Modifier la valeur d’une variable :**
   ```powershell
   $Age = 31
   ```

</div>

---

### Variables et structures de données - Contrôle de flux

#### Variables et structures de données

<div style="font-size:23px">

#### **2. Variables automatiques**
PowerShell fournit des **variables automatiques** qui stockent des informations spécifiques.

| Variable      | Description                              |
|---------------|------------------------------------------|
| `$PSVersionTable` | Informations sur la version PowerShell. |
| `$HOME`       | Répertoire personnel de l’utilisateur.   |
| `$Error`      | Liste des dernières erreurs rencontrées. |

#### **Exemple :**
```powershell
Write-Output $HOME
```

</div>

---

##### Variables et structures de données - Contrôle de flux

###### Variables et structures de données

<div style="font-size:19px">

### **Types de Données en PowerShell**

#### **Types courants :**
| Type         | Exemple                        |
|--------------|--------------------------------|
| String       | `"Hello, World"`               |
| Int32        | `42`                           |
| Double       | `3.14`                         |
| Boolean      | `$true`, `$false`              |
| Array        | `@(1, 2, 3)`                   |
| HashTable    | `@{Key = "Value"}`             |
| DateTime     | `[datetime]::Now`              |

#### **Déclaration explicite d’un type :**
```powershell
[int]$Age = 25
[string]$Nom = "Alice"
```

#### **Conversion de type :**
1. **Convertir une chaîne en entier :**
   ```powershell
   $Nombre = [int]"42"
   ```

2. **Obtenir le type d’une variable :**
   ```powershell
   $Variable = 3.14
   $Variable.GetType()
   ```


</div>

---

##### Variables et structures de données - Contrôle de flux

###### Variables et structures de données

<div style="font-size:23px">

### **Types de Données en PowerShell**

#### **Déclaration explicite d’un type :**
```powershell
[int]$Age = 25
[string]$Nom = "Alice"
```

#### **Conversion de type :**
1. **Convertir une chaîne en entier :**
   ```powershell
   $Nombre = [int]"42"
   ```

2. **Obtenir le type d’une variable :**
   ```powershell
   $Variable = 3.14
   $Variable.GetType()
   ```


</div>

---

##### Variables et structures de données - Contrôle de flux

###### Variables et structures de données

<div style="font-size:18px">

### **Tableaux en PowerShell**

Un **tableau** (Array) est une collection ordonnée d’éléments, accessible via des indices.

#### **Déclaration d’un tableau :**
1. **Tableau simple :**
   ```powershell
   $Nombres = @(1, 2, 3, 4, 5)
   ```

2. **Accéder aux éléments du tableau :**
   ```powershell
   $Nombres[0]  # Premier élément
   $Nombres[-1] # Dernier élément
   ```

3. **Ajouter un élément à un tableau :**
   ```powershell
   $Nombres += 6
   ```

4. **Itérer sur un tableau :**
   ```powershell
   foreach ($Nombre in $Nombres) {
       Write-Output $Nombre
   }
   ```

</div>

---

##### Variables et structures de données - Contrôle de flux

###### Variables et structures de données

<div style="font-size:29px">

### **Tableaux en PowerShell**

Un **tableau** (Array) est une collection ordonnée d’éléments, accessible via des indices.

#### **Méthodes de tableau :**
- Obtenir le nombre d’éléments :
  ```powershell
  $Nombres.Count
  ```

- Filtrer les éléments :
  ```powershell
  $Nombres | Where-Object {$_ -gt 3}
  ```

</div>

---

##### Variables et structures de données - Contrôle de flux

###### Variables et structures de données

<div style="font-size:25px">

### **Tableaux Associatifs (Hash Tables)**

Les **hash tables** sont des collections de paires clé-valeur.

#### **Déclaration d’une hash table :**
```powershell
$Infos = @{
    Nom = "Alice"
    Age = 30
    Ville = "Paris"
}
```

#### **Accéder à une valeur par clé :**
```powershell
$Infos["Nom"]  # Renvoie "Alice"
```

</div>

---

##### Variables et structures de données - Contrôle de flux

###### Variables et structures de données

<div style="font-size:22px">

### **Tableaux Associatifs (Hash Tables)**

#### **Ajouter ou modifier une entrée :**
1. **Ajouter une clé :**
   ```powershell
   $Infos["Pays"] = "France"
   ```

2. **Modifier une valeur :**
   ```powershell
   $Infos["Ville"] = "Lyon"
   ```

#### **Itérer sur une hash table :**
```powershell
foreach ($Cle in $Infos.Keys) {
    Write-Output "$Cle : $($Infos[$Cle])"
}
```


</div>

---

### Variables et structures de données - Contrôle de flux

#### Variables et structures de données

<div style="font-size:25px">

### **Tableaux Associatifs (Hash Tables)**

#### **Exemple pratique :**
```powershell
$Serveurs = @{
    "Web" = "192.168.1.1"
    "DB" = "192.168.1.2"
    "Mail" = "192.168.1.3"
}

# Afficher tous les serveurs
foreach ($Role in $Serveurs.Keys) {
    Write-Output "$Role : $($Serveurs[$Role])"
}
```


</div>

---

#### Variables et structures de données - Contrôle de flux

###### Variables et structures de données

<div style="font-size:20px">

### **Exemple Complet : Variables, Tableaux et Hash Tables**

#### **Contexte : Gestion d’un inventaire de produits**
```powershell
# Déclaration d’un tableau de produits
$Produits = @(
    @{ID = 1; Nom = "Ordinateur"; Prix = 800}
    @{ID = 2; Nom = "Clavier"; Prix = 50}
    @{ID = 3; Nom = "Souris"; Prix = 25}
)

# Afficher tous les produits
foreach ($Produit in $Produits) {
    Write-Output "ID: $($Produit.ID), Nom: $($Produit.Nom), Prix: $($Produit.Prix)€"
}

# Ajouter un produit
$NouveauProduit = @{ID = 4; Nom = "Écran"; Prix = 200}
$Produits += $NouveauProduit

# Filtrer les produits à plus de 100 €
$Produits | Where-Object { $_.Prix -gt 100 }
```


</div>

---

## Variables et structures de données - Contrôle de flux

#### Variables et structures de données

<div style="font-size:29px">

### **Résumé des Concepts**

| Concept                 | Description                                   |
|-------------------------|-----------------------------------------------|
| **Variables**           | Stockent des données avec `$` comme préfixe. |
| **Types de données**    | Incluent chaînes, nombres, booléens, etc.    |
| **Tableaux**            | Collections ordonnées d’éléments.            |
| **Hash Tables**         | Collections clé-valeur.                      |


</div>

---

### Variables et structures de données - Contrôle de flux

#### Structures Conditionnelles, Boucles et Filtres/Sélecteurs en PowerShell

<div style="font-size:21px">

### **1. Structures Conditionnelles**

#### **a. `if`**
Le `if` permet d'exécuter des blocs de code en fonction d'une ou plusieurs conditions.

##### **Syntaxe :**
```powershell
if (<condition>) {
    <instructions>
} elseif (<condition>) {
    <instructions>
} else {
    <instructions>
}
```

</div>

---

#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs en PowerShell

<div style="font-size:21px">

### **1. Structures Conditionnelles**

#### **a. `if`**
Le `if` permet d'exécuter des blocs de code en fonction d'une ou plusieurs conditions.

##### **Exemple :**
```powershell
$Nombre = 10

if ($Nombre -lt 0) {
    Write-Output "Nombre négatif"
} elseif ($Nombre -eq 0) {
    Write-Output "Nombre nul"
} else {
    Write-Output "Nombre positif"
}
```

</div>

---

#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs en PowerShell

<div style="font-size:27px">

### **1. Structures Conditionnelles**

#### **b. `switch`**
Le `switch` permet d'évaluer une variable ou une expression contre plusieurs cas.

##### **Syntaxe :**
```powershell
switch (<expression>) {
    <valeur1> { <instructions> }
    <valeur2> { <instructions> }
    Default { <instructions> }
}
```
</div>

---
#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs en PowerShell

<div style="font-size:25px">

### **1. Structures Conditionnelles**

#### **b. `switch`**
Le `switch` permet d'évaluer une variable ou une expression contre plusieurs cas.

##### **Exemple :**
```powershell
$Jour = "Mardi"

switch ($Jour) {
    "Lundi" { Write-Output "Début de la semaine" }
    "Samedi" { Write-Output "Weekend !" }
    "Dimanche" { Write-Output "Weekend !" }
    Default { Write-Output "Jour ordinaire" }
}
```
</div>

---

#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs en PowerShell

<div style="font-size:23px">

### **2. Boucles**

#### **a. `for`**
La boucle `for` est utilisée pour exécuter un bloc de code un nombre défini de fois.

##### **Syntaxe :**
```powershell
for (<initialisation>; <condition>; <incrément>) {
    <instructions>
}
```

##### **Exemple :**
```powershell
for ($i = 1; $i -le 5; $i++) {
    Write-Output "Itération $i"
}
```
</div>

---

#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs en PowerShell

<div style="font-size:21px">

### **2. Boucles**

#### **b. `foreach`**
La boucle `foreach` permet d'itérer sur chaque élément d'une collection.

##### **Syntaxe :**
```powershell
foreach ($element in <collection>) {
    <instructions>
}
```

##### **Exemple :**
```powershell
$Liste = @(10, 20, 30)

foreach ($Valeur in $Liste) {
    Write-Output "Valeur : $Valeur"
}
```
</div>

---

#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs en PowerShell

<div style="font-size:21px">

### **2. Boucles**

#### **c. `while`**
La boucle `while` exécute un bloc de code tant qu'une condition est vraie.

##### **Syntaxe :**
```powershell
while (<condition>) {
    <instructions>
}
```

##### **Exemple :**
```powershell
$Compteur = 1
while ($Compteur -le 5) {
    Write-Output "Compteur : $Compteur"
    $Compteur++
}
```
</div>

---
#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs 

<div style="font-size:21px">

### **2. Boucles**

#### **d. `do-until`**
La boucle `do-until` exécute un bloc de code au moins une fois, puis continue tant qu'une condition est fausse.

##### **Syntaxe :**
```powershell
do {
    <instructions>
} until (<condition>)
```

##### **Exemple :**
```powershell
$Compteur = 1
do {
    Write-Output "Compteur : $Compteur"
    $Compteur++
} until ($Compteur -gt 5)
```

</div>

---

#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs 

<div style="font-size:24px">

### **3. Utilisation des Filtres (`Where-Object`)**

#### **Description :**
`Where-Object` filtre une collection d'objets selon une condition définie.

##### **Syntaxe :**
```powershell
<collection> | Where-Object { <condition> }
```

##### **Exemples :**
1. **Filtrer les fichiers de plus de 1 Mo dans un dossier :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Where-Object { $_.Length -gt 1MB }
   ```

</div>

---

### Variables et structures de données - Contrôle de flux

#### Structures Conditionnelles, Boucles et Filtres/Sélecteurs 

<div style="font-size:25px">

### **3. Utilisation des Filtres (`Where-Object`)**

##### **Exemples :**
2. **Afficher les processus consommant plus de 10 % de CPU :**
   ```powershell
   Get-Process | Where-Object { $_.CPU -gt 10 }
   ```

3. **Lister les services démarrés :**
   ```powershell
   Get-Service | Where-Object { $_.Status -eq "Running" }
   ```

</div>

---

### Variables et structures de données - Contrôle de flux

#### Structures Conditionnelles, Boucles et Filtres/Sélecteurs 

<div style="font-size:25px">

### **4. Utilisation des Sélecteurs (`Select-Object`)**

#### **Description :**
`Select-Object` sélectionne des propriétés spécifiques d'une collection d'objets ou limite les résultats.

##### **Syntaxe :**
```powershell
<collection> | Select-Object [-Property <Propriétés>] [-First <Nombre>] [-Last <Nombre>]
```
</div>

---

### Variables et structures de données - Contrôle de flux

#### Structures Conditionnelles, Boucles et Filtres/Sélecteurs 

<div style="font-size:22px">

### **4. Utilisation des Sélecteurs (`Select-Object`)**

##### **Exemples :**
1. **Sélectionner des propriétés spécifiques :**
   ```powershell
   Get-Process | Select-Object Name, CPU
   ```

2. **Limiter les résultats aux 5 premiers éléments :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Select-Object -First 5
   ```

3. **Récupérer les 3 derniers fichiers modifiés :**
   ```powershell
   Get-ChildItem -Path C:\Temp | Sort-Object LastWriteTime -Descending | Select-Object -Last 3
   ```

</div>

---

### Variables et structures de données - Contrôle de flux

#### Structures Conditionnelles, Boucles et Filtres/Sélecteurs 

<div style="font-size:18px">

### **4. Utilisation des Sélecteurs (`Select-Object`)**

### **Exemple Complet**

#### **Contexte : Gestion des fichiers dans un répertoire**
```powershell
# Parcourir les fichiers d'un répertoire
$Fichiers = Get-ChildItem -Path C:\Temp

# Filtrer les fichiers de plus de 1 Mo
$FichiersGrands = $Fichiers | Where-Object { $_.Length -gt 1MB }

# Trier les fichiers par taille décroissante et sélectionner les 3 premiers
$TopFichiers = $FichiersGrands | Sort-Object -Property Length -Descending | Select-Object -First 3

# Afficher les fichiers sélectionnés
foreach ($Fichier in $TopFichiers) {
    Write-Output "Nom : $($Fichier.Name), Taille : $($Fichier.Length)"
}
```
</div>

---

#### Variables et structures de données - Contrôle de flux

##### Structures Conditionnelles, Boucles et Filtres/Sélecteurs 

<div style="font-size:25px">

### **4. Utilisation des Sélecteurs (`Select-Object`)**

### **Résumé des Cmdlets**

| Concept              | Cmdlet ou Structure       | Description                                         |
|----------------------|---------------------------|---------------------------------------------------|
| **Conditionnelles**  | `if`, `switch`           | Exécution conditionnelle des blocs de code.      |
| **Boucles**          | `for`, `foreach`, `while`, `do-until` | Répétition de blocs de code selon des conditions. |
| **Filtrage**         | `Where-Object`           | Filtre les objets en fonction de conditions.      |
| **Sélection**        | `Select-Object`          | Sélectionne des propriétés ou limite les résultats.|

</div>

---



<!-- _class: lead -->
<!-- _paginate: false -->

## Gestion des systèmes et des services Windows

---

## Gestion des systèmes et des services Windows

### Gestion des Processus Windows 

<div style="font-size:35px">

<br>

- PowerShell offre des cmdlets puissantes pour gérer les processus sur un système Windows, comme les surveiller, les terminer ou interagir avec eux.

</div>

---


## Gestion des systèmes et des services Windows

### Gestion des Processus Windows 

<div style="font-size:25px">


### **1. Gestion des Processus avec `Get-Process` et Autres Cmdlets**

#### **a. `Get-Process`**
- Liste tous les processus en cours d’exécution.
- Affiche des détails tels que le nom, l’ID (PID), l’utilisation CPU, la mémoire, etc.

##### **Syntaxe :**
```powershell
Get-Process [-Name <Nom>] [-Id <ID>] [-ComputerName <NomMachine>]
```
</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:20px">

### **1. Gestion des Processus avec `Get-Process` et Autres Cmdlets**

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

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:17px">

### **1. Gestion des Processus avec `Get-Process` et Autres Cmdlets**

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

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:17px">

### **1. Gestion des Processus avec `Get-Process` et Autres Cmdlets**

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

</div>

---
### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:25px">

### **1. Gestion des Processus avec `Get-Process` et Autres Cmdlets**

#### **d. Surveillance des Processus**
1. **Lister les processus triés par utilisation CPU décroissante :**
   ```powershell
   Get-Process | Sort-Object CPU -Descending
   ```

2. **Afficher les 5 processus consommant le plus de mémoire :**
   ```powershell
   Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5
   ```

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:27px">

### **2. Gestion des Services Windows**

Les services Windows peuvent être surveillés et contrôlés via PowerShell à l’aide de cmdlets comme `Get-Service`, `Start-Service`, et `Stop-Service`.


#### **a. `Get-Service`**
- Liste les services installés sur la machine, qu’ils soient en cours d’exécution ou non.

##### **Syntaxe :**
```powershell
Get-Service [-Name <Nom>] [-DisplayName <NomAffichage>] [-ComputerName <NomMachine>]
```

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:21px">

### **2. Gestion des Services Windows**

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

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:21px">

### **2. Gestion des Services Windows**

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

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:21px">

### **2. Gestion des Services Windows**

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

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:21px">

### **2. Gestion des Services Windows**

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

</div>

---
#### Gestion des systèmes et des services Windows

##### Gestion des Processus Windows 

<div style="font-size:20px">

### **2. Gestion des Services Windows**

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

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:20px">

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

</div>

---

### Gestion des systèmes et des services Windows

#### Gestion des Processus Windows 

<div style="font-size:20px">

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

</div>

---

