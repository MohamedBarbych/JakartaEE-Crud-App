package ma.fstt.crudlsilab.servlets;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.fstt.crudlsilab.entities.Client;
import ma.fstt.crudlsilab.entities.Commande;
import ma.fstt.crudlsilab.entities.LigneDeCommande;
import ma.fstt.crudlsilab.entities.Produit;
import ma.fstt.crudlsilab.repositories.ClientRepository;
import ma.fstt.crudlsilab.repositories.CommandeRepository;
import ma.fstt.crudlsilab.repositories.ProduitRepository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/commande")
public class CommandeServlet extends HttpServlet {

    @Inject
    private CommandeRepository commandeRepository;

    @Inject
    private ClientRepository clientRepository;

    @Inject
    private ProduitRepository produitRepository;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if (action == null) {
                // Liste des commandes
                List<Commande> commandes = commandeRepository.listerCommandes();
                List<Client> clients = clientRepository.listerClients();
                req.setAttribute("commandes", commandes);
                req.setAttribute("clients", clients);
                req.getRequestDispatcher("/WEB-INF/views/commandes.jsp").forward(req, resp);

            } else if ("add".equals(action)) {
                // Formulaire pour ajouter une commande
                List<Client> clients = clientRepository.listerClients();
                List<Produit> produits = produitRepository.listerProduits();
                req.setAttribute("clients", clients);
                req.setAttribute("produits", produits);
                req.getRequestDispatcher("/WEB-INF/views/addCommande.jsp").forward(req, resp);

            } else if ("edit".equals(action)) {
                // Modifier une commande
                Long id = Long.parseLong(req.getParameter("id"));
                Commande commande = commandeRepository.trouverParId(id);
                List<Client> clients = clientRepository.listerClients();
                List<Produit> produits = produitRepository.listerProduits();

                if (commande != null) {
                    req.setAttribute("commande", commande);
                    req.setAttribute("clients", clients);
                    req.setAttribute("produits", produits);
                    req.getRequestDispatcher("/WEB-INF/views/editCommande.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "Commande introuvable !");
                    req.getRequestDispatcher("/WEB-INF/views/commandes.jsp").forward(req, resp);
                }

            } else if ("details".equals(action)) {
                // Détails d'une commande
                Long id = Long.parseLong(req.getParameter("id"));
                Commande commande = commandeRepository.trouverParId(id);

                if (commande != null) {
                    req.setAttribute("commande", commande);
                    req.getRequestDispatcher("/WEB-INF/views/detailsCommande.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "Commande introuvable !");
                    req.getRequestDispatcher("/WEB-INF/views/commandes.jsp").forward(req, resp);
                }

            } else if ("delete".equals(action)) {
                // Supprimer une commande
                Long id = Long.parseLong(req.getParameter("id"));
                commandeRepository.supprimerCommande(id);
                resp.sendRedirect("commande");

            } else {
                req.setAttribute("error", "Action non reconnue : " + action);
                req.getRequestDispatcher("/WEB-INF/views/commandes.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Une erreur s'est produite : " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/commandes.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {
                // Ajouter une commande avec des produits
                Long clientId = Long.parseLong(req.getParameter("clientId"));
                Client client = clientRepository.trouverParId(clientId);

                if (client != null) {
                    Commande commande = new Commande();
                    commande.setClient(client);

                    // Ajout des produits à la commande
                    String[] produitIds = req.getParameterValues("produitId");
                    String[] quantites = req.getParameterValues("quantite");

                    if (produitIds != null && quantites != null) {
                        for (int i = 0; i < produitIds.length; i++) {
                            if (produitIds[i] != null && !produitIds[i].isEmpty() &&
                                    quantites[i] != null && !quantites[i].isEmpty()) {
                                try {
                                    Long produitId = Long.parseLong(produitIds[i]);
                                    int quantite = Integer.parseInt(quantites[i]);

                                    Produit produit = produitRepository.trouverParId(produitId);
                                    if (produit != null && quantite > 0) {
                                        LigneDeCommande ligne = new LigneDeCommande();
                                        ligne.setCommande(commande);
                                        ligne.setProduit(produit);
                                        ligne.setQuantite(quantite);
                                        commande.getLignesDeCommande().add(ligne);
                                    }
                                } catch (NumberFormatException e) {
                                    // Ignorer les entrées invalides
                                    System.err.println("Erreur de conversion pour le produit ou la quantité : " + e.getMessage());
                                }
                            }
                        }
                    }

                    commandeRepository.ajouterCommande(commande);
                }

                resp.sendRedirect("commande");

            } else if ("update".equals(action)) {
                // Modifier une commande
                Long commandeId = Long.parseLong(req.getParameter("id"));
                Commande commande = commandeRepository.trouverParId(commandeId);

                if (commande != null) {
                    Long clientId = Long.parseLong(req.getParameter("clientId"));
                    Client client = clientRepository.trouverParId(clientId);
                    commande.setClient(client);

                    commande.getLignesDeCommande().clear(); // Supprime les anciennes lignes

                    String[] produitIds = req.getParameterValues("produitId");
                    String[] quantites = req.getParameterValues("quantite");

                    if (produitIds != null && quantites != null) {
                        for (int i = 0; i < produitIds.length; i++) {
                            if (produitIds[i] != null && !produitIds[i].isEmpty() &&
                                    quantites[i] != null && !quantites[i].isEmpty()) {
                                try {
                                    Long produitId = Long.parseLong(produitIds[i]);
                                    int quantite = Integer.parseInt(quantites[i]);

                                    Produit produit = produitRepository.trouverParId(produitId);
                                    if (produit != null && quantite > 0) {
                                        LigneDeCommande ligne = new LigneDeCommande();
                                        ligne.setCommande(commande);
                                        ligne.setProduit(produit);
                                        ligne.setQuantite(quantite);
                                        commande.getLignesDeCommande().add(ligne);
                                    }
                                } catch (NumberFormatException e) {
                                    System.err.println("Erreur de conversion pour le produit ou la quantité : " + e.getMessage());
                                }
                            }
                        }
                    }

                    commandeRepository.modifierCommande(commande);
                }

                resp.sendRedirect("commande");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Une erreur s'est produite : " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/commandes.jsp").forward(req, resp);
        }
    }

}
