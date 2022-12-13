<%-- 
    Document   : search
    Created on : 12 dic 2022, 22:29:21
    Author     : ksio
--%>

<%@page import="bd.conection_db"%>
<%@page import="objetos.productos"%>
<%@page import="objetos.productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetos.infocarrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
    String busqueda = request.getParameter("bus");
    String bt = request.getParameter("bt_search");
    if(bt == null || busqueda == null){
        out.println("<script>window.location='index.jsp'</script>");
    }
    ArrayList<productos> res_bus = conection_db.buscar_producto(busqueda);
    int cantidad = res_bus.size()+1;
%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″ />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fsociety-Busqueda</title>

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

                    <form class="col-7 d-flex mx-3" role="search" method="POST"  action="search.jsp">
                        <input class="form-control me-2" name="bus" type="search" placeholder="Busca tus productos aquí" aria-label="Search">
                        <button name="bt_search" value="1" class="btn btn-warning" type="submit">Buscar</button>
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
                                        out.println("<span class='badge text-bg-warning'>" + (info_car.size() + 1) + "</span>");
                                    } else {
                                        out.println("<img src='assets/icons/carro.png' alt='Carrito' width='35' height='25' class='img-fluid txt_nav d-inline-block'>");
                                    }
                                %>
                            </a>
                        </li>
                        <%
                            session = request.getSession();
                            if (session.getAttribute("idusuario") == null) {
                                out.println("<li class='nav-item mx-3'>");
                                out.println("<a class='nav-link' href='login.jsp?opt=0'><img src='assets/icons/sing.png' alt='Usuario' width='35' height='25' class='img-fluid txt_nav d-inline-block'> </a>");
                                out.println("</li>");
                            } else {
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

        <div class="containter-fluid my-3">
            <div class="row my-4 text-end">
                <div class="col-5">
                    <ul class="list-group">
                        <li class="list-group-item active" aria-current="true">
                            <h2>Resultados de tu busqueda</h2>
                        </li>
                    </ul>        
                </div>
            </div>
        </div>
        <div class="containter-fuid py-4">
            <div class="row row-cols-2 row-cols-md-4 g-4 px-5">
            <%
                for(productos prod : res_bus){
                    out.println("<div class='col-3 col d-flex justify-content-end'>");
                    out.println("<div class='card text-bg-light border-dark' style='width: 15rem;'>");
                    out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "' ><img width='200' height='250' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                    out.println("<div class='card-body'>");
                    out.println("<div class='row d-flex justify-content-between'>");
                    out.println("<div class='col-9'>");
                    out.println("<a type='button' href='infoprod.jsp?id="+prod.getIdproducto()+"' >"+prod.getName()+"</strong></a>");
                    out.println("</div>");
                    out.println("<div class='col-3 d-flex justify-content-start'>");
                    out.println("<a type='button' href='#'>");
                    out.println("<span class='badge text-bg-light'>");
                    out.println("<img src='assets/icons/hvacio.png' width='30' height='30' class='img-fluid txt_nav d-inline-block'>");
                    out.println("</span>");
                    out.println("</a>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("<div class='card-footer d-flex justify-content-between'>");
                    out.println("<span>$ " + prod.getPrecio() + "</span>");
                    out.println("<a type='button' href='carsave?id=" + prod.getIdproducto() + "&opt=1' class='btn btn-warning'>");
                    out.println("<img src='assets/icons/carro.png' alt='Añadir al carrito' width='20' height='20' class='img-fluid txt_nav d-inline-block'>");
                    out.println("</a>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                }
            %>
            </div>
        </div>
    </body>
</html>
