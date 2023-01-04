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

        <script src="scrips/main.css"></script>
    </head>
    <body>

        <jsp:include page="auto/navegacion.jsp" flush="true"/>

                <!--TABLA DE RESUMEN DE COMPRAS-->
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-4 py-5 reg-color align-self-start">
                    <ul class='list-group'>
                        <li class="list-group-item" style="background-color: #e3f2fd;">
                            <div class="d-flex justify-content-center">
                                <h4>Resumen de la orden</h4>
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
                                    out.println("<img width='80' height='100' src='assets/productos/prod_2.png' class='image-fluid'>");
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