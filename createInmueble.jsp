<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %> <!-- Importar BigDecimal aquí -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Inmueble</title>
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
        input[type="text"], input[type="number"], textarea {
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
        <h1 class="text-center">Crear Inmueble</h1>
        <%
            String mensaje = "";
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String descripcion = request.getParameter("descripcion");
                String tipo = request.getParameter("tipo");
                String precio = request.getParameter("precio");
                String ubicacion = request.getParameter("ubicacion");

                try {
                    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/casasegura", "postgres", "1");
                    String sql = "INSERT INTO inmuebles (descripcion, tipo, precio, ubicacion) VALUES (?, ?, ?, ?)";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, descripcion);
                    ps.setString(2, tipo);
                    ps.setBigDecimal(3, new BigDecimal(precio));
                    ps.setString(4, ubicacion);

                    int result = ps.executeUpdate();
                    if (result > 0) {
                        mensaje = "Inmueble creado exitosamente.";
                    } else {
                        mensaje = "No se pudo crear el inmueble.";
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    mensaje = "Error en el sistema. Por favor, intente más tarde.";
                }
            }
        %>
        <form action="createInmueble.jsp" method="post">
            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="tipo">Tipo:</label>
                <input type="text" id="tipo" name="tipo" required />
            </div>
            <div class="form-group">
                <label for="precio">Precio:</label>
                <input type="number" id="precio" name="precio" step="0.01" required />
            </div>
            <div class="form-group">
                <label for="ubicacion">Ubicación:</label>
                <input type="text" id="ubicacion" name="ubicacion" required />
            </div>
            <input type="submit" value="Crear Inmueble" />
        </form>
        <c:if test="${not empty mensaje}">
            <div class="alert alert-info mt-3">
                <c:out value="${mensaje}" />
            </div>
        </c:if>
    </div>
</body>
</html>
