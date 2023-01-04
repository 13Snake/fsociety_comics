<%-- 
    Document   : login
    Created on : 6 nov 2022, 18:39:25
    Author     : ksio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session = request.getSession();
    String opt = request.getParameter("opt");
    String idprod = request.getParameter("id");
    String msg = request.getParameter("msg");
    
    if(session.getAttribute("idusuario") != null){
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    if(opt.equals("2") && msg != null){
        request.setAttribute("mensaje", "Para insertar un comentario primero debes de inciar sesión");
    }
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='login.jsp?opt="+opt+"&id="+idprod+"'</script>");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fsociety-Iniciar Sesión o Registrarse</title>
</head>
<body>
    <jsp:include page="auto/navegacion.jsp" flush="true"/>

    <!--CODIGO DEL FORMULARIO DE REGISTRO-->
    <div class="container my-4">
            <div class="row d-flex justify-content-evenly">
            <div class="col-sm-12 col-md-6 col-lg-5 col-xl-6 py-3 reg-color">
                <h1>Registrarte</h1>
                <h8>Es facil y rapido</h8>
                <form class="row g-3 needs-validation my-3 px-4" method="POST" <% out.println("action='reg_session?opt="+opt+"'"); %> novalidate>
                    <div class="col-md-6"> <!--NOMBRE USUARIO-->
                        <label for="nombre" class="form-label">Nombre(s)</label>
                        <input type="text" class="form-control" name="nombre" id="nom" value="" required>
                        <div class="invalid-feedback">
                            No es un nombre valido
                        </div>
                        <div class="valid-feedback">
                            Nombre valido
                        </div>
                    </div>
                    <div class="col-md-6"> <!--APELLIDOS USUARIO-->
                        <label for="apellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" name="apellidos" id="apellido" value="" required>
                        <div class="invalid-feedback">
                            Apellidos invalidos
                        </div>
                        <div class="valid-feedback">
                            Apellido valido
                        </div>
                    </div>
                    <div class="col-md-6"> <!--CORREO USUARIO-->
                        <label for="correo" class="form-label">Correo Electronico</label>
                        <div class="input-group has-validation">
                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                            <input type="email" class="form-control" id="email" name="correo" aria-describedby="inputGroupPrepend" required>
                            <div class="invalid-feedback">
                                No es un correo valido
                            </div>
                            <div class="valid-feedback">
                                Correo Valido
                            </div>
                        </div>
                        </div>
                    <div class="col-md-6"> <!--NUMERO USUARIO-->
                        <label for="numero" class="form-label">Telefono</label>
                        <input type="number" max="9999999999" min="0000000000" class="form-control" name="numero" id="num" required>
                        <div class="invalid-feedback">
                            No es un telefono valido
                        </div>
                        <div class="valid-feedback">
                            Telefono valido
                        </div>
                    </div>
                    <div class="col-md-6"> <!--Contraseña 1-->
                        <label for="pass_1" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="pass1" name="pass_1" required>
                        <div class="invalid-feedback">
                            No es una contraseña valida
                        </div>
                        <div class="valid-feedback">
                            Contraseña valida
                        </div>
                    </div>
                    <div class="col-md-6"> <!--Contraseña 2-->
                        <label for="pass_2" class="form-label">Confirmar Contraseña</label>
                        <input type="password" class="form-control" id="pass2" name="pass_2" required>
                        <div class="invalid-feedback">
                            No es una contraseña valida
                        </div>
                        </div>
                    <div class="col-12"> <!--MOVIDA DE LOS TERMINOS Y CONDICIONES-->
                        <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                            <a href="#" target="_blank">Estoy deacuerdo con los terminos y condiciones</a>
                        </label>
                        <div class="invalid-feedback">
                            Debe seleccionar que esta deacuerdo con los terminos y condiciones
                        </div>
                        </div>
                    </div>
                    <div class="col-12 d-flex justify-content-end">
                        <button class="btn btn-warning" type="submit">Registrarse</button>
                    </div>
                </form>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-5 py-5 reg-color offset-1 align-self-center">
                <h1>Iniciar sesión</h1>
                <form class="row g-3 needs-validation px-5 "  method="POST" <% out.println("action='start_session?opt="+opt+"&id="+idprod+"'"); %> novalidate>
                    <div class="col-12 align-items-stretch align-self-center"> <!--CORREO DE INICIO DE SESION-->
                        <label for="email" class="form-label">Correo Electronico</label>
                        <input type="text" class="form-control" id="corre_inicio" name="email" value="" required>
                        <div class="invalid-feedback">
                            Correo Electronico invalido
                        </div>
                    </div>
                    <div class="col-12 align-self-center>"> <!--CONTRASEÑA INICIO-->
                        <label for="pass_ini" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="pass_inicio" name="pass_ini" value="" required>
                        <div class="invalid-feedback">
                            Contraseña invalida
                        </div>
                    </div>
                    <div class="col-12 d-flex justify-content-end py-3">
                        <button class="btn btn-success" type="submit">Iniciar Sesión</button>
                    </div>
                </form>
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
