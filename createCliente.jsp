<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Cliente</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #2c2c2c;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 5rem auto;
            background: #1e1e1e;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
        }
        h1 {
            color: #00bfff;
            margin-bottom: 1.5rem;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="tel"], input[type="date"], input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            margin: 0.5rem 0 1rem;
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Crear Cliente</h1>
        <%
            String mensaje = "";
            
            // Configuración de la conexión a PostgreSQL en Render
            String url = "jdbc:postgresql://dpg-crksje5umphs73br76qg-a.oregon-postgres.render.com:5432/casasegura";
            String user = "casasegura_user";
            String passwordDB = "fSvSdj7MOZybz6AJVaf1DdrfQlxNt6CG";
            
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String cedula = request.getParameter("cedula");
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String birthdate = request.getParameter("birthdate");
                String password = request.getParameter("password");

                // Validación de la fecha de nacimiento
                Date birthDateValue = null;
                if (birthdate != null && !birthdate.isEmpty()) {
                    try {
                        birthDateValue = Date.valueOf(birthdate);
                    } catch (IllegalArgumentException e) {
                        mensaje = "Fecha de nacimiento no válida.";
                    }
                }

                try {
                    // Conexión a la base de datos de Render
                    Connection con = DriverManager.getConnection(url, user, passwordDB);
                    String sql = "INSERT INTO clientes (cedula, username, email, phone, address, birthdate, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, cedula);
                    ps.setString(2, username);
                    ps.setString(3, email);
                    ps.setString(4, phone);
                    ps.setString(5, address);
                    ps.setDate(6, birthDateValue);
                    ps.setString(7, password); // Es recomendable encriptar las contraseñas

                    int result = ps.executeUpdate();
                    if (result > 0) {
                        mensaje = "Cliente creado exitosamente.";
                    } else {
                        mensaje = "No se pudo crear el cliente.";
                    }
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    mensaje = "Error en el sistema. Por favor, intente más tarde.";
                }
            }
        %>
        <form action="createCliente.jsp" method="post">
            <div class="form-group">
                <label for="cedula">Cédula:</label>
                <input type="text" id="cedula" name="cedula" required />
            </div>
            <div class="form-group">
                <label for="name">Nombre:</label>
                <input type="text" id="name" name="name" required />
            </div>
            <div class="form-group">
                <label for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email" required />
            </div>
            <div class="form-group">
                <label for="phone">Teléfono:</label>
                <input type="tel" id="phone" name="phone" />
            </div>
            <div class="form-group">
                <label for="address">Dirección:</label>
                <input type="text" id="address" name="address" />
            </div>
            <div class="form-group">
                <label for="birthdate">Fecha de Nacimiento:</label>
                <input type="date" id="birthdate" name="birthdate" />
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required />
            </div>
            <input type="submit" value="Crear Cliente" />
        </form>
        <%
            // Mostrar el mensaje si existe
            if (!mensaje.isEmpty()) {
        %>
            <div class="alert alert-info mt-3">
                <%= mensaje %>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
