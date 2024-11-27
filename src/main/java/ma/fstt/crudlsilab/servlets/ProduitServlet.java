package ma.fstt.crudlsilab.servlets;

import jakarta.enterprise.inject.spi.CDI;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.fstt.crudlsilab.entities.Produit;
import ma.fstt.crudlsilab.repositories.ProduitRepository;

import java.io.IOException;
import java.util.List;

@WebServlet("/produit")
public class ProduitServlet extends HttpServlet {

    @Inject
    private ProduitRepository produitRepository;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if (action == null) {
                // Liste des produits
                List<Produit> produits = produitRepository.listerProduits();
                req.setAttribute("produits", produits);
                req.getRequestDispatcher("/WEB-INF/views/produits.jsp").forward(req, resp);
            } else if ("delete".equals(action)) {
                // Supprimer un produit
                Long id = Long.parseLong(req.getParameter("id"));
                produitRepository.supprimerProduit(id);
                req.setAttribute("message", "Produit supprimé avec succès !");
                resp.sendRedirect("produit");
            } else if ("edit".equals(action)) {
                // Modifier un produit
                Long id = Long.parseLong(req.getParameter("id"));
                Produit produit = produitRepository.trouverParId(id);
                if (produit != null) {
                    req.setAttribute("produit", produit);
                    req.getRequestDispatcher("/WEB-INF/views/editProduit.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "Produit introuvable !");
                    req.getRequestDispatcher("/WEB-INF/views/produits.jsp").forward(req, resp);
                }
            } else if ("details".equals(action)) {
                // Afficher les détails
                Long id = Long.parseLong(req.getParameter("id"));
                Produit produit = produitRepository.trouverParId(id);
                if (produit != null) {
                    req.setAttribute("produit", produit);
                    req.getRequestDispatcher("/WEB-INF/views/detailsProduit.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "Produit introuvable !");
                    req.getRequestDispatcher("/WEB-INF/views/produits.jsp").forward(req, resp);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Une erreur s'est produite : " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/produits.jsp").forward(req, resp);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");

        if ("update".equals(action)) {
            // Récupérer les données du formulaire
            Long id = Long.parseLong(req.getParameter("id"));
            String nom = req.getParameter("nom");
            double prix = Double.parseDouble(req.getParameter("prix"));

            // Trouver le produit existant
            Produit produit = produitRepository.trouverParId(id);
            if (produit != null) {
                // Modifier les valeurs du produit
                produit.setNom(nom);
                produit.setPrix(prix);

                // Appeler le DAO pour enregistrer les modifications
                produitRepository.modifierProduit(produit);
            }

            // Rediriger vers la liste des produits
            resp.sendRedirect("produit");
        } else {
            // Traitement par défaut pour les autres actions (ajout, etc.)
            String nom = req.getParameter("nom");
            double prix = Double.parseDouble(req.getParameter("prix"));

            Produit produit = new Produit();
            produit.setNom(nom);
            produit.setPrix(prix);

            produitRepository.ajouterProduit(produit);
            resp.sendRedirect("produit");
        }
    }

}
