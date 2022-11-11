<%-- 
    Document   : index
    Created on : 6 nov 2022, 18:26:34
    Author     : ksio
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
    }
%>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fsociety-Inicio</title>

    <!--CSS Y JS BOOTSTRAP-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="scrips/bootstrap.bundle.min.js"></script>
</head>
<body>
    
    <!--INICIA BARRA DE NAVEGACIÓN-->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: cornflowerblue">
        <div class="container-fluid">
            <div class="col-1">
                <a class="navbar-brand" href="index.jsp">
                    <img src="assets/logo.jpg" alt="" width="90" height="50" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                </a>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <form class="col-6 d-flex offset-1" role="search" action="#">
                    <input class="form-control me-2" type="search" placeholder="Buscar en la tienda" aria-label="Search">
                    <button class="btn btn-warning" type="submit">Buscar</button>
                </form>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 offset-1">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Lista de deseos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Carrito</a>
                    </li>
                        <%
                            session = request.getSession();
                            if(session.getAttribute("idusuario") == null){
                                out.println("<li class='nav-item'>");
                                    out.println("<a class='nav-link' href='login.jsp'>Iniciar Sesión</a>");
                                out.println("</li>");
                            }else{
                                out.println("<li class='nav-item dropdown'>");
                                    out.println("<a class='nav-link dropdown-toggle' href='#' role='button' data-bs-toggle='dropdown' aria-expanded='false'> Mi cuenta</a>");
                                    out.println("<ul class='dropdown-menu'>");
                                        out.println("<li><a class='dropdown-item' href='micuenta.jsp'>Mi información</a></li>");
                                        out.println("<li><a class='dropdown-item' href='miseguridad.jsp'>Seguridad</a></li>");
                                        out.println("<li><a class='dropdown-item' href='#'>Mis pedidos</a></li>");
                                        out.println("<li><a class='dropdown-item' href='#'>Lista de deseos</a></li>");
                                        out.println("<li><a class='dropdown-item' href='#'>Mis comentarios</a></li>");
                                        out.println("<li><hr class='dropdown-divider'></li>");
                                        out.println("<li><a class='text-danger dropdown-item' href='close_login'>Cerrar Session</a></li>");
                                    out.println("</ul>");
                                out.println("</li>");
                            }
                        %>
                </ul>
            </div>
        </div>
    </nav>

    <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
        <div class="container">
            <div class="collapse navbar-collapse d-flex justify-content-center" id="navbarSupportedContent">
                <div class="row">
                    <div class="col-3">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button"  data-bs-toggle="dropdown" aria-expanded="false">
                                Autores
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Autor1</a></li>
                                    <li><a class="dropdown-item" href="#">Autor2</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Ver más</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="col-3">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button"  data-bs-toggle="dropdown" aria-expanded="false">
                                Editoriales
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Editorial1</a></li>
                                    <li><a class="dropdown-item" href="#">Editorial2</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Ver más</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="col-3">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button"  data-bs-toggle="dropdown" aria-expanded="false">
                                Categorías
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Categoria1</a></li>
                                    <li><a class="dropdown-item" href="#">Categoria2</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Ver más</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="col-3">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button"  data-bs-toggle="dropdown" aria-expanded="false">
                                Colecciones
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Coleccion1</a></li>
                                    <li><a class="dropdown-item" href="#">Coleccion2</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Ver más</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <!--TERMINA BARRA DE NAVEGACIÓN-->
</body>
</html>

