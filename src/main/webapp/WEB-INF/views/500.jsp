<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur Serveur</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f8f9fa;
            color: #343a40;
            margin-top: 100px;
        }
        h1 {
            font-size: 48px;
            color: #dc3545;
        }
        p {
            font-size: 20px;
        }
        pre {
            background-color: #f1f1f1;
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            max-width: 80%;
            margin: 20px auto;
            overflow: auto;
            color: #343a40;
        }
    </style>
</head>
<body>
<h1>500 - Erreur Serveur</h1>
<p>Une erreur interne s'est produite sur le serveur.</p>
<p>Veuillez réessayer plus tard ou contacter l'administrateur.</p>
<p><a href="/">Retour à l'accueil</a></p>
<pre>
        <%
            if (exception != null) {
                out.print("Message d'erreur : " + exception.getMessage());
                exception.printStackTrace(new java.io.PrintWriter(out));
            } else {
                out.print("Aucune information d'erreur disponible.");
            }
        %>
    </pre>
</body>
</html>
