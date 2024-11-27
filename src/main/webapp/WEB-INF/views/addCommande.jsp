<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ajouter une Commande</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      color: #333;
    }
    form {
      text-align: center;
      margin: 50px auto;
      background-color: white;
      padding: 20px;
      border: 1px solid #ddd;
      width: 60%;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    label, select, input, button {
      display: block;
      width: 100%;
      margin: 10px 0;
    }
    .product-list {
      margin: 20px 0;
    }
    .product-list div {
      margin: 10px 0;
    }
    button {
      padding: 10px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<h1 style="text-align: center;">Ajouter une Commande</h1>
<form action="commande" method="post">
  <input type="hidden" name="action" value="add">
  <label for="clientId">Client :</label>
  <select id="clientId" name="clientId" required>
    <c:forEach var="client" items="${clients}">
      <option value="${client.id}">${client.nom}</option>
    </c:forEach>
  </select>

  <h2>Produits :</h2>
  <div>
    <c:forEach var="produit" items="${produits}">
      <div>
        <label>
          <input type="checkbox" name="produitId" value="${produit.id}">
            ${produit.nom} - ${produit.prix}€
        </label>
        <input type="number" name="quantite" placeholder="Quantité" min="1">
      </div>
    </c:forEach>
  </div>

  <button type="submit">Créer Commande</button>
</form>


</body>
</html>
