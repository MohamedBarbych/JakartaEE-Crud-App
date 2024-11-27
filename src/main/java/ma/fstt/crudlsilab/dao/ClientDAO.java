package ma.fstt.crudlsilab.dao;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import ma.fstt.crudlsilab.entities.Client;
import ma.fstt.crudlsilab.repositories.ClientRepository;

import java.util.List;

@ApplicationScoped
public class ClientDAO implements ClientRepository {

    @Inject
    private EntityManager entityManager;

    @Override
    public void ajouterClient(Client client) {
        entityManager.getTransaction().begin();
        entityManager.persist(client);
        entityManager.getTransaction().commit();
    }

    @Override
    public Client trouverParId(Long id) { // Assurez-vous que ce nom correspond à celui dans l'interface
        return entityManager.find(Client.class, id);
    }

    @Override
    public List<Client> listerClients() {
        return entityManager.createQuery("SELECT c FROM Client c", Client.class).getResultList();
    }

    @Override
    public void supprimerClient(Long id) {
        entityManager.getTransaction().begin();
        Client client = trouverParId(id);
        if (client != null) {
            entityManager.remove(client);
        }
        entityManager.getTransaction().commit();
    }

    @Override
    public void modifierClient(Client client) {
        entityManager.getTransaction().begin();
        entityManager.merge(client);
        entityManager.getTransaction().commit();
    }
}
