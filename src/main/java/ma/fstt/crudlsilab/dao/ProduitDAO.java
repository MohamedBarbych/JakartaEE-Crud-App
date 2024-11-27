package ma.fstt.crudlsilab.dao;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import ma.fstt.crudlsilab.entities.LigneDeCommande;
import ma.fstt.crudlsilab.entities.Produit;
import ma.fstt.crudlsilab.repositories.ProduitRepository;

import java.util.List;

@ApplicationScoped
public class ProduitDAO implements ProduitRepository {

    @Inject
    private EntityManager entityManager;

    @Override
    public Produit trouverParId(Long id) {
        if (id == null) {
            System.out.println("Erreur : ID du produit est null !");
            return null;
        }
        Produit produit = entityManager.find(Produit.class, id);
        if (produit == null) {
            System.out.println("Produit introuvable pour l'ID : " + id);
        }
        return produit;
    }


    @Override
    public void ajouterProduit(Produit produit) {
        entityManager.getTransaction().begin(); // Démarrer une transaction
        entityManager.persist(produit);        // Ajouter le produit
        entityManager.getTransaction().commit(); // Valider la transaction
    }


    @Override
    public List<Produit> listerProduits() {
        return entityManager.createQuery("SELECT p FROM Produit p", Produit.class).getResultList();
    }

    @Override
    public void supprimerProduit(Long id) {
        entityManager.getTransaction().begin();

        Produit produit = trouverParId(id);
        if (produit != null) {
            // Supprimer toutes les lignes de commande associées au produit
            List<LigneDeCommande> lignes = entityManager
                    .createQuery("SELECT l FROM LigneDeCommande l WHERE l.produit.id = :produitId", LigneDeCommande.class)
                    .setParameter("produitId", id)
                    .getResultList();

            for (LigneDeCommande ligne : lignes) {
                entityManager.remove(ligne);
            }

            // Supprimer le produit après avoir supprimé les lignes associées
            entityManager.remove(produit);
        } else {
            System.out.println("Produit non trouvé avec l'ID : " + id);
        }

        entityManager.getTransaction().commit();
    }



    @Override
    public void modifierProduit(Produit produit) {
        if (!entityManager.contains(produit)) {
            produit = entityManager.merge(produit); // Reattache l'entité si nécessaire
        }
        entityManager.getTransaction().begin();
        entityManager.merge(produit);
        entityManager.getTransaction().commit();
    }


}
