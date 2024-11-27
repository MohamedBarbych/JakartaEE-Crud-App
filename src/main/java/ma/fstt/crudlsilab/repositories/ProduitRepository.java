package ma.fstt.crudlsilab.repositories;

import ma.fstt.crudlsilab.entities.Produit;

import java.util.List;

public interface ProduitRepository {
    Produit trouverParId(Long id); // Renommé pour uniformité avec les autres DAO
    void ajouterProduit(Produit produit);
    List<Produit> listerProduits();
    void supprimerProduit(Long id);
    void modifierProduit(Produit produit);
}
