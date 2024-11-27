<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Edit Order</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    /* General styles */
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #e3f2fd, #90caf9);
      color: #333;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    h1 {
      font-size: 2.5rem;
      color: #1a237e;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .form-container {
      width: 60%;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
    }

    label {
      font-size: 1rem;
      color: #34495e;
      display: block;
      margin-bottom: 10px;
      text-align: left;
    }

    select, input {
      width: 100%;
      padding: 12px;
      border: 1px solid #b0bec5;
      border-radius: 8px;
      margin-bottom: 20px;
      font-size: 1rem;
      color: #2c3e50;
    }

    input:focus, select:focus {
      outline: none;
      border-color: #42a5f5;
      box-shadow: 0px 0px 5px rgba(66, 165, 245, 0.5);
    }

    .product-list {
      margin: 20px 0;
    }

    .product-list div {
      margin: 10px 0;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .product-list label {
      flex: 1;
    }

    .product-list input[type="number"] {
      width: 100px;
      text-align: center;
    }

    button {
      padding: 12px 20px;
      background-color: #1976d2;
      color: #ffffff;
      font-size: 1rem;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
      width: 100%;
    }

    button:hover {
      background-color: #0d47a1;
      transform: translateY(-3px);
      box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.3);
    }

    .back-link {
      margin-top: 20px;
      text-decoration: none;
      color: #1976d2;
      font-weight: 600;
      display: inline-block;
      transition: all 0.3s ease-in-out;
    }

    .back-link:hover {
      color: #0d47a1;
    }

    /* Responsive styles */
    @media (max-width: 768px) {
      .form-container {
        width: 90%;
      }

      h1 {
        font-size: 2rem;
      }

      button {
        font-size: 0.9rem;
        padding: 10px 15px;
      }
    }
  </style>
</head>
<body>
<h1>Edit Order</h1>
<div class="form-container">
  <form action="commande" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${commande.id}">

    <label for="clientId">Client:</label>
    <select id="clientId" name="clientId" required>
      <c:forEach var="client" items="${clients}">
        <option value="${client.id}" <c:if test="${commande.client.id == client.id}">selected</c:if>>${client.nom}</option>
      </c:forEach>
    </select>

    <h2>Products:</h2>
    <div class="product-list">
      <c:forEach var="produit" items="${produits}">
        <div>
          <label>
            <input type="checkbox" name="produitId" value="${produit.id}"
            <c:forEach var="ligne" items="${commande.lignesDeCommande}">
              ${ligne.produit.id == produit.id ? "checked" : ""}
            </c:forEach>>
              ${produit.nom} - ${produit.prix}€
          </label>
          <input type="number" name="quantite_${produit.id}"
                 value="<c:forEach var="ligne" items="${commande.lignesDeCommande}">
                                    ${ligne.produit.id == produit.id ? ligne.quantite : ''}
                                </c:forEach>"
                 min="1" placeholder="Quantity">
        </div>
      </c:forEach>
    </div>

    <button type="submit"><i class="fas fa-save"></i> Save</button>
  </form>
  <a href="commande" class="back-link"><i class="fas fa-arrow-left"></i> Back</a>
</div>
</body>
</html>
