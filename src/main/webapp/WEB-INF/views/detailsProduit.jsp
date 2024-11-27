<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Product Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* General styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f0f8ff, #a2d9ff);
            color: #333;
            text-align: center;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-size: 2.5rem;
            color: #004085;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            margin: 10px 0;
            color: #555;
        }

        p strong {
            color: #007bff;
        }

        .details-container {
            width: 50%;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
        }

        a {
            text-decoration: none;
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
            margin-top: 20px;
        }

        button:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
            box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.3);
        }

        footer {
            margin-top: auto;
            padding: 15px 0;
            background-color: #004085;
            color: #ffffff;
            font-size: 0.9rem;
            box-shadow: 0px -5px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
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
            .details-container {
                width: 90%;
            }

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
<div class="details-container">
    <h1>Product Details</h1>
    <c:if test="${produit != null}">
        <p><strong>ID:</strong> ${produit.id}</p>
        <p><strong>Name:</strong> ${produit.nom}</p>
        <p><strong>Price:</strong> ${produit.prix} €</p>
    </c:if>
    <a href="produit"><button><i class="fas fa-arrow-left"></i> Back</button></a>
</div>

<footer>
    <p>© 2024 CRUD LSI Lab. Designed with <i class="fas fa-heart"></i>. <a href="https://jakarta.ee/">Powered by Jakarta EE</a>.</p>
</footer>
</body>
</html>
