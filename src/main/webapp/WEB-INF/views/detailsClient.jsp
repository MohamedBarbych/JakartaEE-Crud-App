<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Client Details</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    /* General styles */
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #f9fbe7, #c8e6c9);
      color: #333;
      text-align: center;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    h1 {
      font-size: 2.5rem;
      color: #2e7d32;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    p {
      font-size: 1.2rem;
      color: #424242;
      margin: 10px 0;
    }

    p strong {
      color: #1b5e20;
    }

    a {
      text-decoration: none;
    }

    /* Button styles */
    button {
      padding: 12px 20px;
      background-color: #388e3c;
      color: white;
      font-size: 1rem;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
      transition: all 0.3s ease-in-out;
    }

    button:hover {
      background-color: #2e7d32;
      transform: translateY(-3px);
      box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
    }

    footer {
      margin-top: auto;
      padding: 15px 0;
      background-color: #1b5e20;
      color: #ffffff;
      font-size: 0.9rem;
      box-shadow: 0px -5px 10px rgba(0, 0, 0, 0.1);
    }

    footer a {
      color: #ffeb3b;
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

      p {
        font-size: 1rem;
      }

      button {
        font-size: 0.9rem;
        padding: 10px 15px;
      }
    }
  </style>
</head>
<body>
<h1>Client Details</h1>
<p><strong>ID:</strong> ${client.id}</p>
<p><strong>Name:</strong> ${client.nom}</p>
<p><strong>Email:</strong> ${client.email}</p>
<a href="client"><button><i class="fas fa-arrow-left"></i> Back</button></a>

<footer>
  <p>© 2024 CRUD LSI Lab. Designed with <i class="fas fa-heart"></i>. <a href="https://jakarta.ee/">Powered by Jakarta EE</a>.</p>
</footer>
</body>
</html>
