package ma.fstt.crudlsilab.entities;


import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@ApplicationScoped
@Data
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;

    private double prix;

}