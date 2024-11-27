package ma.fstt.crudlsilab.util;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Produces;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

@ApplicationScoped
public class EntityManagerProducer {

    private final EntityManagerFactory emf;

    public EntityManagerProducer() {
        // Initialisez l'EntityManagerFactory avec le nom du persistence-unit
        this.emf = Persistence.createEntityManagerFactory("myentity");
    }

    @Produces
    public EntityManager createEntityManager() {
        // Crée et retourne un EntityManager
        return emf.createEntityManager();
    }
}
