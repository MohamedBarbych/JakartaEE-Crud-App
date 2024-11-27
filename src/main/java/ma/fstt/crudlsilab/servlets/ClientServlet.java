package ma.fstt.crudlsilab.servlets;

import jakarta.enterprise.inject.spi.CDI;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.fstt.crudlsilab.entities.Client;
import ma.fstt.crudlsilab.repositories.ClientRepository;

import java.io.IOException;

@WebServlet("/client")
public class ClientServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
        this.clientRepository = CDI.current().select(ClientRepository.class).get();
    }

    @Inject
    private ClientRepository clientRepository;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            String action = req.getParameter("action");

            if (action == null) {
                // Affiche tous les clients
                req.setAttribute("clients", clientRepository.listerClients());
                req.getRequestDispatcher("/WEB-INF/views/clients.jsp").forward(req, resp);
            } else if ("delete".equals(action)) {
                // Supprimer un client
                Long id = Long.parseLong(req.getParameter("id"));
                clientRepository.supprimerClient(id);
                resp.sendRedirect("client");
            } else if ("edit".equals(action)) {
                // Redirige vers la page de modification
                Long id = Long.parseLong(req.getParameter("id"));
                Client client = clientRepository.trouverParId(id);
                req.setAttribute("client", client);
                req.getRequestDispatcher("/WEB-INF/views/editClient.jsp").forward(req, resp);
            } else if ("details".equals(action)) {
                // Affiche les détails d'un client
                Long id = Long.parseLong(req.getParameter("id"));
                Client client = clientRepository.trouverParId(id);
                req.setAttribute("client", client);
                req.getRequestDispatcher("/WEB-INF/views/detailsClient.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            resp.getWriter().write("Erreur : " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");

        if ("update".equals(action)) {
            // Mise à jour du client
            Long id = Long.parseLong(req.getParameter("id"));
            String nom = req.getParameter("nom");
            String email = req.getParameter("email");

            Client client = clientRepository.trouverParId(id);
            client.setNom(nom);
            client.setEmail(email);

            clientRepository.modifierClient(client);
            resp.sendRedirect("client");
        } else {
            // Ajouter un nouveau client
            String nom = req.getParameter("nom");
            String email = req.getParameter("email");

            Client client = new Client();
            client.setNom(nom);
            client.setEmail(email);

            clientRepository.ajouterClient(client);
            resp.sendRedirect("client");
        }
    }
}
