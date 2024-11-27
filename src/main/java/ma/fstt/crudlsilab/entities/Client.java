package ma.fstt.crudlsilab.entities;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@ApplicationScoped
@Data
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;

    private String email;

    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
    private List<Commande> commandes;

}