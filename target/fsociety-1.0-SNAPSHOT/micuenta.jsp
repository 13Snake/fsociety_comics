<%-- 
    Document   : micuenta
    Created on : 9 nov 2022, 23:16:46
    Author     : ksio
--%>

<%@page import="bd.conection_db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session = request.getSession();
    if (session.getAttribute("idusuario") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='micuenta.jsp'</script>");
    }
    conection_db database = new conection_db();
    String[] user_info = new String[15];
    user_info = database.datos_usuario(session.getAttribute("idusuario").toString()); //OBTENIENDO DATOS DEL USUARIO 
%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi cuenta-Fsociety</title>

    </head>
    <body>
        
        <jsp:include page="auto/navegacion.jsp" flush="true"/>

        <div class="container">
            <!--LISTA DE BOTONES-->
            <div class="row d-flex justify-content-evenly">
                <div class="col-sm-12 col-md-4 col-lg-5 col-xl-6 py-4 reg-color">
                    <div class="list-group">

                        <a href="micuenta.jsp" class="list-group-item list-group-item-action active" style="background-color: #1e1e1e;" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Información Personal</h5>
                            </div>
                            <p class="mb-1">Todo lo que necesitamos para conocerte y darte nuestros servicios</p>
                            <small class="text">Toda tu información esta protegida</small>
                        </a>

                        <a href="miseguridad.jsp" class="list-group-item list-group-item-action" aria-current="true">
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
                    <!--PANEL DE información PERSONAL-->
                    <div class="accordion my-4" id="accordionPanelsStayOpenExample">
                        <div class="accordion" id="accordionExample">
                            <!--NOMBRE DEL CLIENTE-->
                            <div class="accordion-item">

                                <!--EDITAR EL NOMBRE-->
                                <h2 class="accordion-header" id="headingTwo">
                                    <% 
                                        String nombre = user_info[1]+" "+user_info[2];
                                    %>
                                    <button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#collapseOne' aria-expanded='true' aria-controls='collapseOne'>
                                        Nombre <div class='col d-flex justify-content-end'><label><% out.println(nombre); %></label></div> 
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body bg-light">

                                        <form class="row g-3 needs-validation"  method="POST" action="modcuenta?opcion=1" novalidate> <!--USAMOS VARIABLE OPCION PARA EL PHP SIGUIENTE-->
                                            <div class="col-md-6">
                                                <label for="nombre" class="form-label">Nombre(s)</label>
                                                <input type="text" class="form-control" name="nombre" id="validationCustom01" <% out.println("value= '" + user_info[1]+"' "); %> required>
                                                <div class="invalid-feedback">
                                                    Inserte un nombre valido
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="apellidos" class="form-label">Apellidos</label>
                                                <input type="text" class="form-control" name="apellidos" id="validationCustom02" <% out.println("value= '" + user_info[2]+"' "); %> required>
                                                <div class="invalid-feedback">
                                                    Inserte un apellido valido
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

                            <!--EDITAR EL CORREO ELECTRONICO-->
                            <div class="accordion-item bg-light">
                                <h2 class="accordion-header" id="headingTwo">
                                    <button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#collapseTwo' aria-expanded='true' aria-controls='collapseOne'>
                                        Correo Electrónico <div class='col d-flex justify-content-end'><label> <% out.println(user_info[3]); %></label></div> 
                                    </button>
                                </h2>
                                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <form class="row g-3 needs-validation"  method="POST" action="modcuenta?opcion=2" novalidate> <!--USAMOS VARIABLE OPCION PARA EL PHP SIGUIENTE-->
                                            <div class="col-md-8">
                                                <label for="email" class="form-label">Correo Electrónico</label>
                                                <input type="email" class="form-control" name="email" id="validationCustom01" <% out.println("value= '" + user_info[3]+"' "); %> required>
                                                <div class="invalid-feedback">
                                                    Inserte un correo Electrónico valido
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
                                                <button class="btn btn-warning " type="submit">Editar</button> <!--AQUI VA EL PHP PARA EDITAR EL NOMBRE-->
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!--EDITAR Número TELEFONICO-->
                            <div class="accordion-item bg-light">
                                <h2 class="accordion-header" id="headingThree">
                                      <button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#collapseThree' aria-expanded='true' aria-controls='collapseOne'>
                                      Número Telefonico <div class='col d-flex justify-content-end'><label> <% out.println(user_info[5]); %> </label></div> 
                                      </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <form class="row g-3 needs-validation"  method="POST" action="modcuenta?opcion=3" novalidate> <!--USAMOS VARIABLE OPCION PARA EL PHP SIGUIENTE-->
                                            <div class="col-md-8">
                                                <label for="telefono" class="form-label">NúmeroTelefonico</label>
                                                <input type="number" max="9999999999" min="0000000000" class="form-control" name="telefono" id="validationCustom01" <% out.println("value= '" + user_info[5]+"' "); %> required>
                                                <div class="invalid-feedback">
                                                    Inserte un número telefonico valido
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
                                                <button class="btn btn-warning " type="submit">Editar</button> <!--AQUI VA EL PHP PARA EDITAR EL NOMBRE-->
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                            <!--EDITAR DIRECCION-->
                            <div class="accordion-item bg-light">
                                <h2 class="accordion-header" id="headingThree">
                                      <%
                                        //METODO PARA REVISAR SI EXISTE UNA DIRECCION O SI SE DEBE DE QUITAR EL NULL DE LAS VARIABLES
                                        String direccion;
                                        if(user_info[7] == null || user_info[7].equals("")){
                                            direccion = "Sin direccion registrada";
                                            for(int x = 6; x<15; x++){
                                                user_info[x] = "";
                                          }
                                        }else{
                                          direccion = user_info[7]+", "+user_info[13]+", "+user_info[9]; 
                                        }
                                      %>
                                      <button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#collapseFour' aria-expanded='true' aria-controls='collapseOne'>
                                      Dirección <div class='col d-flex justify-content-end'><label><% if(direccion.length()>55){out.println(direccion.substring(0,55)+"...");}else{out.println(direccion);}%></label></div> 
                                      </button>
                                </h2>
                                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <form class="row g-3 needs-validation"  method="POST" action="modcuenta?opcion=4" novalidate> <!--USAMOS VARIABLE OPCION PARA EL PHP SIGUIENTE-->
                                            <div class="col-md-3">
                                                <label for="cp" class="form-label">CP</label>
                                                <input type="number" max="99999" min="00001" class="form-control" name="cp" id="validationCustom01" required <% out.println("value= '" + user_info[6]+"' "); %>>
                                                <div class="invalid-feedback">
                                                    Inserte un codigo postal valido
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-5">
                                                <label for="calle" class="form-label">Calle</label>
                                                <input type="text" class="form-control" name="calle" id="validationCustom02" required <% out.println("value= '" + user_info[7]+"' "); %> >
                                                <div class="invalid-feedback">
                                                    Inserte una calle valida
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <label for="colonia" class="form-label">Colonia</label>
                                                <input type="text" class="form-control" name="colonia" id="validationCustom02" required <% out.println("value= '" + user_info[8]+"' "); %>>
                                                <div class="invalid-feedback">
                                                    Inserte una colonia valida
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <label for="estado" class="form-label">Estado</label>
                                                <input type="text" class="form-control" name="estado" id="validationCustom02" required <% out.println("value= '" + user_info[9]+"' "); %> >
                                                <div class="invalid-feedback">
                                                    Inserte un estado valido
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <label for="ciudad" class="form-label">Ciudad</label>
                                                <input type="text" class="form-control" name="ciudad" id="validationCustom02" required <% out.println("value= '" + user_info[10]+"' "); %>>
                                                <div class="invalid-feedback">
                                                    Inserte una ciudad valida
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <label for="municipio" class="form-label">Municipio</label>
                                                <input type="text" class="form-control" name="municipio" id="validationCustom02" required <% out.println("value= '" + user_info[13]+"' "); %>>
                                                <div class="invalid-feedback">
                                                    Inserte un dato valido
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <label for="numint" class="form-label">Num. Interior</label>
                                                <input type="text" class="form-control" name="numint" value="S/N" id="validationCustom02" required <% out.println("value= '" + user_info[11]+"' "); %> >
                                                <div class="invalid-feedback">
                                                    Inserte un dato valido
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <label for="numext" class="form-label">Numero Exterior</label>
                                                <input type="text" class="form-control" name="numext" value="S/N" id="validationCustom02" required <% out.println("value= '" + user_info[12]+"' "); %> >
                                                <div class="invalid-feedback">
                                                    Inserte un dato valido
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-12">
                                                <label for="referes" class="form-label">Referencias</label>
                                                <input type="text" class="form-control" name="referes" id="validationCustom02" required <% out.println("value= '" + user_info[14]+"' "); %> >
                                                <div class="invalid-feedback">
                                                    Inserte un dato valido
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
                                                <button class="btn btn-warning " type="submit">Editar</button> <!--AQUI VA EL PHP PARA EDITAR EL NOMBRE-->
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
