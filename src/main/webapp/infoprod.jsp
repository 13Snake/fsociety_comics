<%-- 
    Document   : infoprod
    Created on : 18 nov 2022, 00:18:50
    Author     : ksio
--%>

<%@page import="objetos.productoinfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="bd.conection_db"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='login.jsp'</script>");
    }

    String consulta;
    ArrayList<productoinfo> info = new ArrayList();
    productoinfo prod;

    String idbusqueda = request.getParameter("id");
    consulta = "SELECT idproducto as id, nombreproducto as nombre, descripcionprod as descrip, precio, unidades, imagen as img, autores.autor as autor, aniopublicacion as anio, mespublicacion as mes, numeropaginas as paginas, editoriales.editorial as ed, colecciones.coleccion as colec, volumen FROM productos INNER JOIN autores ON productos.autores_idautor = autores.idautor INNER JOIN editoriales ON productos.editoriales_ideditorial = editoriales.ideditorial INNER JOIN colecciones ON productos.colecciones_idcoleccion = colecciones.idcoleccion WHERE productos.idproducto = " + idbusqueda + ";";
    info = conection_db.informacionprod(consulta);
    if (info.size() == 0) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    prod = info.get(0);
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fsociety - <% out.println(prod.getNombre()); %></title>

        <!--CSS Y JS BOOTSTRAP-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="scrips/bootstrap.bundle.min.js"></script>
        <script src="scrips/main.css"></script>
        <style>
            textarea{
                resize: none;
            }
        </style>
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
                            <a class="nav-link position-relative" href="carrito.jsp">
                                <img src="assets/icons/full.png" alt="Carrito" width="35" height="25" class="img-fluid txt_nav d-inline-block"> 
                                <span class="badge text-bg-warning">1</span> <!--NUMERO DE PRODUCTOS EN EL CARRITO--->
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
                        <li class="list-group-item bg-light" aria-current="true" >
                            <div class="d-flex w-100 justify-content-start">
                                <h5 class="mb-1"><% out.println(prod.getNombre()); %></h5><br>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Sinopsis:</h5>
                            </div>
                            <div class="d-flex w-100 justify-content-start txt_just">
                                <p><% out.println(prod.getDescrip()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <p>$ <% out.println("" + prod.getPrecio()); %></p>
                                <p>Unidades disponibles: <% out.println("" + prod.getUnidades()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                                <%
                                    int calificacion = conection_db.calificacion_producto(prod.getId());
                                %>
                                <%
                                    if (calificacion != 0) {
                                        out.println("<p>¡Calificación segun los usuarios!</p>");
                                        out.println("<div class='d-flex w-100 justify-content-evenly'>");
                                        out.println("<img src='assets/icons/c" + calificacion + ".jpg' alt='c1' width='190' class='img-fluid'>");
                                        out.println("</div>");
                                    } else if (calificacion == 0) {
                                        out.println("<p>¡Aun sin calificación!</p>");
                                        out.println("<div class='d-flex w-100 justify-content-evenly'>");
                                        out.println("<img src='assets/icons/espada_rota.png' alt='c1' width='70' class='img-fluid'>");
                                        out.println("</div>");
                                    }
                                %>
                        </li>
                        <!--COLOCAR SI HAY UNIDADES O NO, SINO NO MOSTRAR ESTE FOMRULARIO Y PONER UN AVISO DE QUE NO HAY-->
                        <li class="list-group-item bg-light" aria-current="true">
                            <%
                                if (prod.getUnidades() > 0) {
                                    out.println("<form class='row g-3 needs-validation px-5 justify-content-evenly'  method='POST' action='carsave?id=" + prod.getId() + "&opt=2'" + " novalidate>");
                                    out.println("<div class='col-6 align-self-center'> <!--UNIDADES-->");
                                    out.println("<input type='number' max='" + prod.getUnidades() + "' min='1' value='1' class='form-control' name='cantidad' id='num' required> ");
                                    out.println("<div class='invalid-feedback'>");
                                    out.println("Solo hay " + prod.getUnidades() + " unidades disponibles");
                                    out.println("</div>");
                                    out.println("<div class='valid-feedback'>");
                                    out.println("¡Continuemos con la compra!");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("<div class='col-6 align-self-center'>");
                                    out.println("<div class='col-12 d-flex justify-content-end py-3'>");
                                    out.println("<button class='btn btn-warning' type='submit'>");
                                    out.println("<img class='p-1' src='assets/icons/carro.png' alt='Añadir al carrito' width='30' height='30' class='img-fluid txt_nav d-inline-block'>");
                                    out.println("Agregar al carrito");
                                    out.println("</button>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</form>");
                                } else {
                                    out.println("<div class='d-flex justify-content-center'>");
                                    out.println("<a class='btn btn-danger' role='button'>Unidades terminadas, estamos trabajando para rellenar stock, disculpe las molestias</a>");
                                    out.println("</div>");
                                }
                            %>

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
                        <li class="list-group-item" style="background-color: #e3f2fd;" aria-current="true">
                            <div class="d-flex w-100 justify-content-center">
                                <h5 class="mb-1">Detalles del producto</h5><br>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Autor:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getAutor()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Año de publicación:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getAño()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Mes:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getMes()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Numero de paginas:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getPaginas()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Editorial:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getEd()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Colección:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getColec()); %></p>
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


        <div class="containter my-3 mx-1">
            <div class="row my-4 text-end">
                <div class="col-5">
                    <ul class="list-group">
                        <li class="list-group-item active" aria-current="true">
                            <h3>¡Deja tu comentario sobre el producto!</h3>
                        </li>
                    </ul>        
                </div>
            </div>
        </div>
        <div class="container my-4">
            <div class="row d-flex justify-content-start">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-12 reg-color">
                    <form class="row g-3 needs-validation px-5 bg-light"  method="POST" action="#" <% //out.println("action='start_session?opt=" + opt + "'");%> novalidate>
                        <div class="d-flex justify-content-end">
                            <span class="text-muted">FECHA HORA</span>
                        </div>
                        <div class="col-12 align-items-stretch align-self-center"> <!--comentario-->
                            <div class="row d-flex justify-content-start">
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" name="comentario" placeholder="Deja un comentario para los demas usuarios" maxlength="150"  required  id="floatingTextarea2" style="height: 80px"></textarea>
                                        <label for="floatingTextarea2">Tu comentario</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="row d-flex justify-content-evenly">
                                <span class="m-3">¡Califica el producto!</span>
                                <div class="col-2 form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="c1" required>
                                    <label class="form-check-label" for="exampleRadios1"><img src='assets/icons/c1.jpg' alt='c1' width='50' class='img-fluid'></label>
                                </div>
                                <div class="col-2 form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="c2" required>
                                    <label class="form-check-label" for="exampleRadios2"><img src='assets/icons/c2.jpg' alt='c2' width="100" class='img-fluid'></label>
                                </div>
                                <div class="col-2 form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="c3" required>
                                    <label class="form-check-label" for="exampleRadios3"><img src='assets/icons/c3.jpg' alt='c3' width="130" class='img-fluid'></label>
                                </div>
                                <div class="col-3 form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios4" value="c4" required>
                                    <label class="form-check-label" for="exampleRadios4"><img src='assets/icons/c4.jpg' alt='c4' width="160" class='img-fluid'></label>
                                </div>
                                <div class="col-3 form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios5" value="c5" required>
                                    <label class="form-check-label" for="exampleRadios5"><img src='assets/icons/c5.jpg' alt='c5' width="190" class='img-fluid'></label>
                                </div>
                                <div class="invalid-feedback">
                                    Selecciona una calificación
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end">
                            <span class="text-muted">¡Recuerda, el peso de tus palabras esta en la forma que las dices!</span>
                        </div>
                        <div class="col-4>"> <!--CONTRASEÑA INICIO-->
                            <div class="d-flex justify-content-end py-3">
                                <button class="btn btn-danger m-2 disabled" type="submit">Eliminar</button>
                                <button class="btn btn-secondary m-2 disabled" type="submit">Editar</button>
                                <button class="btn btn-success m-2" type="submit">Comentar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="containter my-3 mx-1">
            <div class="row my-4 text-end">
                <div class="col-5">
                    <ul class="list-group">
                        <li class="list-group-item active" aria-current="true">
                            <h3>¡Comentarios de otros usuarios!</h3>
                        </li>
                    </ul>        
                </div>
            </div>
        </div>
        <div class="container my-4 bg-light">
            <div class="row d-flex justify-content-start">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-12 reg-color">
                    <div class="col-12 align-items-stretch align-self-evenly"> <!--comentario-->
                        <div class="row d-flex justify-content-start">
                            <div class="col-9 py-4">
                                <div class="form-floating">
                                    <textarea class="form-control" maxlength="150" readonly id="floatingTextarea1" style="height: 80px"></textarea>
                                    <label for="floatingTextarea1">Comentario de </label>
                                </div>
                            </div>
                            <div class="col-3 d-flex align-content-center py-4">
                                <img src='assets/icons/c5.jpg' alt='c5' height="60" width="250" class='img-fluid'>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end py-1">
                        <span class="text-muted">FECHA HORA</span>
                    </div>
                </div>
            </div>
            <hr>
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
