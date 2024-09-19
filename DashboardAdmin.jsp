<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin - CasaSegura</title>
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
        <h1 class="text-center">Dashboard Administrador</h1>

        <!-- Sección de administración -->
        <div class="row">
            <!-- Tarjeta para gestionar inmuebles -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Gestionar Inmuebles</h5>
                        <p class="card-text">Accede al panel para gestionar los inmuebles de la plataforma.</p>
                        <a href="createInmueble.jsp" class="btn btn-primary">Ir a Gestión de Inmuebles</a>
                    </div>
                </div>
            </div>

            <!-- Tarjeta para gestionar clientes -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Gestionar Clientes</h5>
                        <p class="card-text">Accede al panel para gestionar los clientes registrados.</p>
                        <a href="createCliente.jsp" class="btn btn-primary">Ir a Gestión de Clientes</a>
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
