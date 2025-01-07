### **TP PowerShell : Création de Scripts**

---

### **1. TP : Gestion des Utilisateurs Locaux**

#### **Énoncé :**
Créez un script PowerShell qui automatise la gestion des utilisateurs locaux. Le script doit permettre de :

1. Ajouter un utilisateur local avec un nom et un mot de passe.
2. Supprimer un utilisateur local.
3. Lister tous les utilisateurs locaux existants.

#### **Contraintes :**
- Utilisez une fonction pour chaque opération (`AjouterUtilisateur`, `SupprimerUtilisateur`, `ListerUtilisateurs`).
- Gérez les erreurs si l’utilisateur existe déjà ou n’existe pas.

---

### **2. TP : Gestion des Services Windows**

#### **Énoncé :**
Créez un script PowerShell qui permet de gérer les services Windows. Le script doit :

1. Vérifier l’état d’un service donné (ex. : `Spooler`).
2. Redémarrer un service s’il est arrêté.
3. Exporter les résultats dans un fichier texte.

#### **Contraintes :**
- Utilisez des paramètres dynamiques pour fournir le nom du service.
- Ajoutez une gestion des erreurs en cas d’échec du redémarrage.

---

### **3. TP : Gestion de Fichiers et Rapports**

#### **Énoncé :**
Créez un script PowerShell qui analyse un dossier donné et génère un rapport contenant :

1. La liste des fichiers avec leur taille.
2. Les 5 plus gros fichiers.
3. La somme totale des tailles des fichiers.

#### **Contraintes :**
- Le rapport doit être exporté au format CSV.
- Gérez une erreur si le dossier n’existe pas.

---

### **4. TP : Lecture et Validation de Fichiers**

#### **Énoncé :**
Créez un script PowerShell qui valide un fichier texte contenant une liste de noms (un par ligne). Le script doit :

1. Vérifier si le fichier existe.
2. Lister les noms qui commencent par une lettre spécifique (par exemple, `A`).
3. Générer un nouveau fichier contenant uniquement les noms valides.

#### **Contraintes :**
- Utilisez un paramètre pour spécifier la lettre de filtre.
- Gérez une erreur si le fichier est vide.

---

### **5. TP : Automatisation avec Try-Catch-Finally**

#### **Énoncé :**
Créez un script PowerShell qui :

1. Copie un fichier d’un dossier source vers un dossier de destination.
2. Renomme le fichier après la copie.
3. Supprime le fichier d’origine après vérification.

#### **Contraintes :**
- Gérez les erreurs si le fichier source n’existe pas ou si la copie échoue.
- Ajoutez un bloc `Finally` pour afficher un message de nettoyage final.

---

### **6. TP : Fonction Réutilisable pour les Logs**

#### **Énoncé :**
Créez une fonction PowerShell qui permet de gérer les logs d’une application. La fonction doit :

1. Ajouter un message de log (avec horodatage) dans un fichier de log.
2. Lire le contenu complet des logs.
3. Supprimer les logs plus anciens qu’une semaine.

#### **Contraintes :**
- Le fichier de log doit être spécifié en paramètre.
- Gérez les erreurs si le fichier n’existe pas.

---

### **7. TP : Analyse des Performances**

#### **Énoncé :**
Créez un script PowerShell qui analyse les performances du système. Le script doit :

1. Lister les processus consommant plus de 10 % de CPU.
2. Sauvegarder les informations des processus dans un fichier JSON.
3. Terminer un processus donné par son nom (ex. : `notepad`).

#### **Contraintes :**
- Utilisez `Try-Catch` pour capturer les erreurs lors de la terminaison d’un processus.
- Ajoutez un paramètre pour spécifier le seuil de CPU.

---

### **8. TP : Création Dynamique d’Utilisateurs**

#### **Énoncé :**
Créez un script PowerShell qui crée 10 utilisateurs locaux automatiquement avec :

1. Un nom généré dynamiquement (ex. : `User1`, `User2`, ...).
2. Un mot de passe aléatoire pour chaque utilisateur.
3. Un fichier CSV contenant les informations des utilisateurs créés (nom et mot de passe).

#### **Contraintes :**
- Gérez les doublons si un utilisateur existe déjà.
- Vérifiez les permissions nécessaires pour exécuter le script.

---

### **9. TP : Surveillance de Répertoire**

#### **Énoncé :**
Créez un script PowerShell qui surveille un dossier donné et :

1. Détecte tout ajout ou modification de fichier.
2. Enregistre les changements dans un fichier journal (nom, date et type de modification).
3. Supprime automatiquement les fichiers de plus de 30 jours.

#### **Contraintes :**
- Utilisez la cmdlet `Register-ObjectEvent` pour surveiller les modifications.
- Gérez une erreur si le dossier n’existe pas.

---

### **10. TP : Exécution Planifiée avec PowerShell**

#### **Énoncé :**
Créez un script PowerShell qui planifie une tâche dans le Planificateur de tâches Windows pour :

1. Exécuter un script PowerShell spécifique à une heure donnée.
2. Vérifier si la tâche a été créée avec succès.
3. Supprimer la tâche planifiée après l’exécution.

#### **Contraintes :**
- Utilisez la cmdlet `Register-ScheduledTask` pour créer la tâche.
- Gérez les erreurs si la tâche existe déjà.

