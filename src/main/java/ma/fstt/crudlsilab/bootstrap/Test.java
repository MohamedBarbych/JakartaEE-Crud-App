package ma.fstt.crudlsilab.bootstrap;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import ma.fstt.crudlsilab.entities.Client;
import ma.fstt.crudlsilab.entities.Commande;
import ma.fstt.crudlsilab.entities.LigneDeCommande;
import ma.fstt.crudlsilab.entities.Produit;

import java.util.Arrays;

public class Test {

    public static void main(String[] args) {
        // Initialisation de l'EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myentity");
        EntityManager em = emf.createEntityManager();

        // Début de transaction
        em.getTransaction().begin();

        // --- Ajout des clients ---
        Client client1 = new Client();
        client1.setNom("Hamoda");
        client1.setEmail("hamoda@example.com");
        em.persist(client1);

        Client client2 = new Client();
        client2.setNom("Abass");
        client2.setEmail("abass@example.com");
        em.persist(client2);

        Client client3 = new Client();
        client3.setNom("Durand");
        client3.setEmail("durand@example.com");
        em.persist(client3);

        // --- Ajout des produits ---
        Produit produit1 = new Produit();
        produit1.setNom("Tablette");
        produit1.setPrix(1500.0);
        em.persist(produit1);

        Produit produit2 = new Produit();
        produit2.setNom("TV");
        produit2.setPrix(800.0);
        em.persist(produit2);

        Produit produit3 = new Produit();
        produit3.setNom("Ordinateur Portable");
        produit3.setPrix(3000.0);
        em.persist(produit3);

        Produit produit4 = new Produit();
        produit4.setNom("Smartphone");
        produit4.setPrix(1200.0);
        em.persist(produit4);

        // --- Ajout des commandes ---
        // Commande 1
        Commande commande1 = new Commande();
        commande1.setClient(client1);
        em.persist(commande1);

        // Lignes de commande pour commande 1
        LigneDeCommande ligne1Commande1 = new LigneDeCommande();
        ligne1Commande1.setCommande(commande1);
        ligne1Commande1.setProduit(produit1); // Tablette
        ligne1Commande1.setQuantite(2);
        em.persist(ligne1Commande1);

        LigneDeCommande ligne2Commande1 = new LigneDeCommande();
        ligne2Commande1.setCommande(commande1);
        ligne2Commande1.setProduit(produit2); // TV
        ligne2Commande1.setQuantite(1);
        em.persist(ligne2Commande1);

        // Commande 2
        Commande commande2 = new Commande();
        commande2.setClient(client2);
        em.persist(commande2);

        // Lignes de commande pour commande 2
        LigneDeCommande ligne1Commande2 = new LigneDeCommande();
        ligne1Commande2.setCommande(commande2);
        ligne1Commande2.setProduit(produit3); // Ordinateur Portable
        ligne1Commande2.setQuantite(1);
        em.persist(ligne1Commande2);

        LigneDeCommande ligne2Commande2 = new LigneDeCommande();
        ligne2Commande2.setCommande(commande2);
        ligne2Commande2.setProduit(produit4); // Smartphone
        ligne2Commande2.setQuantite(3);
        em.persist(ligne2Commande2);

        // Commande 3
        Commande commande3 = new Commande();
        commande3.setClient(client3);
        em.persist(commande3);

        // Lignes de commande pour commande 3
        LigneDeCommande ligne1Commande3 = new LigneDeCommande();
        ligne1Commande3.setCommande(commande3);
        ligne1Commande3.setProduit(produit1); // Tablette
        ligne1Commande3.setQuantite(1);
        em.persist(ligne1Commande3);

        LigneDeCommande ligne2Commande3 = new LigneDeCommande();
        ligne2Commande3.setCommande(commande3);
        ligne2Commande3.setProduit(produit4); // Smartphone
        ligne2Commande3.setQuantite(2);
        em.persist(ligne2Commande3);

        // Valider la transaction
        em.getTransaction().commit();

        // --- Fermeture des ressources ---
        em.close();
        emf.close();

        System.out.println("Données insérées avec succès !");
    }
}
