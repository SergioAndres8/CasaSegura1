<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.math.BigDecimal" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Solicitar y Ver Inmueble</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #1e1e1e;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            max-width: 900px;
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
        input[type="text"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #444;
            border-radius: 0.25rem;
            background: #333;
            color: #e0e0e0;
        }
        input[type="submit"], button {
            width: 100%;
            padding: 0.75rem;
            background-color: #00bfff;
            border: none;
            border-radius: 0.25rem;
            color: #000;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 1rem;
        }
        input[type="submit"]:hover, button:hover {
            background-color: #009acd;
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
            color: #00bfff;
        }
        tr:nth-child(even) {
            background: #2c2c2c;
        }
        tr:hover {
            background: #3a3a3a;
        }
        .alert {
            margin-top: 1rem;
            color: #00bfff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Solicitar y Ver Inmueble</h1>
        
        <!-- Formulario para solicitar un inmueble -->
        <form action="Inmuebles.jsp" method="post">
            <div class="form-group">
                <label for="inmuebleId">ID del Inmueble:</label>
                <input type="text" id="inmuebleId" name="inmuebleId" required />
            </div>
            <input type="submit" value="Solicitar Inmueble" />
        </form>
        
        <!-- Botón para ver todos los inmuebles -->
        <form action="Inmuebles.jsp" method="get">
            <button type="submit" name="action" value="verTodos">Ver Todos los Inmuebles</button>
        </form>

        <% 
            String mensaje = "";
            String inmuebleId = request.getParameter("inmuebleId");
            String action = request.getParameter("action");

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            // Conexión a la base de datos de Render
            String url = "jdbc:postgresql://dpg-crksje5umphs73br76qg-a.oregon-postgres.render.com/casasegura";
            String user = "casasegura_user";
            String passwordDB = "fSvSdj7MOZybz6AJVaf1DdrfQlxNt6CG";
            
            if ("verTodos".equals(action)) {
                try {
                    // Establecer conexión con PostgreSQL
                    Class.forName("org.postgresql.Driver");
                    conn = DriverManager.getConnection(url, user, passwordDB);
                    
                    // Preparar y ejecutar consulta para todos los inmuebles
                    String sql = "SELECT id, descripcion, tipo, precio, ubicacion FROM inmuebles";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();
        %>
        <!-- Mostrar todos los inmuebles -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descripción</th>
                    <th>Tipo</th>
                    <th>Precio</th>
                    <th>Ubicación</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String descripcion = rs.getString("descripcion");
                        String tipo = rs.getString("tipo");
                        BigDecimal precio = rs.getBigDecimal("precio");
                        String ubicacion = rs.getString("ubicacion");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= descripcion %></td>
                    <td><%= tipo %></td>
                    <td><%= precio %></td>
                    <td><%= ubicacion %></td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
        <% 
                } catch (Exception e) {
                    e.printStackTrace();
                    mensaje = "Error en el sistema. Por favor, intente más tarde.";
                } finally {
                    // Cerrar recursos
                    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            } else if (inmuebleId != null && !inmuebleId.isEmpty()) {
                try {
                    // Establecer conexión con PostgreSQL
                    Class.forName("org.postgresql.Driver");
                    conn = DriverManager.getConnection(url, user, passwordDB);
                    
                    // Preparar y ejecutar consulta para un inmueble específico
                    String sql = "SELECT id, descripcion, tipo, precio, ubicacion FROM inmuebles WHERE id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, Integer.parseInt(inmuebleId));
                    rs = pstmt.executeQuery();
                    
                    // Mostrar datos
                    if (rs.next()) {
                        int id = rs.getInt("id");
                        String descripcion = rs.getString("descripcion");
                        String tipo = rs.getString("tipo");
                        BigDecimal precio = rs.getBigDecimal("precio");
                        String ubicacion = rs.getString("ubicacion");
        %>
        <!-- Mostrar los detalles del inmueble -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descripción</th>
                    <th>Tipo</th>
                    <th>Precio</th>
                    <th>Ubicación</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= id %></td>
                    <td><%= descripcion %></td>
                    <td><%= tipo %></td>
                    <td><%= precio %></td>
                    <td><%= ubicacion %></td>
                </tr>
            </tbody>
        </table>
        <% 
                    } else {
                        mensaje = "No se encontró un inmueble con el ID proporcionado.";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    mensaje = "Error en el sistema. Por favor, intente más tarde.";
                } finally {
                    // Cerrar recursos
                    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            } else {
                mensaje = "Por favor, ingrese un ID de inmueble.";
            }
        %>

        <!-- Mostrar el mensaje si existe -->
        <% if (!mensaje.isEmpty()) { %>
            <div class="alert alert-info">
                <%= mensaje %>
            </div>
        <% } %>

    </div>
</body>
</html>
