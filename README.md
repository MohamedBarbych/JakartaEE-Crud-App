# jakartaee-crud-app

Un projet CRUD basé sur Jakarta EE utilisant Hibernate ORM, Jakarta Persistence, MySQL et des technologies modernes de Java pour construire des applications web pilotées par une base de données.

## Table des matières
1. [Introduction](#introduction)
2. [Technologies utilisées](#technologies-utilisées)
3. [Structure du projet](#structure-du-projet)
4. [Fonctionnalités](#fonctionnalités)
5. [Configuration du projet](#configuration-du-projet)
6. [Guide d'exécution](#guide-dexécution)
7. [Captures d'écran](#captures-décran)
8. [Conclusion](#conclusion)

---

## Introduction

Ce projet illustre la mise en œuvre d'une application web permettant de gérer des **clients**, **produits**, et **commandes**.  
L'application suit l'architecture **MVC (Model-View-Controller)** et exploite les standards de Jakarta EE, accompagnés de MySQL pour le stockage des données.

---

## Technologies utilisées

- **Jakarta EE (Servlets, JSP, JSTL)** : Structure l'application en suivant l'architecture MVC.
- **Hibernate ORM** : Simplifie la gestion des entités Java et leur persistance dans MySQL.
- **MySQL** : Base de données relationnelle utilisée pour stocker les entités.
- **Apache Tomcat** : Serveur d'applications pour déployer l'application.
- **Maven** : Gestionnaire de dépendances.
- **Lombok** : Réduit le code répétitif en Java.

---

## Structure du projet

Le projet est organisé en couches :  
- **Modèle** : Définit les entités persistantes.  
- **DAO** : Fournit des méthodes pour interagir avec la base de données.  
- **Contrôleur** : Traite les requêtes des utilisateurs via des servlets.  
- **Vue** : Fournit l'interface utilisateur avec JSP et JSTL.  


## Fonctionnalités

### Gestion des clients
- **Liste des clients** : Affiche une liste de tous les clients enregistrés.
- **Ajout d’un nouveau client** : Permet d'ajouter un client avec des informations spécifiques.
- **Modification des informations d’un client** : Met à jour les informations d'un client existant.
- **Suppression d’un client** : Supprime un client de la base de données.

### Gestion des produits
- **Liste des produits** : Affiche une liste de tous les produits disponibles.
- **Ajout d’un nouveau produit** : Permet d'ajouter un produit avec des informations spécifiques.
- **Modification des informations d’un produit** : Met à jour les informations d'un produit existant.
- **Suppression d’un produit** : Supprime un produit de la base de données.

### Gestion des commandes
- **Liste des commandes** : Affiche une liste de toutes les commandes passées.
- **Création d’une nouvelle commande** : Permet de créer une commande associant un client et des produits.
- **Visualisation des détails d’une commande** : Montre les détails d'une commande spécifique.

---

## Configuration du projet

1. Clonez ce dépôt :  
   ```bash
   git clone https://github.com/MohamedBarbych/jakartaee-crud-app.git
   cd jakartaee-crud-app



## Conclusion

Ce projet met e lumière les concepts clés de Jakarta EE et leur application dans des projets réels. Des améliorations futures pourraient inclure :  
- Une meilleure validation des formulaires.  
- L'intégration de graphiques pour visualiser les données.

---

### Instructions supplémentaires :
1. Créez un dossier `screenshots` dans votre dépôt GitHub.  
2. Ajoutez les captures d'écran pour chaque fonctionnalité et diagramme dans le dossier `screenshots`.  
3. Mettez à jour les chemins des captures d'écran dans le fichier README si nécessaire.  


```plaintext
src/main/java/ma/fstt/crudlsilab
├── entities         // Entités Java
├── dao              // DAO pour interagir avec la base de données
├── controllers      // Servlets pour gérer les requêtes
├── views            // JSP pour les interfaces utilisateur

