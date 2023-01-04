<%-- 
    Document   : navegacion
    Created on : 13 dic 2022, 23:48:43
    Author     : ksio
--%>
<%@page import="objetos.infocarrito"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<infocarrito> info_car = new ArrayList();
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='index.jsp'</script>");
    }
    if(session.getAttribute("carrito") != null){
        info_car = (ArrayList<infocarrito>) session.getAttribute("carrito");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--CSS Y JS BOOTSTRAP-->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/main.css">
        <script src="../scrips/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!--INICIA BARRA DE NAVEGACI�N-->
        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #56070c">
            <div class="container-fluid">
                <div class="col-2 d-flex justify-content-center">
                    <a class="navbar-brand" href="../index.jsp">
                        <img src="../assets/icons/logo_f2.png" width="130" class="img-fluid"> <!--LOGO QUE FUNCION COMO BOTON-->
                    </a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <form class="col-7 d-flex mx-3" role="search" method="POST"  action="search.jsp">
                        <input class="form-control me-2" name="bus" type="search" placeholder="Busca tus productos aquí" aria-label="Search">
                        <button class="btn btn-warning" type="submit">Buscar</button>
                    </form>

                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <a class="nav-link mx-3" href="../index.jsp">
                            <img src="../assets/icons/incio_bt.png" alt="Inicio" title="Inicio" width="35" height="25" class="img-fluid txt_nav d-inline-block">
                        </a>
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="../lista_deseos.jsp">
                                <img src="../assets/icons/lista_deseos.png" alt="Lista deseos" title="Lista de deseos" width="35" height="25" class="img-fluid txt_nav d-inline-block">
                            </a>
                        </li>
                        <li class="nav-item mx-3">
                            <a class="nav-link position-relative" href="../carrito.jsp">
                                <%
                                    if (session.getAttribute("carrito") != null) {
                                        out.println("<img src='../assets/icons/lleno.png' title='Tu carrito de compras' alt='Carrito' width='35' height='25' class='img-fluid txt_nav d-inline-block'>");
                                        out.println("<span class='badge text-bg-warning'>" + (info_car.size()) + "</span>");
                                    } else {
                                        out.println("<img src='../assets/icons/vacio.png' title='Tu carrito de compras' alt='Carrito' width='35' height='25' class='img-fluid txt_nav d-inline-block'>");
                                    }
                                %>
                            </a>
                        </li>
                        <%
                            session = request.getSession();
                            if (session.getAttribute("idusuario") == null) {
                                out.println("<li class='nav-item mx-3'>");
                                out.println("<a class='nav-link' href='../login.jsp?opt=0'><img src='../assets/icons/iniciar-sesion.png' title='Iniciar Sesión' alt='Usuario' width='35' height='25' class='img-fluid txt_nav d-inline-block'></a>");
                                out.println("</li>");
                            } else {
                                out.println("<li class='nav-item dropdown mx-3'>");
                                out.println("<a class='nav-link dropdown-toggle' href='#' role='button' data-bs-toggle='dropdown' title='Tu información' aria-expanded='false'><img src='../assets/icons/configuracion.png' alt='Usuario' width='35' height='25' class='img-fluid txt_nav d-inline-block'></a>");
                                out.println("<ul class='dropdown-menu'>");
                                out.println("<li><a class='dropdown-item' href='../micuenta.jsp'>Mi informaci�n</a></li>");
                                out.println("<li><a class='dropdown-item' href='../miseguridad.jsp'>Seguridad</a></li>");
                                out.println("<li><a class='dropdown-item' href='../mispedidos.jsp'>Mis pedidos</a></li>");
                                out.println("<li><a class='dropdown-item' href='../lista_deseos.jsp'>Lista de deseos</a></li>");
                                out.println("<li><a class='dropdown-item' href='../miscomentarios.jsp'>Mis comentarios</a></li>");
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
        <nav class="navbar navbar-expand-lg" style="background-color: #e1d9d9;">
            <div class="container-fluid">
                <div class="collapse navbar-collapse d-flex justify-content-evenly" id="navbarSupportedContent">
                    <div class="row">
                        <div class="col-3">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="search.jsp?bus=mangas">Mangas</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-3">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="search.jsp?bus=comics">Comics</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-3">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="search.jsp?bus=novelas">Novelas</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-3">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="search.jsp?bus=boxset">Boxset</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <!--TERMINA BARRA DE NAVEGACI�N-->
    </body>
</html>
