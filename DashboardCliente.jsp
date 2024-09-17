<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
