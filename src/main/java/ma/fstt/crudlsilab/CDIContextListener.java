package ma.fstt.crudlsilab;

import jakarta.enterprise.inject.spi.CDI;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import ma.fstt.crudlsilab.repositories.ClientRepository;
import ma.fstt.crudlsilab.repositories.CommandeRepository;
import ma.fstt.crudlsilab.repositories.ProduitRepository;


@WebListener
public class CDIContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            // Récupération des DAO via CDI
            ClientRepository clientRepository = CDI.current().select(ClientRepository.class).get();
            CommandeRepository commandeRepository = CDI.current().select(CommandeRepository.class).get();
            ProduitRepository produitRepository = CDI.current().select(ProduitRepository.class).get();

            // Debug Logging
            System.out.println("CDI initialized successfully!");
            System.out.println("ClientRepository: " + clientRepository);
            System.out.println("CommandeRepository: " + commandeRepository);
            System.out.println("ProduitRepository: " + produitRepository);
        } catch (Exception e) {
            System.err.println("CDI initialization failed: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Application stopped");
    }
}
