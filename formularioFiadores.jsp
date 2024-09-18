<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario de Fiadores</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #1e1e1e;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 5rem auto;
            background: #2c2c2c;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
        }
        h1 {
            color: #00bfff;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 0.5rem;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #444;
            border-radius: 0.25rem;
            background: #333;
            color: #e0e0e0;
        }
        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #00bfff;
            border: none;
            border-radius: 0.25rem;
            color: #000;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #009acd;
        }
        .alert {
            margin-top: 1rem;
        }
        table {
            width: 100%;
            margin-top: 2rem;
            border-collapse: collapse;
        }
        th, td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #444;
        }
        th {
            background: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Formulario de Fiadores</h1>
        
        <!-- Sección de Registro de Fiadores -->
        <h2>Registrar Nuevo Fiador</h2>
<form action="formularioFiadores.jsp" method="post">
    <div class="form-group">
        <label for="cedula">Cédula del Fiador:</label>
        <input type="text" id="cedula" name="cedula" required />
    </div>
    <div class="form-group">
        <label for="fiadorName">Nombre del Fiador:</label>
        <input type="text" id="fiadorName" name="fiadorName" required />
    </div>
    <div class="form-group">
        <label for="fiadorEmail">Correo Electrónico del Fiador:</label>
        <input type="email" id="fiadorEmail" name="fiadorEmail" required />
    </div>
    <input type="submit" value="Registrar Fiador" />
</form>

<!-- Mensaje de Estado -->
<%
    String mensaje = "";
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // URL de conexión a PostgreSQL en Render
    String url = "jdbc:postgresql://dpg-crksje5umphs73br76qg-a.oregon-postgres.render.com/casasegura";
    String user = "casasegura_user";
    String password = "fSvSdj7MOZybz6AJVaf1DdrfQlxNt6CG";

    // Registro de Fiador
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String cedula = request.getParameter("cedula");
        String nombre = request.getParameter("fiadorName");
        String email = request.getParameter("fiadorEmail");

        try {
            // Establecer conexión con la base de datos en Render
            con = DriverManager.getConnection(url, user, password);
            String insertSql = "INSERT INTO fiadores (cedula, nombre, email) VALUES (?, ?, ?)";
            ps = con.prepareStatement(insertSql);
            ps.setString(1, cedula);
            ps.setString(2, nombre);
            ps.setString(3, email);

            int result = ps.executeUpdate();
            if (result > 0) {
                mensaje = "Fiador registrado exitosamente.";
            } else {
                mensaje = "No se pudo registrar el fiador.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mensaje = "Error en el sistema. Por favor, intente más tarde.";
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
<% if (!mensaje.isEmpty()) { %>
    <div class="alert alert-info mt-3">
        <%= mensaje %>
    </div>
<% } %>

<!-- Sección de Listado de Fiadores -->
<h2>Lista de Fiadores</h2>
<%
    try {
        // Establecer conexión con la base de datos en Render
        con = DriverManager.getConnection(url, user, password);
        String selectSql = "SELECT * FROM fiadores";
        ps = con.prepareStatement(selectSql);
        rs = ps.executeQuery();
%>
<table>
    <thead>
        <tr>
            <th>Cédula</th>
            <th>Nombre</th>
            <th>Correo Electrónico</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("cedula") %></td>
                <td><%= rs.getString("nombre") %></td>
                <td><%= rs.getString("email") %></td>
            </tr>
        <% } %>
    </tbody>
</table>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

