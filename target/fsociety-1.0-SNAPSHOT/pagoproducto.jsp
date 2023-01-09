<%-- 
    Document   : pagoproducto
    Created on : 1 dic 2022, 23:58:14
    Author     : ksio
--%>

<%@page import="bd.conection_db"%>
<%@page import="objetos.infocarrito"%>
<%@page import="objetos.productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetos.productos"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<infocarrito> info_car = new ArrayList();
    info_car = (ArrayList<infocarrito>) session.getAttribute("carrito");

    String[] user_info = new String[15];

    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='pagoproducto.jsp'</script>");
    }

    session = request.getSession();
    if (session.getAttribute("carrito") != null) {
        if (session.getAttribute("idusuario") == null) {
            out.println("<script>alert('Inicia sesión o registrate para poder continuar tu compra'); </script>");
            out.println("<script>window.location='login.jsp?opt=1'</script>");
        }
        conection_db con = new conection_db();
        user_info = con.datos_usuario(session.getAttribute("idusuario").toString());
    } else {
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
        <title>Fsociety - Pago del producto</title>
        <link rel="icon" href="../assets/icons/espada.ico">
        <script src="scrips/main.css"></script>
    </head>
    <body>
        <jsp:include page="auto/navegacion.jsp" flush="true"/>
        
        <!--FORMULARIO DE PAGO CON TARJETA-->
        <div class="container my-4">
            <div class="row d-flex justify-content-start">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-8 reg-color">
                    <div class="card mb-3 bg-light" style="max-width: 700px;">
                        <div class="row g-0">
                            <div class="col-md-8">
                                <div class="card-body">
                                    <strong><small class="card-title">Dirección de envio<br></small></strong>
                                            <%
                                                out.println("<small class='card-title'>" + user_info[1] + " " + user_info[2] + "<br>" + user_info[7] + ", " + user_info[11] + ", " + user_info[14] + ", " + user_info[8] + ",  " + user_info[10] + ", " + user_info[9] + ", " + user_info[6] + "<br> " + user_info[5] + "</small>");
                                            %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-5 reg-color">
                    <div class="row p-2 text-end">
                        <ul class="list-group">
                            <li class="list-group-item active" style="background-color: #1e1e1e;" aria-current="true">
                                <h2>Pago del producto</h2>
                            </li>
                        </ul>        
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-8 reg-color my-4">
                    <form class="row g-3 needs-validation bg-light" method="POST" action="checktarjet" novalidate>
                        <div class="col-md-12">
                            <label for="validationCustom01" class="form-label">Número de la tarjeta</label>
                            <input type="number" max="9999999999999999" min="0" placeholder="Inserta tu tarjeta de credito o debito" class="form-control" id="validationCustom01" name="tarjeta" value="" required>
                            <div class="invalid-feedback">
                                Inserte una tarjeta valida
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="validationCustom02" class="form-label">Nombre del Propietario</label>
                            <input type="text" class="form-control" id="validationCustom02" name="nombre" placeholder="Inserta el nombre del propietario" value="" required>
                            <div class="invalid-feedback">
                                Inserte un nombre valido
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="validationCustom03" class="form-label">Fecha de expiracion</label>
                            <input type="date" class="form-control" min="2022-12-31" name="fecha" id="validationCustom03" required>
                            <div class="invalid-feedback">
                                Inserte una fecha valida
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="validationCustom03" class="form-label">CVC</label>
                            <input type="number" min='0' max="999" class="form-control" placeholder="CVC" name="cvc" id="validationCustom03" required>
                            <div class="invalid-feedback">
                                Inserte una CVC valido
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                <label class="form-check-label" for="invalidCheck">
                                    <a href="#" >Estoy deacuerdo con los terminos y condiciones</a>
                                </label>
                                <div class="invalid-feedback">
                                    Debe seleccionar esta opcion para continuar
                                </div>
                            </div>
                        </div>
                        <div class="col-12 d-flex justify-content-end">
                            <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">Confirmar Pago</button>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #e3f2fd;">
                                            <h5 class="modal-title" id="exampleModalLabel">Ventana de confirmación</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body bg-light">
                                            ¿Estas seguro de concluir la compra?
                                        </div>
                                        <div class="modal-footer d-flex justify-content-evenly">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Regresar</button>
                                            <button class="btn btn-warning" type="submit">Confirmar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                    out.println("<img width='80' height='100' src='assets/productos/" + item.getImg() + "' class='image-fluid'>");
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