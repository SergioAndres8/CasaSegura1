<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CasaSegura - Inicio</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        html, body {
            height: 90%;
            margin: 0;
            background: #0d0d0d;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
            overflow-x: hidden;
        }
        .container {
            min-height: calc(100vh - 60px); /* Ajusta la altura mínima para que el footer esté en la parte inferior */
        }
        .jumbotron {
            background: linear-gradient(to right, #292929, #404040);
            color: #e0e0e0;
            padding: 4rem 2rem;
            border-radius: 0;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6);
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }
        .jumbotron h1 {
            font-size: 4rem;
            font-weight: 700;
            text-shadow: 0 0 15px rgba(0, 191, 255, 0.8);
            animation: glow 1.5s infinite;
        }
        .jumbotron p {
            font-size: 1.5rem;
            text-shadow: 0 0 10px rgba(0, 191, 255, 0.6);
        }
        @keyframes glow {
            0% { text-shadow: 0 0 10px rgba(0, 191, 255, 0.8); }
            50% { text-shadow: 0 0 20px rgba(0, 191, 255, 1); }
            100% { text-shadow: 0 0 10px rgba(0, 191, 255, 0.8); }
        }
        .card {
            background: #1e1e1e;
            border: none;
            border-radius: 1rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
            color: #e0e0e0;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.8);
        }
        .card-img-top {
            border-top-left-radius: 1rem;
            border-top-right-radius: 1rem;
            transition: transform 0.3s;
        }
        .card-img-top:hover {
            transform: scale(1.05);
        }
        .card-body {
            padding: 2rem;
        }
        .card-title {
            font-size: 1.75rem;
            font-weight: 600;
            color: #00bfff;
        }
        .card-text {
            font-size: 1rem;
        }
        .btn-primary {
            background-color: #00bfff;
            border-color: #00bfff;
            color: #000;
            font-weight: 600;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #009acd;
            border-color: #009acd;
            color: #fff;
        }
        .footer {
            background: #1e1e1e;
            padding: 1rem;
            text-align: center;
            color: #e0e0e0;
            border-top: 1px solid #333;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        @media (max-width: 768px) {
            .jumbotron h1 {
                font-size: 2.5rem;
            }
            .jumbotron p {
                font-size: 1.2rem;
            }
        }
        .row {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Jumbotron Header -->
        <div class="jumbotron text-center">
            <h1 class="display-4">Bienvenido a CasaSegura</h1>
            <p class="lead">La plataforma futurista para gestionar tus inmuebles con facilidad y estilo.</p>
        </div>

        <!-- Card Sections -->
        <div class="row">
            <!-- Tarjeta para la administración -->
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <img src="img/admin.jpeg" class="card-img-top" alt="Administración">
                    <div class="card-body">
                        <h5 class="card-title">Administración</h5>
                        <p class="card-text">Gestiona inmuebles y clientes con facilidad y eficiencia.</p>
                        <a href="loginAdmin.jsp" class="btn btn-primary">Ir a Administración</a>
                    </div>
                </div>
            </div>

            <!-- Tarjeta para el cliente -->
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <img src="img/cliente.png" class="card-img-top" alt="Cliente">
                    <div class="card-body">
                        <h5 class="card-title">Cliente</h5>
                        <p class="card-text">Solicita inmuebles, completa formularios de fiadores y actualiza tus datos personales.</p>
                        <a href="loginCliente.jsp" class="btn btn-primary">Ir a Cliente</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 CasaSegura. Todos los derechos reservados.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
