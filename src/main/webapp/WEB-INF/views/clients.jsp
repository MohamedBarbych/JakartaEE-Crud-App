<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Client List</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ececec, #d4e8f5);
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

        h2 {
            font-size: 1.8rem;
            margin-bottom: 15px;
            color: #1e3a5f;
        }

        /* Table Styles */
        table {
            width: 80%;
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
            background-color: #1e3a5f;
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

        /* Button Styles */
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
            background-color: #1e88e5;
            color: white;
        }

        button.delete {
            background-color: #e53935;
            color: white;
        }

        button.details {
            background-color: #43a047;
            color: white;
        }

        button.add {
            background-color: #1e3a5f;
            color: white;
            padding: 12px 20px;
            font-size: 1rem;
            margin-top: 15px;
        }

        /* Form Styles */
        form {
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px 30px;
            margin: 30px auto;
            width: 50%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        form label {
            font-weight: 500;
            margin-top: 10px;
            display: block;
            color: #333;
        }

        form input {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        form button {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
        }

        /* Footer Styles */
        footer {
            background-color: #1e3a5f;
            color: #f1f1f1;
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

        /* Responsive Styles */
        @media (max-width: 768px) {
            table, form {
                width: 90%;
            }

            h1, h2 {
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
<h1>Client List</h1>

<!-- Client Table -->
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="client" items="${clients}">
        <tr>
            <td>${client.id}</td>
            <td>${client.nom}</td>
            <td>${client.email}</td>
            <td class="action-buttons">
                <a href="client?action=edit&id=${client.id}"><button class="edit">Edit</button></a>
                <a href="client?action=delete&id=${client.id}" onclick="return confirm('Are you sure you want to delete this client?')">
                    <button class="delete">Delete</button>
                </a>
                <a href="client?action=details&id=${client.id}"><button class="details">Details</button></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Add Client Form -->
<form action="client" method="post">
    <h2>Add Client</h2>
    <label for="nom">Name:</label>
    <input type="text" id="nom" name="nom" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>

    <button class="add" type="submit">Add Client</button>
</form>

<footer>
    <p>© 2024 CRUD LSI Lab. Designed with <i class="fas fa-heart"></i>. <a href="https://jakarta.ee/">Powered by Jakarta EE</a>.</p>
</footer>
</body>
</html>
