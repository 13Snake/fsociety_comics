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
        request.removeAttribute("mensaje");
        out.println("<script>window.location='miseguridad.jsp'</script>");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seguridad de la cuenta-Fsociety</title>
        <link rel="icon" href="../assets/icons/espada.ico">
    </head>
    <body>
    
        <jsp:include page="auto/navegacion.jsp" flush="true"/>

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

                        <a href="miseguridad.jsp" class="list-group-item list-group-item-action active" style="background-color: #1e1e1e;" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Seguridad</h5>
                            </div>
                            <p class="mb-1">Tu mismo decides como entrar a tu cuenta</p>
                            <small>Lo mas importante de tu cuenta</small>
                        </a>

                        <a href="mispedidos.jsp" class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Mis Pedidos</h5>
                            </div>
                            <p class="mb-1">Un gran viaje empieza por una buena compra</p>
                            <small class>¡Recuerda que no hay costo por cancelacion!</small>
                        </a>

                        <a href="lista_deseos.jsp" class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Lista de deseos</h5>
                            </div>
                            <p class="mb-1">Todo lo que te gusta, al alcance de un click</p>
                            <small class="text-muted">¡Gracias por confiar en Fsociety!</small>
                        </a>

                        <a href="miscomentarios.jsp" class="list-group-item list-group-item-action" aria-current="true">
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
                            <div class="accordion-item bg-light">

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
                                                <button class="btn btn-warning" type="submit">Editar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="accordion-item bg-light">

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
                                                <button class="btn btn-warning" type="submit">Desactivar cuenta</button>
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
