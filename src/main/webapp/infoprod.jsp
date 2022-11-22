<%-- 
    Document   : infoprod
    Created on : 18 nov 2022, 00:18:50
    Author     : ksio
--%>

<%@page import="objetos.productos"%>
<%@page import="java.sql.Connection"%>
<%@page import="bd.conection_db"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
    }

    String consulta;
    ArrayList<productos> info = new ArrayList();
    productos prod;
%>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nombre producto</title>

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
                        <img src="assets/logo.jpg" alt="" width="110" height="90" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                    </a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="col-7 d-flex mx-3" role="search" action="#">
                        <input class="form-control me-2" type="search" placeholder="Buscar en la tienda" aria-label="Search">
                        <button class="btn btn-warning" type="submit">Buscar</button>
                    </form>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <a class="nav-link mx-3" href="index.jsp">
                            <img src="assets/icons/inicio.png" alt="Inicio" width="35" height="25" class="img-fluid txt_nav d-inline-block">
                        </a>
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="#">
                                <img src="assets/icons/hvacio.png" alt="Lista deseos" width="35" height="25" class="img-fluid txt_nav d-inline-block">
                            </a>
                        </li>
                        <li class="nav-item mx-3">
                            <a class="nav-link position-relative" href="#">
                                <img src="assets/icons/full.png" alt="Carrito" width="35" height="25" class="img-fluid txt_nav d-inline-block"> 
                                <span class="badge text-bg-warning">1</span> <!--NUMERO DE PRODUCTOS EN EL CARRITO--->
                            </a>
                        </li>
                        <%
                            session = request.getSession();
                            if(session.getAttribute("idusuario") == null){
                                out.println("<li class='nav-item mx-3'>");
                                    out.println("<a class='nav-link' href='login.jsp'><img src='assets/icons/sing.png' alt='Usuario' width='35' height='25' class='img-fluid txt_nav d-inline-block'> </a>");
                                out.println("</li>");
                            }else{
                                out.println("<li class='nav-item dropdown mx-3'>");
                                    out.println("<a class='nav-link dropdown-toggle' href='#' role='button' data-bs-toggle='dropdown' aria-expanded='false'><img src='assets/icons/log.png' alt='Usuario' width='35' height='25' class='img-fluid txt_nav d-inline-block'></a>");
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

        <div class="container my-4">
            <div class="row d-flex justify-content-evenly">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-5 reg-color bg-light">
                    <img width='400' height='550' src="assets/productos/prod_2.png" class="image-fluid" alt="producto">
                </div>

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 reg-color">
                    <div class="list-group">
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-start">
                                <h5 class="mb-1">One Piece</h5><br>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Sinopsis:</h5>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p>Descripción</p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <p>$ 00.00</p>
                                <p>Unidades disponibles: 10</p>
                            </div>
                        </li>
                        <!--COLOCAR SI HAY UNIDADES O NO, SINO NO MOSTRAR ESTE FOMRULARIO Y PONER UN AVISO DE QUE NO HAY-->
                        <li class="list-group-item bg-light" aria-current="true">
                            <form class="row g-3 needs-validation px-5 justify-content-evenly"  method="POST" action="#" novalidate>
                                <div class="col-6 align-self-center>"> <!--UNIDADES-->
                                    <input type="number" max="9999999999" min="1" value="1" class="form-control" name="unidades" id="num" required> <!--OBTENER NUMERO DE UNIDADES Y COLOCARLO EN EN EL MAX-->
                                    <div class="invalid-feedback">
                                        Inserte un numero valido
                                    </div>
                                </div>
                                <div class="col-6 align-self-center>"> <!-BOTON-->
                                    <div class="col-12 d-flex justify-content-end py-3">
                                        <button class="btn btn-warning" type="submit">
                                            <img class="p-1" src="assets/icons/carro.png" alt="Añadir al carrito" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                            Agregar al carrito
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </li>
                    </div>
                </div>
            </div>
        </div>

        <!--TARJEAS DE INFORMACION DEL PRODUCTO-->
        <div class="container my-4">
            <div class="row d-flex justify-content-evenly">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-5 reg-color">
                    <div class="list-group bg-light">
                        <li class="list-group-item bg-success" aria-current="true">
                            <div class="d-flex w-100 justify-content-center">
                                <h5 class="mb-1">Datalles del producto</h5><br>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Autor:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p>Autor 1</p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Año de publicación:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p>AÑO</p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Mes:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p>MES</p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Numero de paginas:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p>PAGINAS</p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Editorial:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p>EDITORIAL</p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Colección:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p>COLECCIÓN</p>
                            </div>
                        </li>
                    </div>
                </div>

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 reg-color">
                    <div class="list-group">
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-start">
                                <h6>Siguiente volumen</h6>
                            </div>
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <div class="d-flex w-100 justify-content-evenly my-2">
                                            <img width='80' height='100' src="assets/productos/prod_2.png" class="image-fluid" alt="siguiente">
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h6 class="card-title">NOMBRE</h6>
                                            <div class="d-flex w-100 justify-content-between">
                                                <p class="card-text">$ 0.00</p>
                                                <a href="#" class="btn btn-warning">Comprar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-start">
                                <h6>Volumen más nuevo</h6>
                            </div>
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <div class="d-flex w-100 justify-content-evenly my-2">
                                            <img width='80' height='100' src="assets/productos/prod_2.png" class="image-fluid" alt="siguiente">
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h6 class="card-title">NOMBRE</h6>
                                            <div class="d-flex w-100 justify-content-between">
                                                <p class="card-text">$ 0.00</p>
                                                <a href="#" class="btn btn-warning">Comprar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-start">
                                <h6>Volumen anterior</h6>
                            </div>
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <div class="d-flex w-100 justify-content-evenly my-2">
                                            <img width='80' height='100' src="assets/productos/prod_2.png" class="image-fluid" alt="siguiente">
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h6 class="card-title">NOMBRE</h6>
                                            <div class="d-flex w-100 justify-content-between">
                                                <p class="card-text">$ 0.00</p>
                                                <a href="#" class="btn btn-warning">Comprar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </div>
                </div>
            </div>
        </div>
