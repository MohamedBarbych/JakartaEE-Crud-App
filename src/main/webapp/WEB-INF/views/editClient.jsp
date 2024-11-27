<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Edit Client</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    /* General styles */
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #d4e6f1, #a9cce3);
      color: #333;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    h1 {
      font-size: 2.5rem;
      color: #1a5276;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .form-container {
      width: 50%;
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

    input {
      width: 100%;
      padding: 12px;
      border: 1px solid #b0bec5;
      border-radius: 8px;
      margin-bottom: 20px;
      font-size: 1rem;
      color: #2c3e50;
    }

    input:focus {
      outline: none;
      border-color: #2980b9;
      box-shadow: 0px 0px 5px rgba(41, 128, 185, 0.5);
    }

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
      width: 100%;
    }

    button:hover {
      background-color: #0056b3;
      transform: translateY(-3px);
      box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.3);
    }

    .back-link {
      margin-top: 20px;
      text-decoration: none;
      color: #007bff;
      font-weight: 600;
      display: inline-block;
      transition: all 0.3s ease-in-out;
    }

    .back-link:hover {
      color: #0056b3;
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
<h1>Edit Client</h1>
<div class="form-container">
  <form action="client" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${client.id}">
    <label for="nom">Name:</label>
    <input type="text" id="nom" name="nom" value="${client.nom}" required>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${client.email}" required>
    <button type="submit"><i class="fas fa-save"></i> Save</button>
  </form>
  <a href="client" class="back-link"><i class="fas fa-arrow-left"></i> Back</a>
</div>
</body>
</html>
