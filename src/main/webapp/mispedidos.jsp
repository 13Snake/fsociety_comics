<%-- 
    Document   : mispedidos
    Created on : 15 dic 2022, 22:34:31
    Author     : ksio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bd.conection_db"%>
<%@page import="objetos.prodventa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session = request.getSession();
    if (session.getAttribute("idusuario") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='mispedidos.jsp'</script>");
    }
    String user = session.getAttribute("idusuario").toString();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis pedidos-Fsociety</title>

    </head>
    <body>
    
        <jsp:include page="auto/navegacion.jsp" flush="true"/>

        <div class="container">
            <!--LISTA DE BOTONES-->
            <div class="row d-flex justify-content-start">
                <div class="col-sm-12 col-md-4 col-lg-5 col-xl-6 py-4 reg-color">
                    <div class="list-group">

                        <a href="micuenta.jsp" class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Información Personal</h5>
                            </div>
                            <p class="mb-1">Todo lo que necesitamos para conocerte y darte nuestros servicios</p>
                            <small class="text-muted">Toda tu información esta protegida</small>
                        </a>

                        <a href="miseguridad.jsp" class="list-group-item list-group-item-action" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Seguridad</h5>
                            </div>
                            <p class="mb-1">Tu mismo decides como entrar a tu cuenta</p>
                            <small>Lo mas importante de tu cuenta</small>
                        </a>

                        <a href="mispedidos.jsp" class="list-group-item list-group-item-action active" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Mis pedidos</h5>
                            </div>
                            <p class="mb-1">Un gran viaje empieza por una buena compra</p>
                            <small class>¡Recuerda que no hay costo por cancelacion!</small>
                            <p class="mb-1">El ultimo pedido llega el: 00/00/0000</p>
                        </a>

                        <a href="lista_deseos.jsp" class="list-group-item list-group-item-action" aria-current="true">
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
                <div class='col-sm-12 col-md-4 col-lg-5 col-xl-6 py-4 reg-color'>
                <% 
                    ArrayList<prodventa> pedidos = conection_db.obtener_pedidos(user);
                    for(prodventa pro : pedidos){
                        String aux = pro.getId();
                        while(aux.equals(pro.getId())){
                            out.println("<div class='card mb-3' style='max-width: 540px;'>");
                            out.println("<div class='row g-0'>");
                            out.println("<div class='col-md-12'>");
                            out.println("<div class='card-body'>");
                            out.println("<h5 class='card-title'>Pedido del 00-00-0000 y llega el 00-00-0000</h5>");
                            out.println("<div class='accordion accordion-flush' id='z1'>");
                            out.println("<div class='accordion-item'>");
                            out.println("<h2 class='accordion-header' id='x1'>");
                            out.println("<button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#y1' aria-expanded='true' aria-controls='x1'>");
                            out.println("Productos comprados");
                            out.println("</button>");
                            out.println("</h2>");
                            out.println("<div id='y' class='accordion-collapse collapse' aria-labelledby='x1' data-bs-parent='#z1'>");
                            out.println("<div class='accordion-body'>");
                            out.println("<table class='table table-striped table-responsive'>");
                            out.println("<thead>");
                            out.println("<tr>");
                            out.println("<th scope='col'>Prod</th>");
                            out.println("<th scope='col'>Uni</th>");
                            out.println("<th scope='col'>Par</th>");
                            out.println("</tr>");
                            out.println("</thead>");
                            out.println("<tbody>");
                            out.println("<tr>");
                            out.println("<td>producto 1</td>");
                            out.println("<td>1</td>");
                            out.println("<td>$ 00.00</td>");
                            out.println("</tr>");
                            out.println("</tbody>");
                            out.println("</table>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("<div class='card-footer'>");
                            out.println("<small>TOTAL: $ 00.00</small>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                        }
                    }
                %>                                            
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
