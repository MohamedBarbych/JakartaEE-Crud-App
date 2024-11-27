<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Product List</title>
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
      align-items: center;
      min-height: 100vh;
    }

    h1 {
      font-size: 2.5rem;
      color: #0d47a1;
      margin-top: 20px;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
    }

    /* Table styles */
    table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
      background: #ffffff;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    th, td {
      padding: 15px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #0288d1;
      color: #ffffff;
      font-size: 1rem;
    }

    td {
      font-size: 0.95rem;
      color: #555;
    }

    tr:hover {
      background-color: #f1f1f1;
    }

    .action-buttons {
      display: flex;
      justify-content: center;
      gap: 10px;
    }

    button {
      padding: 8px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 0.9rem;
      display: inline-flex;
      align-items: center;
      gap: 5px;
    }

    button.edit {
      background-color: #ffc107;
      color: white;
    }

    button.delete {
      background-color: #dc3545;
      color: white;
    }

    button.details {
      background-color: #28a745;
      color: white;
    }

    button:hover {
      opacity: 0.9;
    }

    /* Form styles */
    form {
      margin: 20px auto;
      width: 50%;
      padding: 20px;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }

    form h2 {
      color: #0d47a1;
      margin-bottom: 20px;
    }

    form label {
      font-size: 1rem;
      margin-bottom: 5px;
      display: block;
      text-align: left;
      color: #555;
    }

    form input {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
      margin-bottom: 20px;
    }

    form input:focus {
      outline: none;
      border-color: #0288d1;
      box-shadow: 0px 0px 5px rgba(2, 136, 209, 0.5);
    }

    form button {
      padding: 12px;
      background-color: #0288d1;
      color: white;
      font-size: 1rem;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
      width: 100%;
    }

    form button:hover {
      background-color: #01579b;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      table {
        width: 95%;
      }

      form {
        width: 90%;
      }

      h1 {
        font-size: 2rem;
      }
    }
  </style>
</head>
<body>
<h1>Product List</h1>

<!-- Product Table -->
<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Price</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="produit" items="${produits}">
    <tr>
      <td>${produit.id}</td>
      <td>${produit.nom}</td>
      <td>${produit.prix} €</td>
      <td class="action-buttons">
        <a href="produit?action=edit&id=${produit.id}">
          <button class="edit"><i class="fas fa-edit"></i> Edit</button>
        </a>
        <a href="produit?action=delete&id=${produit.id}" onclick="return confirm('Are you sure you want to delete this product?')">
          <button class="delete"><i class="fas fa-trash"></i> Delete</button>
        </a>
        <a href="produit?action=details&id=${produit.id}">
          <button class="details"><i class="fas fa-info-circle"></i> Details</button>
        </a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<!-- Add Product Form -->
<form action="produit" method="post">
  <h2>Add a Product</h2>
  <label for="nom">Name:</label>
  <input type="text" id="nom" name="nom" required>
  <label for="prix">Price:</label>
  <input type="number" id="prix" name="prix" step="0.01" required>
  <button type="submit"><i class="fas fa-plus"></i> Add Product</button>
</form>
</body>
</html>
