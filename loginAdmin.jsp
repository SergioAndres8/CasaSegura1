<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql., javax.servlet., javax.servlet.http.*" %>
<%
    String errorMessage = "";
    String successMessage = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                // Cargar el driver de PostgreSQL
                Class.forName("org.postgresql.Driver");

                // Conexión a la base de datos alojada en Render
                String dbUrl = "jdbc:postgresql://dpg-crksje5umphs73br76qg-a.oregon-postgres.render.com/casasegura";
                String dbUser = "casasegura_user";
                String dbPassword = "fSvSdj7MOZybz6AJVaf1DdrfQlxNt6CG";

                con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                String sql = "SELECT * FROM administradores WHERE username=? AND password=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
                rs = ps.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession(); // Obtener sesión
                    session.setAttribute("admin", username);
                    response.sendRedirect("DashboardAdmin.jsp");
                    return; // Detener la ejecución del resto del código
                } else {
                    errorMessage = "Credenciales incorrectas.";
                }
            } catch (Exception e) {
                e.printStackTrace();
                errorMessage = "Error en el sistema. Por favor, intente más tarde.";
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Admin - CasaSegura</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #0d0d0d;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 3rem auto;
            background: #1e1e1e;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
        }
        h2 {
            margin-bottom: 1.5rem;
            color: #00bfff;
        }
        .btn-primary {
            background-color: #00bfff;
            border-color: #00bfff;
            color: #000;
        }
        .btn-primary:hover {
            background-color: #009acd;
            border-color: #009acd;
            color: #fff;
        }
        .alert {
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Login Admin</h2>
        <form method="post">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label for="username">Nombre de Usuario:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
        </form>

        <!-- Mostrar mensajes de error o éxito utilizando scriptlets en lugar de JSTL -->
        <% if (!errorMessage.isEmpty()) { %>
            <div class="alert alert-danger" role="alert">
                <%= errorMessage %>
            </div>
        <% } else if (!successMessage.isEmpty()) { %>
            <div class="alert alert-success" role="alert">
                <%= successMessage %>
            </div>
        <% } %>
    </div>
</body>
</html>
