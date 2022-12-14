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
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='index.jsp'</script>");
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
        <title>Fsociety-Inicio</title>
        <link rel="icon" href="../assets/icons/espada.ico">
    </head>
    <body>

        <jsp:include page="auto/navegacion.jsp" flush="true"/>

        <!--CARRUSEL DE IMAGENES-->
        <div class="containter my-1 mx-4">
            <div class="row">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="assets/carrusel/banner_2.png" height="300" class="d-block w-100 mx-auto d-block" alt="...">
                        </div>
                        <div class="carousel-item">
                            <a target="_blank" href="infoprod.jsp?id=75"><img src="assets/carrusel/OPCAL.png" title="Da click para ir al producto" height="300" class="d-block w-100 mx-auto d-block" alt="..."></a>
                        </div>
                        <div class="carousel-item">
                            <a target="_blank" href="infoprod.jsp?id=80"><img src="assets/carrusel/car12.png" title="Da click para ir al producto" height="300" class="d-block w-100 mx-auto d-block" alt="..."></a>
                        </div>
                        <div class="carousel-item">
                            <a target="_blank" href="infoprod.jsp?id=1"><img src="assets/carrusel/carrusel.png" title="Da click para ir al producto" height="300" class="d-block w-100 mx-auto d-block" alt="..."></a>
                        </div>
                        <div class="carousel-item">
                            <img src="assets/carrusel/banner_.png" height="300" class="d-block w-100 mx-auto d-block" alt="...">
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
            consulta = "SELECT productos_idproducto as prod, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip, SUM(ventas.unidades) as total, productos.unidades FROM ventas INNER JOIN productos ON ventas.productos_idproducto = productos.idproducto WHERE productos.unidades != 0 GROUP BY productos_idproducto ORDER BY SUM(ventas.unidades) DESC LIMIT 12;";
            info.clear();
            info = conection_db.mas_deseados(consulta);
            prod = info.get(0);
        %>
        <!--INICIA PRODUCTOS M�S VENDIDOS-->
        <div class="containter-fluid my-3 mx-1">
            <div class="row my-4 text-end">
                <div class="col-5">
                    <ul class="list-group">
                        <li class="list-group-item active" style="background-color: #1e1e1e;" aria-current="true">
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
                    <%
                        int limit = 0;
                        for (int x = 0; x < 3; x++) {
                            if (x == 0) {
                                out.println("<div class='carousel-item active'>");
                            } else {
                                out.println("<div class='carousel-item'>");
                            }
                            out.println("<div class='row row-cols-2 row-cols-md-4 g-4 px-5'>");
                            for (int y = limit; y < (limit + 4); y++) {
                                prod = info.get(y);
                                out.println("<div class='col-3 col d-flex justify-content-end'>");
                                out.println("<div class='card text-bg-light border-dark' style='width: 15rem;'>");
                                out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "'> <img width='200' height='250' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                                out.println("<div class='card-body'>");
                                out.println("<div class='row d-flex justify-content-between'>");
                                out.println("<div class='col-9'>");
                                out.println("<a type='button' href='infoprod.jsp?id="+prod.getIdproducto()+"' >"+prod.getName()+"</strong></a>");
                                out.println("</div>");
                                out.println("<div class='col-3 d-flex justify-content-start'>");
                                out.println("<a type='button' href='addwish?idprod=" + prod.getIdproducto() + "&opt=1'>");
                                out.println("<span class='badge text-bg-light'>");
                                out.println("<img src='assets/icons/hvacio.png' target='_blank' width='30' height='30' class='img-fluid txt_nav d-inline-block'>");
                                out.println("</span>");
                                out.println("</a>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("<div class='card-footer d-flex justify-content-between'>");
                                out.println("<span>$ " + prod.getPrecio() + "</span>");
                                out.println("<a type='button' href='carsave?id=" + prod.getIdproducto() + "&opt=1' class='btn btn-warning'>");
                                out.println("<img src='assets/icons/carro.png' alt='A�adir al carrito' width='20' height='20' class='img-fluid txt_nav d-inline-block'>");
                                out.println("</a>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                            }
                            out.println("</div>");
                            out.println("</div>");
                            limit = limit + 4;
                        }
                    %>
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
        <%
            consulta = "SELECT idproducto as prod, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip FROM productos WHERE idproducto = 137 OR idproducto = 121;";
            info.clear();
            info = conection_db.mas_deseados(consulta);
            prod = info.get(0);
        %>
        <div class="containter-fuid py-5 my-4 p-2 text-dark" style="background-color: grey">
            <div class="row row-cols-12 row-cols-md-12 g-12 d-flex justify-content-center">
                <div class="col-5">
                    <div class="card mb-5 bg-light border-dark" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-6">
                                <% 
                                    out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "'> <img width='400' height='450' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                                %>
                            </div>
                            <div class="col-md-6 d-flex">
                                <div class="row">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <h5 class="card-title"><% out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "' >" + prod.getName() + "</strong></a>"); %></h5>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" target="_blank" <% out.println("href='addwish?idprod=" + prod.getIdproducto() + "&opt=1'"); %> >
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block">
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="card-text txt_just">
                                            <% out.println(prod.getDescripcion()); %>
                                        </p>
                                    </div>
                                    <div class="row d-flex align-items-end">
                                        <div class="mx-3 card-footer d-flex justify-content-between">
                                            <span><% out.println("$ "+prod.getPrecio()); %></span>
                                            <% out.println("<a type='button' href='carsave?id=" + prod.getIdproducto() + "&opt=1' class='btn btn-warning'>"); %>
                                                <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block">
                                            </a>                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    prod = info.get(1);
                %>                            
                <div class="col-5">
                    <div class="card mb-5 bg-light border-dark" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-6">
                                <% 
                                    out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "'> <img width='400' height='450' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                                %>
                            </div>
                            <div class="col-md-6 d-flex">
                                <div class="row">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <h5 class="card-title"><% out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "' >" + prod.getName() + "</strong></a>"); %></h5>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" target="_blank" <% out.println("href='addwish?idprod=" + prod.getIdproducto() + "&opt=1'"); %> >
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block">
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="card-text txt_just">
                                            <% out.println(prod.getDescripcion()); %>
                                        </p>
                                    </div>
                                    <div class="row d-flex align-items-end">
                                        <div class="mx-3 card-footer d-flex justify-content-between">
                                            <span><% out.println("$ "+prod.getPrecio()); %></span>
                                            <% out.println("<a type='button' href='carsave?id=" + prod.getIdproducto() + "&opt=1' class='btn btn-warning'>"); %>
                                                <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block">
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
                        <li class="list-group-item active" style="background-color: #1e1e1e;" aria-current="true">
                            <h2>Más deseados por los usuarios</h2>
                        </li>
                    </ul>        
                </div>
            </div>
        </div>
        <%
            info.clear();
            consulta = "SELECT productos_idproducto as prod, productos.unidades as unidades, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip, COUNT(productos_idproducto) AS num_selec FROM listadeseos INNER JOIN productos ON listadeseos.productos_idproducto = productos.idproducto WHERE unidades != 0 GROUP BY listadeseos.productos_idproducto ORDER BY COUNT(listadeseos.usuarios_idusuario) DESC LIMIT 12;";
            info = conection_db.mas_deseados(consulta);
        %>
        <div class="containter-fuid">
            <div id="carrusel_deseados" class="carousel slide">
                <div class="carousel-inner row-cols-2 row-cols-md-4 g-4">
                    <%
                        limit = 0;
                        for (int x = 0; x < 3; x++) {
                            if (x == 0) {
                                out.println("<div class='carousel-item active'>");
                            } else {
                                out.println("<div class='carousel-item'>");
                            }
                            out.println("<div class='row row-cols-2 row-cols-md-4 g-4 px-5'>");
                            for (int y = limit; y < (limit + 4); y++) {
                                prod = info.get(y);
                                out.println("<div class='col-3 col d-flex justify-content-end'>");
                                out.println("<div class='card text-bg-light border-dark' style='width: 15rem;'>");
                                out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "'> <img width='200' height='250' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                                out.println("<div class='card-body'>");
                                out.println("<div class='row d-flex justify-content-between'>");
                                out.println("<div class='col-9'>");
                                out.println("<a type='button' href='infoprod.jsp?id="+prod.getIdproducto()+"' >"+prod.getName()+"</strong></a>");
                                out.println("</div>");
                                out.println("<div class='col-3 d-flex justify-content-start'>");
                                out.println("<a type='button' href='addwish?idprod=" + prod.getIdproducto() + "&opt=1'>");
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
                                out.println("<img src='assets/icons/carro.png' alt='A�adir al carrito' width='20' height='20' class='img-fluid txt_nav d-inline-block'>");
                                out.println("</a>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                            }
                            out.println("</div>");
                            out.println("</div>");
                            limit = limit + 4;
                        }
                    %>
                </div>
                <button class="carousel-control-prev" data-bs-target="#carrusel_deseados" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" data-bs-target="#carrusel_deseados" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <!-- INICIA BANNER DE ARTICULO DESTACABLES EN LA TIENDA-->
        <%
            consulta = "SELECT idproducto as prod, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip FROM productos WHERE idproducto = 46 OR idproducto = 112;";
            info.clear();
            info = conection_db.mas_deseados(consulta);
            prod = info.get(0);
        %>
        <div class="containter-fuid py-5 my-4 p-2 text-dark" style="background-color: grey">
            <div class="row row-cols-12 row-cols-md-12 g-12 d-flex justify-content-center">
                <div class="col-5">
                    <div class="card mb-5 bg-light border-dark" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-6">
                                <% 
                                    out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "'> <img width='400' height='450' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                                %>
                            </div>
                            <div class="col-md-6 d-flex">
                                <div class="row">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <h5 class="card-title"><% out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "' >" + prod.getName() + "</strong></a>"); %></h5>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" target="_blank" <% out.println("href='addwish?idprod=" + prod.getIdproducto() + "&opt=1'"); %> >
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block">
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="card-text txt_just">
                                            <% out.println(prod.getDescripcion()); %>
                                        </p>
                                    </div>
                                    <div class="row d-flex align-items-end">
                                        <div class="mx-3 card-footer d-flex justify-content-between">
                                            <span><% out.println("$ "+prod.getPrecio()); %></span>
                                            <% out.println("<a type='button' href='carsave?id=" + prod.getIdproducto() + "&opt=1' class='btn btn-warning'>"); %>
                                                <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block">
                                            </a>                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    prod = info.get(1);
                %>                            
                <div class="col-5">
                    <div class="card mb-5 bg-light border-dark" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-6">
                                <% 
                                    out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "'> <img width='400' height='450' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                                %>
                            </div>
                            <div class="col-md-6 d-flex">
                                <div class="row">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-between">
                                            <div class="col-9">
                                                <h5 class="card-title"><% out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "' >" + prod.getName() + "</strong></a>"); %></h5>
                                            </div>
                                            <div class="col-3 d-flex justify-content-start">
                                                <a type="button" target="_blank" <% out.println("href='addwish?idprod=" + prod.getIdproducto() + "&opt=1'"); %> >
                                                    <span class="badge text-bg-light">
                                                        <img src="assets/icons/hvacio.png" alt="" width="30" height="30" class="img-fluid txt_nav d-inline-block">
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="card-text txt_just">
                                            <% out.println(prod.getDescripcion()); %>
                                        </p>
                                    </div>
                                    <div class="row d-flex align-items-end">
                                        <div class="mx-3 card-footer d-flex justify-content-between">
                                            <span><% out.println("$ "+prod.getPrecio()); %></span>
                                            <% out.println("<a type='button' href='carsave?id=" + prod.getIdproducto() + "&opt=1' class='btn btn-warning'>"); %>
                                                <img src="assets/icons/carro.png" alt="A�adir al carrito" width="20" height="20" class="img-fluid txt_nav d-inline-block">
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
                        <li class="list-group-item active" style="background-color: #1e1e1e;" aria-current="true">
                            <h2>Mangas</h2>
                        </li>
                    </ul>        
                </div>
            </div>
        </div>
        <%
            info.clear();
            //colocar condicion que no muestre mangas con stock igual a cero
            consulta = "SELECT idproducto as prod, productos.unidades, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip, TRUNCATE(SUM(comentarios.calificacion) / COUNT(comentarios.comentario),2) as promedio FROM productos INNER JOIN comentarios ON comentarios.productos_idproducto = productos.idproducto WHERE productos.categorias_idcategorias = 5 AND productos.unidades != 0 GROUP BY productos_idproducto ORDER BY COUNT(comentarios.comentario) DESC LIMIT 12;";
            info = conection_db.mas_deseados(consulta);
        %>
        <div class="containter-fuid">
            <div id="carrusel_mangas" class="carousel slide">
                <div class="carousel-inner row-cols-2 row-cols-md-4 g-4">
                    <%
                        limit = 0;
                        for (int x = 0; x < 3; x++) {
                            if (x == 0) {
                                out.println("<div class='carousel-item active'>");
                            } else {
                                out.println("<div class='carousel-item'>");
                            }
                            out.println("<div class='row row-cols-2 row-cols-md-4 g-4 px-5'>");
                            for (int y = limit; y < (limit + 4); y++) {
                                prod = info.get(y);
                                out.println("<div class='col-3 col d-flex justify-content-end'>");
                                out.println("<div class='card text-bg-light border-dark' style='width: 15rem;'>");
                                out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "'> <img width='200' height='250' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                                out.println("<div class='card-body'>");
                                out.println("<div class='row d-flex justify-content-between'>");
                                out.println("<div class='col-9'>");
                                out.println("<a type='button' href='infoprod.jsp?id="+prod.getIdproducto()+"' >"+prod.getName()+"</strong></a>");
                                out.println("</div>");
                                out.println("<div class='col-3 d-flex justify-content-start'>");
                                out.println("<a type='button' href='addwish?idprod=" + prod.getIdproducto() + "&opt=1'>");
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
                                out.println("<img src='assets/icons/carro.png' alt='A�adir al carrito' width='20' height='20' class='img-fluid txt_nav d-inline-block'>");
                                out.println("</a>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                            }
                            out.println("</div>");
                            out.println("</div>");
                            limit = limit + 4;
                        }
                    %>
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
        <!--TERMINA CARRUSEL DE PRODUCTOS MANGAS-->

        <!--CARRUSEL DE PRODUCTOS COMICS-->
        <div class="containter my-3 mx-1">
            <div class="row my-4 text-end">
                <div class="col-5">
                    <ul class="list-group">
                        <li class="list-group-item active" style="background-color: #1e1e1e;" aria-current="true">
                            <h2>Comics</h2>
                        </li>
                    </ul>        
                </div>
            </div>
            <%
                info.clear();
                consulta = "SELECT idproducto as prod, imagen as img, nombreproducto as name, precio as preci, descripcionprod as descrip, unidades FROM productos WHERE productos.categorias_idcategorias = 6 GROUP BY prod ORDER BY COUNT(unidades) DESC LIMIT 12;";
                info = conection_db.mas_deseados(consulta);
            %>
            <div class="containter-fuid">
                <div id="carrusel_comics" class="carousel slide">
                    <div class="carousel-inner row-cols-2 row-cols-md-4 g-4">
                        <%
                            limit = 0;
                            for (int x = 0; x < 3; x++) {
                                if (x == 0) {
                                    out.println("<div class='carousel-item active'>");
                                } else {
                                    out.println("<div class='carousel-item'>");
                                }
                                out.println("<div class='row row-cols-2 row-cols-md-4 g-4 px-5'>");
                                for (int y = limit; y < (limit + 4); y++) {
                                    prod = info.get(y);
                                    out.println("<div class='col-3 col d-flex justify-content-end'>");
                                    out.println("<div class='card text-bg-light border-dark' style='width: 15rem;'>");
                                    out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "'> <img width='200' height='250' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                                    out.println("<div class='card-body'>");
                                    out.println("<div class='row d-flex justify-content-between'>");
                                    out.println("<div class='col-9'>");
                                    out.println("<a type='button' href='infoprod.jsp?id="+prod.getIdproducto()+"' >"+prod.getName()+"</strong></a>");
                                    out.println("</div>");
                                    out.println("<div class='col-3 d-flex justify-content-start'>");
                                    out.println("<a type='button' href='addwish?idprod=" + prod.getIdproducto() + "&opt=1'>");
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
                                    out.println("<img src='assets/icons/carro.png' alt='A�adir al carrito' width='20' height='20' class='img-fluid txt_nav d-inline-block'>");
                                    out.println("</a>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                                out.println("</div>");
                                out.println("</div>");
                                limit = limit + 4;
                            }
                        %>
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
    <div class="containter-fuid">
        <footer style="background-color: #e1d9d9;">
            <div class="d-flex justify-content-center">
                <span>Pagina realizada con fines educativos y sin fines de lucro</span>
            </div>
            <div class="d-flex justify-content-start">
                <span>Diseñadora de la pagina <img src="assets/icons/instagram.png" width="30" height="30" class="img-fluid txt_nav d-inline-block"> @lyly.rodez</span>
            </div>
        </footer>
    </div>
</html>