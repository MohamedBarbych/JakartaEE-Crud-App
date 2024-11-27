package ma.fstt.crudlsilab.repositories;

import ma.fstt.crudlsilab.entities.Commande;

import java.util.List;

public interface CommandeRepository {
    Commande trouverParId(Long id); // Renommé pour uniformité avec ClientRepository
    void ajouterCommande(Commande commande);
    List<Commande> listerCommandes();
    void supprimerCommande(Long id);
    void modifierCommande(Commande commande);
}
