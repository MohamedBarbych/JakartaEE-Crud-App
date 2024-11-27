package ma.fstt.crudlsilab.dao;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import ma.fstt.crudlsilab.entities.Commande;
import ma.fstt.crudlsilab.repositories.CommandeRepository;

import java.util.List;

@ApplicationScoped
public class CommandeDAO implements CommandeRepository {

    @Inject
    private EntityManager entityManager;

    @Override
    public Commande trouverParId(Long id) {
        return entityManager.find(Commande.class, id);
    }

    @Override
    public void ajouterCommande(Commande commande) {
        entityManager.getTransaction().begin();
        entityManager.persist(commande);
        entityManager.getTransaction().commit();
    }

    @Override
    public List<Commande> listerCommandes() {
        return entityManager.createQuery("SELECT c FROM Commande c", Commande.class).getResultList();
    }

    @Override
    public void supprimerCommande(Long id) {
        entityManager.getTransaction().begin();
        Commande commande = trouverParId(id);
        if (commande != null) {
            entityManager.remove(commande);
        }
        entityManager.getTransaction().commit();
    }

    @Override
    public void modifierCommande(Commande commande) {
        entityManager.getTransaction().begin();
        entityManager.merge(commande);
        entityManager.getTransaction().commit();
    }
}
