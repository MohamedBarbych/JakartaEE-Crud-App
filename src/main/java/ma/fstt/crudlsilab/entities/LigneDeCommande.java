package ma.fstt.crudlsilab.entities;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@ApplicationScoped
@Data
public class LigneDeCommande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "commande_id", nullable = false)
    private Commande commande;

    @ManyToOne
    @JoinColumn(name = "produit_id", nullable = false)
    private Produit produit;

    private int quantite;

}