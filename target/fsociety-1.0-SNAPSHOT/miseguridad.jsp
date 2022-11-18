<%-- 
    Document   : miseguridad
    Created on : 10 nov 2022, 00:48:53
    Author     : ksio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session = request.getSession();
    if (session.getAttribute("idusuario") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi cuenta-Fsociety</title>

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

        <div class="container">
            <!--LISTA DE BOTONES-->
            <div class="row d-flex justify-content-evenly">
                <div class="col-sm-12 col-md-4 col-lg-5 col-xl-6 py-4 reg-color">
                    <div class="list-group">

                        <a href="micuenta.jsp" class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Información Personal</h5>
                            </div>
                            <p class="mb-1">Todo lo que necesitamos para conocerte y darte nuestros servicios</p>
                            <small class="text-muted">Toda tu información esta protegida</small>
                        </a>

                        <a href="miseguridad.jsp" class="list-group-item list-group-item-action active" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Seguridad</h5>
                            </div>
                            <p class="mb-1">Tu mismo decides como entrar a tu cuenta</p>
                            <small>Lo mas importante de tu cuenta</small>
                        </a>

                        <a href="#" class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Mis pedidos</h5>
                                <!--<?php
                                    include 'php/conexiondb.php';
                                    $stmt = $dbh->prepare("SELECT Fecha_inicio FROM reservaciones WHERE F_IDUsuario=:id AND CURDATE()<Fecha_inicio LIMIT 1;");
                                    $stmt -> bindParam(':id',$_SESSION['data'][1]);
                                    $stmt -> execute();
                                    $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
                                    if(!empty($resultado)){
                                        echo "<small>El siguiente es: ".$resultado['Fecha_inicio']."</small>";
                                    }else{
                                        echo "<small>El siguiente es: Sin Viaje Agendado</small>";
                                    }
                                ?>-->
                            </div>
                            <p class="mb-1">Un gran viaje empieza por una buena compra</p>
                            <small class="text-muted">¡Recuerda que no hay costo por cancelacion!</small>
                        </a>

                        <a href="#" class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Lista de deseos</h5>
                            </div>
                            <p class="mb-1">Todo lo que te gusta, al alcance de un click</p>
                            <small class="text-muted">¡Gracias por confiar en Fsociety!</small>
                        </a>

                        <a href="#" class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Mis Comentarios</h5>
                            </div>
                            <p class="mb-1">Tu opinion tambien cuenta, revisa tus comentarios</p>
                            <small>Recuerda ser respetuoso</small>
                        </a>

                    </div>
                </div>

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 reg-color">
                    
                    <!--CONTRASEÑA-->
                    <div class="accordion my-4" id="accordionPanelsStayOpenExample">
                        <div class="accordion" id="accordionExample">
                            <!--Seguridad-->
                            <div class="accordion-item">

                                <!--EDITAR LA CONTRASEÑA-->
                                <h2 class="accordion-header" id="headingTwo">
                                    <button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#collapseOne' aria-expanded='true' aria-controls='collapseOne'>
                                        Cambiar contraseña <div class='col d-flex justify-content-end'><label>Recordar es de sabios</label></div> 
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">

                                        <form class="row g-3 needs-validation"  method="POST" action="modcuenta?opcion=5" novalidate> <!--USAMOS VARIABLE OPCION PARA EL PHP SIGUIENTE-->
                                            <div class="col-md-12">
                                                <label for="actual" class="form-label">Contraseña Actual</label>
                                                <input type="password" class="form-control" name="actual" id="validationCustom01" required>
                                                <div class="invalid-feedback">
                                                    Inserte una contraseña valida
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label for="nueva" class="form-label">Nueva contraseña</label>
                                                <input type="password" class="form-control" name="nueva" id="validationCustom02" required>
                                                <div class="invalid-feedback">
                                                    Inserte una contraseña valida
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-12">
                                                <label for="confirmacion" class="form-label">Confirmar contraseña</label>
                                                <input type="password" class="form-control" name="confirmacion" id="validationCustom02" required>
                                                <div class="invalid-feedback">
                                                    Inserte una contraseña valida
                                                </div>
                                            </div>
                                            
                                            <div class="col-12">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                                    <label class="form-check-label" for="invalidCheck">
                                                        Marca esta opción para continuar
                                                    </label>
                                                    <div class="invalid-feedback">
                                                        Debes marcar esta opción para continuar
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 d-flex justify-content-end">
                                                <button class="btn btn-primary" type="submit">Editar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="accordion-item">

                                <!--DESACTIVAR CUENTA-->
                                <h2 class="accordion-header" id="headingTwo">
                                    <button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#collapseSecond' aria-expanded='true' aria-controls='collapseOne'>
                                        Desactivar cuenta <div class='col d-flex justify-content-end'><label>La historia no es por ahi...</label></div> 
                                    </button>
                                </h2>
                                <div id="collapseSecond" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">

                                        <form class="row g-3 needs-validation"  method="POST" action="modcuenta?opcion=6" novalidate> <!--USAMOS VARIABLE OPCION PARA EL PHP SIGUIENTE-->
                                            <div class="col-md-12">
                                                <label for="confirmacion" class="form-label">Si estas seguro, escribe; "Estoy seguro de cerrar mi cuenta"</label>
                                                <input type="text" class="form-control" name="confirmacion" id="validationCustom01" required>
                                                <div class="invalid-feedback">
                                                    Inserte un dato valido
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-12">
                                                <label class="form-label text-danger">Recuerda, siempre puedes volver a revivir la historia, lamentamos tu partida</label>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                                    <label class="form-check-label" for="invalidCheck">
                                                        Marca esta opción para continuar
                                                    </label>
                                                    <div class="invalid-feedback">
                                                        Debes marcar esta opción para continuar
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 d-flex justify-content-end">
                                                <button class="btn btn-primary" type="submit">Desactivar cuenta</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
