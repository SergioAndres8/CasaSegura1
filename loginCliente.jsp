<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Cliente</title>
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
        <h2 class="text-center">Login Cliente</h2>
        <%
    String errorMessage = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Conexión a la base de datos alojada en Render
            String dbUrl = "jdbc:postgresql://dpg-crksje5umphs73br76qg-a.oregon-postgres.render.com/casasegura";
            String dbUser = "casasegura_user";
            String dbPassword = "fSvSdj7MOZybz6AJVaf1DdrfQlxNt6CG";

            con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            String sql = "SELECT * FROM clientes WHERE cedula=? AND password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            HttpSession userSession = request.getSession();

            if (rs.next()) {
                userSession.setAttribute("cliente", username);
                response.sendRedirect("DashboardCliente.jsp");
            } else {
                errorMessage = "Credenciales incorrectas.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "Error en el sistema. Por favor, intente más tarde.";
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (ps != null) ps.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
%>

        <form method="post">
            <div class="form-group">
                <label for="username">Nombre de Usuario:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
        </form>
        
        <% if (!errorMessage.isEmpty()) { %>
            <div class="alert alert-danger" role="alert">
                <%= errorMessage %>
            </div>
        <% } %>
    </div>
</body>
</html>
