<%-- 
    Document   : carrito
    Created on : 24 nov 2022, 18:15:31
    Author     : ksio
--%>

<%@page import="bd.conection_db"%>
<%@page import="objetos.infocarrito"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<infocarrito> info_car = new ArrayList();
    info_car = (ArrayList<infocarrito>) session.getAttribute("carrito");
    String[] user_info = new String[15];
    
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='direccion_envio.jsp'</script>");
    }
    
    session = request.getSession();
    if(session.getAttribute("carrito")!=null){
        if(session.getAttribute("idusuario") == null){
            out.println("<script>alert('Inicia sesión o registrate para poder continuar tu compra'); </script>");
            out.println("<script>window.location='login.jsp?opt=1'</script>");
        }else{
            conection_db con = new conection_db();
            user_info = con.datos_usuario(session.getAttribute("idusuario").toString());
        }
    }else{
        response.sendRedirect("index.jsp");
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fsociety - Dirección de envio</title>

        <script src="scrips/main.css"></script>
    </head>
    <body>

        <jsp:include page="auto/navegacion.jsp" flush="true"/>

        <!--FORMULARIO DE LA DIRECCION DE ENVIO-->
        <div class="container my-4">
            <div class="row d-flex justify-content-start">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-5 reg-color">
                    <div class="row p-2 text-end">
                        <ul class="list-group">
                            <li class="list-group-item active" style="background-color: #1e1e1e;" aria-current="true">
                                <h2>Dirección de envio</h2>
                            </li>
                        </ul>        
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-8 reg-color">
                    <form class="row g-3 needs-validation my-3 px-4 bg-light" method="POST" action="savedir" novalidate>
                    <div class="col-md-12"> <!--NOMBRE USUARIO-->
                        <label for="nombre" class="form-label">Nombre(s)</label>
                        <input type="text" class="form-control" name="nombre" id="nom" placeholder="Inserta tu nombre" <% out.println("value= '" + user_info[1]+"' "); %> value="" required>
                        <div class="invalid-feedback">
                            Inserta tu nombre
                        </div>
                    </div>
                    <div class="col-md-12"> <!--APELLIDOS USUARIO-->
                        <label for="apellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" name="apellidos" id="apellido" placeholder="Inserta tus apellidos" <% out.println("value= '" + user_info[2]+"' "); %> required>
                        <div class="invalid-feedback">
                            Inserta tus apellidos
                        </div>
                    </div>
                    <div class="col-md-12"> <!--NUMERO USUARIO-->
                        <label for="numero" class="form-label">Telefono</label>
                        <input type="number" max="9999999999" min="0" class="form-control" name="numero" placeholder="Inserta tu numero telefonico" <% out.println("value= '" + user_info[5]+"' "); %> id="num" required>
                        <div class="invalid-feedback">
                            No es un telefono valido
                        </div>
                    </div>
                    <div class="col-md-12"> <!--Calle-->
                        <label for="calle" class="form-label">Calle</label>
                        <input type="text" class="form-control" placeholder="Inserta la calle de tu residencia" <% out.println("value= '" + user_info[7]+"' "); %> id="calle" name="calle" required>
                        <div class="invalid-feedback">
                            Inserta tu calle
                        </div>
                    </div>
                    <div class="col-md-12"> <!--Num. Int-->
                        <label for="numint" class="form-label">Numero Interior</label>
                        <input type="text" class="form-control" id="pass1" placeholder="S/N Si no tienes numero o deja vacio el campo" name="numint" <% out.println("value= '" + user_info[11]+"' "); %>>
                    </div>
                    <div class="col-md-12"> <!--Num. Ext-->
                        <label for="numext" class="form-label">Numero Exterior</label>
                        <input type="text" class="form-control" id="pass1" name="numext" placeholder="S/N Si no tienes numero o deja vacio el campo" <% out.println("value= '" + user_info[12]+"' "); %> >
                    </div>
                    <div class="col-md-12"> <!--CP-->
                        <label for="cp" class="form-label">Codigo Postal</label>
                        <input type="number" max="99999" min="0" class="form-control" id="pass1" placeholder="Inserta tu codigo postal" <% out.println("value= '" + user_info[6]+"' "); %>name="cp" required>
                        <div class="invalid-feedback">
                            No es un codigo postal valido
                        </div>
                    </div>
                    <div class="col-md-12"> <!--Colonia-->
                        <label for="colonia" class="form-label">Colonia</label>
                        <input type="text" class="form-control" id="colonia" name="colonia" placeholder="Inserta tu colonia" <% out.println("value= '" + user_info[8]+"' "); %> required>
                        <div class="invalid-feedback">
                            Inserta tu colonia
                        </div>
                    </div>
                    <div class="col-md-12"> <!--MUNICIPIO-->
                        <label for="municipio" class="form-label">Municipio</label>
                        <input type="text" class="form-control" id="pass1" name="municipio" placeholder="Inserta tu ciudad" <% out.println("value= '" + user_info[13] + "' "); %> required>
                        <div class="invalid-feedback">
                            Inserta tu municipio
                        </div>
                    </div>
                    <div class="col-md-12"> <!--CIUDAD-->
                        <label for="ciudad" class="form-label">Ciudad</label>
                        <input type="text" class="form-control" id="pass1" name="ciudad" placeholder="Si no tienes ciudad puedes dejarlo vacio" <% out.println("value= '" + user_info[10]+"' "); %>>
                    </div>
                    <div class="col-md-12"> <!--ESTADO-->
                        <label for="cp" class="form-label">Estado</label>
                        <input type="text" class="form-control" id="pass1" name="estado" placeholder="Inserta tu estado" <% out.println("value= '" + user_info[9]+"' "); %> required>
                        <div class="invalid-feedback">
                            Inserta tu estado
                        </div>
                    </div>
                    <div class="col-md-12"> <!--REFERENCIAS-->
                        <label for="cp" class="form-label">Referencias</label>
                        <input type="text" class="form-control" id="pass1" name="referencia" placeholder="Inserta las referencias de tu domicilio" <% out.println("value= '" + user_info[14]+"' "); %> required>
                        <div class="invalid-feedback">
                            Inserta las referencias de tu domicilio
                        </div>
                    </div>
                    <div class="col-12 d-flex justify-content-end">
                        <button class="btn btn-warning" type="submit">Siguiente</button>
                    </div>
                </form>
                </div>

                <!--TABLA DE RESUMEN DE COMPRAS-->
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-4 py-5 reg-color align-self-start">
                    <ul class='list-group'>
                        <li class="list-group-item" style="background-color: #e3f2fd;">
                            <div class="d-flex justify-content-center">
                                <h4>Resumen del pedido</h4>
                            </div>
                        </li>
                        <%
                            double total_parcial = 0;
                            int bandera = 0;
                            session = request.getSession();
                            if (session.getAttribute("carrito") != null) {
                                for (infocarrito item : info_car) {
                                    total_parcial = item.getParcial() + total_parcial;
                                    out.println("<li class='list-group-item'>");
                                    out.println("<div class='card mb-3 bg-light' style='max-width: 940px;'>");
                                    out.println("<div class='row g-0'>");
                                    out.println("<div class='col-md-12'>");
                                    out.println("<div class='card-body'>");
                                    out.println("<div class='d-flex w-100 justify-content-start my-2'>");
                                    out.println("<img width='80' height='100' src='assets/productos/"+item.getImg()+"' class='image-fluid'>");
                                    out.println("<div class='d-flex w-100 align-items-start p-2'>");
                                    out.println("<small class='card-title'>" + item.getNombre() + "<br> $ " + item.getParcial() + " <br> Cant: " + item.getCantidad() + "</small>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</li>");
                                }
                                if (total_parcial <= 299) {
                                    bandera = 1;
                                }
                            } else {
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
