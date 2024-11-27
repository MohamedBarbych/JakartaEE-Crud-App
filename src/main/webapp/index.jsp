<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>CRUD LSI Lab - Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: #e3f2fd; /* Soft blue background */
            color: #333333;
            text-align: center;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header */
        header {
            position: relative;
            padding: 20px 0;
            flex-shrink: 0;
        }

        header .logo {
            position: absolute;
            width: 80px;
            height: 80px;
        }

        .logo-left {
            top: 10px;
            left: 20px;
        }

        .logo-right {
            top: 10px;
            right: 20px;
        }

        h1 {
            font-size: 3.5rem;
            margin-top: 30px;
            text-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2);
            font-weight: 700;
            color: #0d47a1; /* Darker blue for contrast */
        }

        p {
            font-size: 1.2rem;
            margin: 10px 0 40px;
            color: #455a64; /* Soft grey-blue text */
        }

        /* Main Container */
        .container {
            margin-top: 20px;
            flex-grow: 1;
        }

        /* Menu Buttons */
        .menu {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 25px;
            margin: 30px 0;
        }

        .menu a {
            text-decoration: none;
            color: #ffffff;
            padding: 20px 40px;
            border: none;
            border-radius: 50px;
            font-size: 1.2rem;
            font-weight: 600;
            background: #2196f3; /* Vibrant blue for buttons */
            transition: all 0.3s ease-in-out;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
        }

        .menu a:hover {
            background: #0d47a1; /* Darker blue for hover effect */
            transform: translateY(-10px);
            box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.2);
        }

        .menu a i {
            margin-right: 10px;
        }

        /* Footer */
        footer {
            margin-top: auto;
            padding: 20px 0;
            background: #0d47a1; /* Dense blue for footer */
            color: #ffffff;
            font-size: 0.9rem;
            box-shadow: 0px -5px 10px rgba(0, 0, 0, 0.2);
            position: sticky;
            bottom: 0;
        }

        footer p {
            color: #f9d71c; /* Bright yellow text */
        }

        footer a {
            color: #ffee58; /* Softer yellow for footer links */
            text-decoration: none;
            font-weight: 600;
        }

        footer a:hover {
            text-decoration: underline;
            color: #ffd700; /* Golden hover color for links */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }

            .menu a {
                padding: 15px 30px;
                font-size: 1rem;
            }

            p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
<header>
    <img src="images/logo_universite-removebg-preview.png" alt="Logo Left" class="logo logo-left">
    <img src="images/logo_fstt-removebg-preview.png" alt="Logo Right" class="logo logo-right">
    <h1>Welcome to CRUD LSI Lab</h1>
    <p>An application to manage clients, products, and orders efficiently.</p>
</header>

<div class="container">
    <div class="menu">
        <a href="client"><i class="fas fa-users"></i> Manage Clients</a>
        <a href="produit"><i class="fas fa-shopping-cart"></i> Manage Products</a>
        <a href="commande"><i class="fas fa-box"></i> Manage Orders</a>
    </div>
</div>

<footer>
    <p>© 2024 CRUD LSI Lab. Built with <i class="fas fa-heart"></i>. <a href="https://jakarta.ee/">Powered by Jakarta EE</a>.</p>
</footer>
</body>
</html>
