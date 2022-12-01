<%-- 
    Document   : index
    Created on : 6 nov 2022, 18:26:34
    Author     : ksio
min--%>
<%@page import="objetos.infocarrito"%>
<%@page import="objetos.productos"%>
<%@page import="java.sql.Connection"%>
<%@page import="bd.conection_db"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    ArrayList<infocarrito> info_car = new ArrayList();
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='index.jsp'</script>");
    }
    if(request.getAttribute("carrito") != null){
        info_car = (ArrayList<infocarrito>) session.getAttribute("carrito");
    }
    String consulta;
    ArrayList<productos> info = new ArrayList();
    productos prod;
%>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″ />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fsociety-Inicio</title> <!--Por medio de una consulta poner el titulo del producto aqui-->

    <!--CSS Y JS BOOTSTRAP-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="scrips/bootstrap.bundle.min.js"></script>
</head>
<body>
    
    <!--INICIA BARRA DE NAVEGACI�N-->
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
                        <a class="nav-link position-relative" href="carrito.jsp">
                            <%
                                session = request.getSession();
                                if (session.getAttribute("carrito") != null) {
                                    out.println("<img src='assets/icons/full.png' alt='Carrito' width='35' height='25' class='img-fluid txt_nav d-inline-block'>");
                                    out.println("<span class='badge text-bg-warning'>" + (info_car.size()+1) + "</span>");
                                }else{
                                    out.println("<img src='assets/icons/carro.png' alt='Carrito' width='35' height='25' class='img-fluid txt_nav d-inline-block'>");
                                }
                            %>
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
                                        out.println("<li><a class='dropdown-item' href='micuenta.jsp'>Mi informaci�n</a></li>");
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
                                    <li><a class="dropdown-item" href="#">Ver m�s</a></li>
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
                                    <li><a class="dropdown-item" href="#">Ver m�s</a></li>
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
                                    <li><a class="dropdown-item" href="#">Ver m�s</a></li>
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
    <!--TERMINA BARRA DE NAVEGACI�N-->
    
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
                        <img src="assets/carrusel/carrusel.png" height="300" class="d-block w-100 mx-auto d-block" alt="...">
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
    
    <%
        consulta = "SELECT productos_idproducto as prod, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip, SUM(ventas.unidades) as total, productos.unidades FROM ventas INNER JOIN productos ON ventas.productos_idproducto = productos.idproducto WHERE productos.unidades != 0 GROUP BY productos_idproducto ORDER BY SUM(ventas.unidades) DESC LIMIT 11;";
        info.clear();
        info = conection_db.mas_deseados(consulta);
        prod = info.get(0);
    %>
    <!--INICIA PRODUCTOS M�S VENDIDOS-->
    <div class="containter my-3 mx-1">
        <div class="row my-4 text-end">
            <div class="col-5">
                <ul class="list-group">
                    <li class="list-group-item active" aria-current="true">
                        <h2>Productos más vendidos</h2>
                    </li>
                </ul>        
            </div>
        </div>
    </div>

    <!--CARRUSEL DE PRODUCTOS M�S VENDIDOS-->
        <div class="containter-fuid">
            <div id="carrusel_destacados" class="carousel slide">
                <div class="carousel-inner row-cols-2 row-cols-md-4 g-4">
                    <div class="carousel-item active">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">                                
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(1); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(2); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="Añadir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(3); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <% prod = info.get(4); %>
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(5); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(6); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(7); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% prod = info.get(8); %>
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(9); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(10); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" data-bs-target="#carrusel_destacados" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" data-bs-target="#carrusel_destacados" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!--TERMINA PRODUCTOS M�S VENDIDOS-->
    
        <!-- INICIA BANNER DE ARTICULO DESTACABLES EN LA TIENDA-->
        <div class="containter-fuid py-5 my-4 bg-danger p-2 text-dark bg-opacity-75">
            <div class="row row-cols-12 row-cols-md-12 g-12 d-flex justify-content-center">
                <div class="col-5">
                    <div class="card mb-5 bg-light border-dark" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-6">
                                <img width='400' height='450' src="assets/productos/prod_3.png" class="card-img-top image-fluid" alt="...">
                            </div>
                            <div class="col-md-6 d-flex">
                                <div class="row">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <h5 class="card-title">Chainsawman #12</h5>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="card-text">
                                            This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
                                        </p>
                                    </div>
                                    <div class="row d-flex align-items-end">
                                        <div class="mx-3 card-footer d-flex justify-content-between">
                                            <span>$19.00</span>
                                            <a type="button" href="#" class="btn btn-warning">
                                                <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block">
                                            </a>                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-5">
                    <div class="card mb-5 bg-light border-dark" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-6">
                                <img width='400' height='450' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                            </div>
                            <div class="col-md-6 d-flex">
                                <div class="row">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <h5 class="card-title">Berserk #37</h5>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="card-text">
                                            This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
                                        </p>
                                    </div>
                                    <div class="row d-flex align-items-end">
                                        <div class="mx-3 card-footer d-flex justify-content-between">
                                            <span>$19.00</span>
                                            <a type="button" href="#" class="btn btn-warning">
                                                <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                            </a>                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- TERMINA BANNER DE ARTICULO CUALQUIER-->
        
        <!--CARRUSEL DE PRODUCTOS MAS DESEADOS-->
        <div class="containter my-3 mx-1">
        <div class="row my-4 text-end">
            <div class="col-5">
                <ul class="list-group">
                    <li class="list-group-item active" aria-current="true">
                        <h2>Más deseados por los usuarios</h2>
                    </li>
                </ul>        
            </div>
        </div>
        <%
            info.clear();
            consulta = "SELECT productos_idproducto as prod, productos.unidades as unidades, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip, COUNT(productos_idproducto) AS num_selec FROM listadeseos INNER JOIN productos ON listadeseos.productos_idproducto = productos.idproducto WHERE unidades != 0 GROUP BY listadeseos.productos_idproducto ORDER BY COUNT(listadeseos.usuarios_idusuario) DESC LIMIT 11;";
            info = conection_db.mas_deseados(consulta);
            prod = info.get(0);
        %>
        <div class="containter-fuid">
            <div id="carrusel_deseos" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
                <div class="carousel-inner row-cols-2 row-cols-md-4 g-4">
                    <div class="carousel-item active">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(1);%>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(2); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(3); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_5.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <% prod = info.get(4); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(5); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(6); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(7); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <% prod = info.get(8); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(9); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(10); %>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" data-bs-target="#carrusel_deseos" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" data-bs-target="#carrusel_deseos" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
        
    <!-- INICIA BANNER DE ARTICULO DESTACABLES EN LA TIENDA-->
    <div class="containter-fuid py-5 my-4 bg-secondary p-2 text-dark bg-opacity-50">
        <div class="row row-cols-12 row-cols-md-12 g-12 d-flex justify-content-center">
            <div class="col-5">
                <div class="card mb-5 bg-light border-dark" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-6">
                            <img width='400' height='450' src="assets/productos/prod_4.png" class="card-img-top image-fluid" alt="..."">
                        </div>
                        <div class="col-md-6 d-flex">
                            <div class="row">
                                <div class="card-body">
                                    <div class="row d-flex justify-content-between">
                                        <div class="col-9">
                                            <h5 class="card-title">One Piece #27</h5>
                                        </div>
                                        <div class="col-3 d-flex justify-content-start">
                                            <a type="button" href="#">
                                                <span class="badge text-bg-light">
                                                    <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                    <p class="card-text">
                                        This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
                                    </p>
                                </div>
                                <div class="row d-flex align-items-end">
                                    <div class="mx-3 card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>                                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-5">
                <div class="card mb-5 border-dark bg-light" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-6">
                            <img width='400' height='450' src="assets/productos/prod_5.png" class="card-img-top image-fluid" alt="...">
                        </div>
                        <div class="col-md-6 d-flex">
                            <div class="row">
                                <div class="card-body">
                                    <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <h5 class="card-title">One Piece #27</h5>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                    </div>
                                    <p class="card-text">
                                        This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
                                    </p>
                                </div>
                                <div class="row d-flex align-items-end">
                                    <div class="mx-3 card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>                                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- TERMINA BANNER DE ARTICULO CUALQUIER-->
    
    <!--CARRUSEL DE PRODUCTOS MANGAS-->
        <div class="containter my-3 mx-1">
        <div class="row my-4 text-end">
            <div class="col-5">
                <ul class="list-group">
                    <li class="list-group-item active" aria-current="true">
                        <h2>Mangas</h2>
                    </li>
                </ul>        
            </div>
        </div>
        <%
            info.clear();
            //colocar condicion que no muestre mangas con stock igual a cero
            consulta = "SELECT idproducto as prod, productos.unidades, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip, TRUNCATE(SUM(comentarios.calificacion) / COUNT(comentarios.comentario),2) as promedio FROM productos INNER JOIN comentarios ON comentarios.productos_idproducto = productos.idproducto WHERE productos.categorias_idcategorias = 5 GROUP BY productos_idproducto ORDER BY COUNT(comentarios.comentario) DESC LIMIT 11;";
            info = conection_db.mas_deseados(consulta);
            prod = info.get(0);
        %>
        <div class="containter-fuid">
            <div id="carrusel_mangas" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
                <div class="carousel-inner row-cols-2 row-cols-md-4 g-4">
                    <div class="carousel-item active">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(1);%>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(2);%>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(3);%>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% prod = info.get(4);%>
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(5);%>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(6);%>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(7);%>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% prod = info.get(8);%>
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(9);%>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <% prod = info.get(10);%>      
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="..."></a>
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <a type="button" <% out.println("href='infoprod.jsp?id="+prod.getIdproducto()+"'"); %> ><strong><span class="card-title"><% out.println(prod.getName()); %></span></strong></a>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" <% out.println("href='carsave?id="+prod.getIdproducto()+"&opt=1'"); %> class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span><% out.println("$ "+prod.getPrecio()); %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" data-bs-target="#carrusel_mangas" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" data-bs-target="#carrusel_mangas" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <!--TERMINA CARRUSEL DE PRODUCTOS MANGAS-->
    
    <!--CARRUSEL DE PRODUCTOS COMICS-->
        <div class="containter my-3 mx-1">
        <div class="row my-4 text-end">
            <div class="col-5">
                <ul class="list-group">
                    <li class="list-group-item active" aria-current="true">
                        <h2>Comics</h2>
                    </li>
                </ul>        
            </div>
        </div>
        <%
            info.clear();
            consulta = "SELECT idproducto as prod, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip, TRUNCATE(SUM(comentarios.calificacion) / COUNT(comentarios.comentario),2) as promedio FROM productos INNER JOIN comentarios ON comentarios.productos_idproducto = productos.idproducto WHERE productos.categorias_idcategorias = 6 GROUP BY productos_idproducto ORDER BY COUNT(comentarios.comentario) DESC LIMIT 11;";
            info = conection_db.mas_deseados(consulta);
        %>
        <div class="containter-fuid">
            <div id="carrusel_comics" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
                <div class="carousel-inner row-cols-2 row-cols-md-4 g-4">
                    <div class="carousel-item active">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span>$19.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span>$19.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span>$19.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="carousel-item">
                        <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_1.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <span>$19.00</span>
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col d-flex justify-content-end">
                                <div class="card text-bg-light border-dark" style="width: 15rem;">
                                    <img width='200' height='250' src="assets/productos/prod_2.png" class="card-img-top image-fluid" alt="...">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <strong><span class="card-title">One Piece #27</span></strong>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" href="#">
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <a type="button" href="#" class="btn btn-warning">
                                            <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block"> <!--LOGO QUE FUNCION COMO BOTON-->
                                        </a>
                                        <span>$19.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" data-bs-target="#carrusel_comics" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" data-bs-target="#carrusel_comics" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!--TERMINA CARRUSEL DE PRODUCTOS COMICS-->
    </div>
</body>
</html>