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
                        <a class="nav-link position-relative" href="#">
                            Carrito 
                            <span class="badge text-bg-warning">1</span> <!--NUMERO DE PRODUCTOS EN EL CARRITO--->
                        </a>
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
    
    <!--CARRUSEL DE IMAGENES-->
    <div class="containter my-1 mx-4">
        <div class="row">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="assets/carrusel/carrusel1.png" height="300" class="d-block w-100 mx-auto d-block" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="assets/carrusel/carrusel2.png" height="300" class="d-block w-100 mx-auto d-block" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="assets/carrusel/carrusel3.png" height="300" class="d-block w-100 mx-auto d-block" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <!--TERMINA CARRUSEL DE IMAGENES-->
    <div class="containter my-3 mx-1">
        <div class="row my-4 text-center">
            <div class="col-5">
                <ul class="list-group">
                    <li class="list-group-item active" aria-current="true">
                        <h2>Lanzamientos destacados</h2>
                    </li>
                </ul>        
            </div>
        </div>

    <!--CARRUSEL DE PRODUCTOS DESTACADOS-->
        <div class="containter-fuid">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner row-cols-2 row-cols-md-4 g-4">
                    <div class="carousel-item active">
                        <div class="row row-cols-2 row-cols-md-4 g-4">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 18rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">Añadir al carrito</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 18rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">Añadir al carrito</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 18rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" href="#" class="btn btn-warning">Añadir al carrito</a>
                                        <span>$19.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 18rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" href="#" class="btn btn-warning">Añadir al carrito</a>
                                        <span>$19.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-danger" style="width: 18rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-danger" style="width: 18rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-danger" style="width: 18rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-danger" style="width: 18rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
</body>
</html>

