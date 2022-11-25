<%-- 
    Document   : carrito
    Created on : 24 nov 2022, 18:15:31
    Author     : ksio
--%>

<%@page import="objetos.infocarrito"%>
<%@page import="java.util.ArrayList"%>
<%
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
    }

    String consulta;
    ArrayList<infocarrito> info_car = new ArrayList();
    info_car = (ArrayList<infocarrito>) session.getAttribute("carrito");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fsociety - Carrito de compras</title>

        <!--CSS Y JS BOOTSTRAP-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="scrips/bootstrap.bundle.min.js"></script>
        <script src="scrips/main.css"></script>
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
                                <% 
                                    session = request.getSession();
                                    if(session.getAttribute("carrito")!=null){
                                        out.println("<span class='badge text-bg-warning'>" +(info_car.size())+"</span>");
                                    }
                                %>
                            </a>
                        </li>
                        <%  
                            session = request.getSession();
                            if (session.getAttribute("idusuario") == null) {
                                out.println("<li class='nav-item mx-3'>");
                                out.println("<a class='nav-link' href='login.jsp'><img src='assets/icons/sing.png' alt='Usuario' width='35' height='25' class='img-fluid txt_nav d-inline-block'> </a>");
                                out.println("</li>");
                            } else {
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
        
        <!--LISTA DE PRODUCTOS SELECCIONADOS-->
        <div class="container my-4">
            <div class="row d-flex justify-content-evenly">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-8 reg-color">
                    <h1>Tu carrito de compras</h1>
                    <ul class='list-group'>
                        <%
                            session = request.getSession();
                            if(session.getAttribute("carrito")!=null){
                                out.println("<div class='d-flex justify-content-end'>");
                                out.println("<a class='btn btn-danger' href='savecar?opt=3'>Vaciar el carrito</a>");
                                out.println("</div>");
                                for(infocarrito item : info_car){
                                    out.println("<li class='list-group-item'>");
                                    out.println("<div class='card mb-3 bg-light' style='max-width: 940px;'>");
                                    out.println("<div class='row g-0'>");
                                    out.println("<div class='col-md-2'>");
                                    out.println("<div class='d-flex w-100 justify-content-center my-2'>");
                                    out.println("<img width='80' height='100' src='assets/productos/prod_2.png' class='image-fluid'>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("<div class='col-md-10'>");
                                    out.println("<div class='card-body'>");
                                    out.println("<strong><h8 class='card-title'>"+item.getNombre()+"</h8></strong>");
                                    out.println("<form class='row g-3 needs-validation py-2 d-flex justify-content-between'  method='POST' action='#' novalidate>");
                                    out.println("<div class='col-3 align-self-center>'> <!--UNIDADES-->");
                                    out.println("<input type='number' max='"+item.getUnidades()+"' min='1' value='"+item.getCantidad()+"' class='form-control' name='unidades' id='num' required> ");
                                    out.println("<div class='invalid-feedback'>");
                                    out.println("¡Solo hay x unidades disponibles!");
                                    out.println("</div>");
                                    out.println("<div class='valid-feedback'>");
                                    out.println("¡Continuemos con la compra!");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("<div class='col-2 align-self-center>'> <!--BOTON ELIMINAR-->");
                                    out.println("<a class='btn' type='submit' href='#'>");
                                    out.println("<img class='p-1' src='assets/icons/eliminar.png' alt='eliminar' width='30' height='30' class='img-fluid txt_nav d-inline-block'>");
                                    out.println("</a>");
                                    out.println("</div>");
                                    out.println("<div class='col-2 align-self-center>'> <!--PRECIO UNITARIO-->");
                                    out.println("Unidad "+item.getUnitario());
                                    out.println("</div>");
                                    out.println("<div class='col-2 align-self-center>'> <!--PRECIO PARCIAL-->");
                                    out.println("Parcial "+item.getParcial());
                                    out.println("</div>");
                                    out.println("</form>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</li>");
                                }
                            }else{
                                out.println("<li class='list-group-item'>");
                                out.println("<div class='card mb-3 bg-light' style='max-width: 940px;'>");
                                out.println("<div class='row g-0'>");
                                out.println("<div class='col-md-2'>");
                                out.println("<div class='d-flex w-100 justify-content-center my-2'>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("<div class='col-md-10'>");
                                out.println("<div class='card-body'>");
                                out.println("<div class='d-flex justify-content-center'>");
                                out.println("<strong><p>No se ha agregado ningun articulo al carrito</p></strong>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</li>");
                                
                            }
                        %>
                    </ul>
                </div>
                
                <!--TABLA DE PRECIO-->
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-4 py-5 reg-color align-self-center">
                    <ul class="list-group">
                        <li class="list-group-item" style="background-color: #e3f2fd;">
                            <div class="d-flex justify-content-center">
                                <h4>Resumen</h4>
                            </div>
                        </li>
                        <li class="list-group-item bg-light">
                            <div class="d-flex justify-content-start">
                                Total parcial
                            </div>
                            <div class="d-flex justify-content-end">
                                <h6>$ 00.00</h6>
                            </div>
                        </li>
                        <li class="list-group-item bg-light"> <!--SI SON MENOS DE 500 SE PAGA, SINO PUES NO XD-->
                            <div class="d-flex justify-content-start">
                                Costo de envio
                            </div>
                            <div class="d-flex justify-content-end">
                                <h6>$ 80.00</h6>
                            </div>
                        </li>
                        <li class="list-group-item bg-light"> <!--SI SON MENOS DE 500 SE PAGA, SINO PUES NO XD-->
                            <div class="d-flex justify-content-start">
                                Total del pedido
                            </div>
                            <div class="d-flex justify-content-end text-success">
                                <h4>$ 80.00</h4>
                            </div>
                        </li>
                        <li class="list-group-item bg-light">
                            <div class="d-grid gap-2">
                                <a class="btn btn-warning" href="#" role="button">Terminar el pedido</a>
                            </div>
                        </li>
                        <li class="list-group-item bg-light">
                            <div class="d-grid gap-2">
                                <a class="btn btn-outline-primary" href="#" role="button">Seguir comprando</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <script>
            //VERIFICAR SI EL FOMRULARIO ES VALIDO O NO
            (() => {
                'use strict'

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                const forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
                })
            })()
        </script>
    </body>
</html>
