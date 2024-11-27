package ma.fstt.crudlsilab.repositories;

import ma.fstt.crudlsilab.entities.Client;

import java.util.List;

public interface ClientRepository {
    void ajouterClient(Client client);

    Client trouverParId(Long id); // Vérifiez ce nom exact !

    List<Client> listerClients();

    void supprimerClient(Long id);

    void modifierClient(Client client);
}
