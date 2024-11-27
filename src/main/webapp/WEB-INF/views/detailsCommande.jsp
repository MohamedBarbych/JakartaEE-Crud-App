<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Order Details</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    /* General styles */
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #dceefb, #blueLight);
      color: #333;
      text-align: center;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    h1 {
      font-size: 2.5rem;
      color: #1d3557;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    p, ul li {
      font-size: 1.2rem;
      color: #343a40;
      margin: 10px 0;
    }

    ul {
      padding: 0;
      list-style: none;
    }

    ul li {
      margin: 5px 0;
    }

    p strong {
      color: #457b9d;
    }

    /* Container styles */
    .details-container {
      width: 60%;
      margin: 50px auto;
      padding: 20px;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
      text-align: left;
    }

    h2 {
      color: #1d3557;
      border-bottom: 2px solid #457b9d;
      padding-bottom: 5px;
      margin-bottom: 15px;
    }

    a {
      text-decoration: none;
    }

    /* Button styles */
    button {
      padding: 12px 20px;
      background-color: #007bff;
      color: #ffffff;
      font-size: 1rem;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    }

    button:hover {
      background-color: #0056b3;
      transform: translateY(-3px);
      box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.3);
    }

    footer {
      margin-top: auto;
      padding: 15px 0;
      background-color: #457b9d;
      color: #ffffff;
      font-size: 0.9rem;
      box-shadow: 0px -5px 10px rgba(0, 0, 0, 0.1);
    }

    footer a {
      color: #ffdd00;
      text-decoration: none;
      font-weight: 500;
    }

    footer a:hover {
      text-decoration: underline;
    }

    /* Responsive styles */
    @media (max-width: 768px) {
      h1 {
        font-size: 2rem;
      }

      p, ul li {
        font-size: 1rem;
      }

      .details-container {
        width: 90%;
      }

      button {
        font-size: 0.9rem;
        padding: 10px 15px;
      }
    }
  </style>
</head>
<body>
<div class="details-container">
  <h1>Order Details</h1>
  <c:if test="${commande != null}">
    <p><strong>ID:</strong> ${commande.id}</p>
    <p><strong>Client:</strong> ${commande.client.nom}</p>
    <p><strong>Date:</strong> ${commande.date}</p>
    <h2>Products:</h2>
    <ul>
      <c:forEach var="ligne" items="${commande.lignesDeCommande}">
        <li><i class="fas fa-box"></i> ${ligne.produit.nom} - Quantity: ${ligne.quantite}</li>
      </c:forEach>
    </ul>
  </c:if>
  <c:if test="${commande == null}">
    <p style="color: red;">Error: Order not found!</p>
  </c:if>
  <a href="commande"><button><i class="fas fa-arrow-left"></i> Back</button></a>
</div>

<footer>
  <p>© 2024 CRUD LSI Lab. Designed with <i class="fas fa-heart"></i>. <a href="https://jakarta.ee/">Powered by Jakarta EE</a>.</p>
</footer>
</body>
</html>
