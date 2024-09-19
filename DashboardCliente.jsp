<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Configuración de conexión a la base de datos de Render
    String dbUrl = "jdbc:postgresql://dpg-crksje5umphs73br76qg-a.oregon-postgres.render.com:5432/casasegura";
    String dbUser = "casasegura_user";
    String dbPassword = "fSvSdj7MOZybz6AJVaf1DdrfQlxNt6CG";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String errorMessage = null;

    try {
        // Cargar el driver JDBC de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Intentar la conexión a la base de datos
        con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        stmt = con.createStatement();

        // Ejemplo de consulta: puedes reemplazarla con lo que necesites
        // Aquí no hacemos ninguna consulta ya que es solo una página de cliente
    } catch (SQLException e) {
        e.printStackTrace();
        errorMessage = "Error al conectar con la base de datos: " + e.getMessage();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        errorMessage = "Error: Driver de PostgreSQL no encontrado.";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Cliente - CasaSegura</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #121212;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            margin-top: 2rem;
        }
        .btn-logout {
            margin-top: 2rem;
        }
        .card {
            background: #1e1e1e;
            border: none;
            border-radius: 1rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
            color: #e0e0e0;
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.7);
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #00bfff;
        }
        .card-text {
            margin-bottom: 1rem;
        }
        .btn-primary {
            background-color: #00bfff;
            border: none;
            border-radius: 0.25rem;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #009acd;
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
            border-radius: 0.25rem;
            transition: background-color 0.3s;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        h1 {
            color: #00bfff;
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Dashboard Cliente</h1>

        <!-- Mensaje de error si hay problemas con la base de datos -->
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= errorMessage %>
            </div>
        <% } %>

        <!-- Sección de cliente -->
        <div class="row">
            <!-- Tarjeta para solicitar inmuebles -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Solicitar Inmuebles</h5>
                        <p class="card-text">Completa formularios para solicitar nuevos inmuebles.</p>
                        <a href="Inmuebles.jsp" class="btn btn-primary">Ir a Solicitud de Inmuebles</a>
                    </div>
                </div>
            </div>

            <!-- Tarjeta para actualizar datos personales -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Actualizar Datos Personales</h5>
                        <p class="card-text">Actualiza tus datos personales y de contacto.</p>
                        <a href="actualizarDatos.jsp" class="btn btn-primary">Ir a Actualización de Datos</a>
                    </div>
                </div>
            </div>

            <!-- Tarjeta para formulario de fiadores -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Formulario de Fiadores</h5>
                        <p class="card-text">Completa el formulario para añadir fiadores a tu solicitud.</p>
                        <a href="formularioFiadores.jsp" class="btn btn-primary">Ir al Formulario de Fiadores</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Botón de cerrar sesión -->
        <div class="text-center">
            <a href="logout.jsp" class="btn btn-danger">Cerrar Sesión</a>
        </div>
    </div>
</body>
</html>

<%
    // Cerrar la conexión si está abierta
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (con != null) con.close();
%>
