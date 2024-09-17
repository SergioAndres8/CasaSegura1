<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Datos del Cliente</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #1e1e1e;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            max-width: 600px;
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
        input[type="text"], input[type="email"], input[type="date"], input[type="tel"], textarea {
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Actualizar Datos del Cliente</h1>
        <%
            String mensaje = "";
            String cedula = request.getParameter("cedula");
            String nombre = "";
            String email = "";
            String phone = "";
            String address = "";
            Date birthdate = null;

            if (cedula != null && !cedula.isEmpty()) {
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/casasegura", "postgres", "1");
                    String sql = "SELECT * FROM clientes WHERE cedula = ?";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, cedula);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        nombre = rs.getString("nombre");
                        email = rs.getString("email");
                        phone = rs.getString("phone");
                        address = rs.getString("address");
                        birthdate = rs.getDate("birthdate");

                        // Manejando los datos actualizados
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            nombre = request.getParameter("nombre");
                            email = request.getParameter("email");
                            phone = request.getParameter("phone");
                            address = request.getParameter("address");
                            birthdate = Date.valueOf(request.getParameter("birthdate"));

                            String updateSql = "UPDATE clientes SET nombre = ?, email = ?, phone = ?, address = ?, birthdate = ? WHERE cedula = ?";
                            ps = con.prepareStatement(updateSql);
                            ps.setString(1, nombre);
                            ps.setString(2, email);
                            ps.setString(3, phone);
                            ps.setString(4, address);
                            ps.setDate(5, birthdate);
                            ps.setString(6, cedula);

                            int result = ps.executeUpdate();
                            if (result > 0) {
                                mensaje = "Datos actualizados exitosamente.";
                            } else {
                                mensaje = "No se pudo actualizar los datos.";
                            }
                        }
                    } else {
                        mensaje = "Cliente no encontrado.";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    mensaje = "Error en el sistema. Por favor, intente más tarde.";
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
        %>
        <form action="actualizarDatos.jsp" method="get">
            <div class="form-group">
                <label for="cedula">Cédula:</label>
                <input type="text" id="cedula" name="cedula" required />
            </div>
            <input type="submit" value="Buscar Cliente" />
        </form>
        <% if (cedula != null && !cedula.isEmpty() && !mensaje.equals("Cliente no encontrado")) { %>
            <form action="actualizarDatos.jsp" method="post">
                <input type="hidden" name="cedula" value="<%= cedula %>" />
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" value="<%= nombre != null ? nombre : "" %>" />
                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico:</label>
                    <input type="email" id="email" name="email" value="<%= email != null ? email : "" %>" />
                </div>
                <div class="form-group">
                    <label for="phone">Teléfono:</label>
                    <input type="tel" id="phone" name="phone" value="<%= phone != null ? phone : "" %>" />
                </div>
                <div class="form-group">
                    <label for="address">Dirección:</label>
                    <input type="text" id="address" name="address" value="<%= address != null ? address : "" %>" />
                </div>
                <div class="form-group">
                    <label for="birthdate">Fecha de Nacimiento:</label>
                    <input type="date" id="birthdate" name="birthdate" value="<%= birthdate != null ? birthdate.toLocalDate() : "" %>" />
                </div>
                <input type="submit" value="Actualizar" />
            </form>
        <% } %>
        <% if (!mensaje.isEmpty()) { %>
            <div class="alert alert-info mt-3">
                <%= mensaje %>
            </div>
        <% } %>
    </div>
</body>
</html>
