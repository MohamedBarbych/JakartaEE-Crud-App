<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Order List</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    /* General styles */
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #e3f2fd, #bbdefb);
      color: #333;
      text-align: center;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    h1 {
      font-size: 2.5rem;
      margin: 20px 0;
      color: #1e3a5f;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
    }

    /* Add Button */
    .add-command-btn {
      display: inline-block;
      margin: 20px auto;
      background-color: #1565c0;
      color: white;
      padding: 12px 20px;
      font-size: 1rem;
      border: none;
      border-radius: 8px;
      text-decoration: none;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
      transition: all 0.3s ease-in-out;
    }

    .add-command-btn:hover {
      background-color: #0d47a1;
      transform: translateY(-3px);
      box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.4);
    }

    /* Table styles */
    table {
      width: 90%;
      margin: 20px auto;
      border-collapse: collapse;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    th, td {
      padding: 15px;
      border: 1px solid #ddd;
      text-align: center;
    }

    th {
      background-color: #1565c0;
      color: white;
      font-weight: 500;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tr:nth-child(odd) {
      background-color: #ffffff;
    }

    td {
      font-size: 1rem;
    }

    td ul {
      list-style: none;
      padding: 0;
    }

    td ul li {
      text-align: left;
    }

    /* Action buttons */
    .action-buttons {
      display: flex;
      justify-content: center;
      gap: 10px;
    }

    .action-buttons a {
      text-decoration: none;
    }

    button {
      padding: 10px 15px;
      border: none;
      border-radius: 5px;
      font-size: 0.9rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
    }

    button:hover {
      transform: translateY(-3px);
      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
    }

    button.edit {
      background-color: #43a047;
      color: white;
    }

    button.delete {
      background-color: #e53935;
      color: white;
    }

    button.details {
      background-color: #1e88e5;
      color: white;
    }

    /* Footer styles */
    footer {
      background-color: #1565c0;
      color: #ffffff;
      font-size: 0.9rem;
      text-align: center;
      padding: 15px 0;
    }

    footer a {
      color: #ffeb3b;
      text-decoration: none;
    }

    footer a:hover {
      text-decoration: underline;
    }

    /* Responsive styles */
    @media (max-width: 768px) {
      table {
        width: 95%;
      }

      h1 {
        font-size: 1.8rem;
      }

      button {
        font-size: 0.8rem;
        padding: 8px 10px;
      }
    }
  </style>
</head>
<body>
<h1>Order List</h1>

<a href="commande?action=add" class="add-command-btn">Add New Order</a>

<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Client</th>
    <th>Date</th>
    <th>Products</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="commande" items="${commandes}">
    <tr>
      <td>${commande.id}</td>
      <td>${commande.client.nom}</td>
      <td>${commande.date}</td>
      <td>
        <ul>
          <c:forEach var="ligne" items="${commande.lignesDeCommande}">
            <li>${ligne.produit.nom} - ${ligne.quantite}</li>
          </c:forEach>
        </ul>
      </td>
      <td class="action-buttons">
        <a href="commande?action=edit&id=${commande.id}"><button class="edit"><i class="fas fa-edit"></i> Edit</button></a>
        <a href="commande?action=delete&id=${commande.id}" onclick="return confirm('Are you sure you want to delete this order?')">
          <button class="delete"><i class="fas fa-trash"></i> Delete</button>
        </a>
        <a href="commande?action=details&id=${commande.id}"><button class="details"><i class="fas fa-info-circle"></i> Details</button></a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<footer>
  <p>© 2024 CRUD LSI Lab. Designed with <i class="fas fa-heart"></i>. <a href="https://jakarta.ee/">Powered by Jakarta EE</a>.</p>
</footer>
</body>
</html>
