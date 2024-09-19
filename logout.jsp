<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <meta http-equiv="refresh" content="2;url=/CasaSegura1/">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #1e1e1e;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
            text-align: center;
            padding: 5rem;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #2c2c2c;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
        }
        h1 {
            color: #00bfff;
            margin-bottom: 1.5rem;
        }
        p {
            margin-bottom: 2rem;
        }
        a {
            color: #00bfff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Logout</h1>
        <%
            // Obtener la sesión actual y invalidarla si existe
            HttpSession currentSession = request.getSession(false);
            if (currentSession != null) {
                currentSession.invalidate(); // Invalidar la sesión para cerrar sesión de forma efectiva
            }
        %>
        <p>Has cerrado sesión exitosamente. Redirigiendo a la página principal...</p>
        <p>Si no eres redirigido automáticamente, <a href="/CasaSegura1/">haz clic aquí</a>.</p>
    </div>
</body>
</html>
