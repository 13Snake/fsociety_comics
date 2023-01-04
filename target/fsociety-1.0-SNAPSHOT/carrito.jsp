<%-- 
    Document   : carrito
    Created on : 24 nov 2022, 18:15:31
    Author     : ksio
--%>

<%@page import="objetos.infocarrito"%>
<%@page import="java.util.ArrayList"%>
<%
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='carrito.jsp'</script>");
    }

    String consulta;
    ArrayList<infocarrito> info_car = new ArrayList();
    info_car = (ArrayList<infocarrito>) session.getAttribute("carrito");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fsociety - Carrito de compras</title>

        <script src="scrips/main.css"></script>
    </head>
    <body>

        <jsp:include page="auto/navegacion.jsp" flush="true"/>
        
        <!--LISTA DE PRODUCTOS SELECCIONADOS-->
        <div class="container my-4">
            <div class="row d-flex justify-content-evenly">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-8 reg-color">
                    <h1>Tu carrito de compras</h1>
                    <ul class='list-group'>
                        <%
                            double total_parcial = 0;
                            int bandera = 0;
                            session = request.getSession();
                            if(session.getAttribute("carrito")!=null){
                                out.println("<div class='d-flex justify-content-end'>");
                                out.println("<a class='p-2 btn btn-danger' href='carsave?opt=4"+"'>Vaciar el carrito</a>");
                                out.println("</div>");
                                for(infocarrito item : info_car){
                                    total_parcial = item.getParcial()+total_parcial;
                                    out.println("<li class='list-group-item'>");
                                    out.println("<div class='card mb-3 bg-light' style='max-width: 940px;'>");
                                    out.println("<div class='row g-0'>");
                                    out.println("<div class='col-md-2'>");
                                    out.println("<div class='d-flex w-100 justify-content-center my-2'>");
                                    out.println("<a href='infoprod.jsp?id="+item.getIdprod()+"'><img width='80' height='100' src='assets/productos/"+item.getImg()+"' class='image-fluid'></a>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("<div class='col-md-10'>");
                                    out.println("<div class='card-body'>");
                                    out.println("<a href='infoprod.jsp?id="+item.getIdprod()+"'><strong><h8 class='card-title'>"+item.getNombre()+"</h8></strong></a>");
                                    out.println("<form class='row g-3 needs-validation py-2 d-flex justify-content-between'  method='POST' action='carsave?opt=2&id="+item.getIdprod()+"' novalidate>");
                                    out.println("<div class='col-3 align-self-center>'> <!--UNIDADES-->");
                                    out.println("<input type='number' max='"+item.getUnidades()+"' min='1' value='"+item.getCantidad()+"' class='form-control' name='cantidad' id='num' required> ");
                                    out.println("<div class='invalid-feedback'>");
                                    out.println("¡Solo hay "+item.getUnidades()+" unidades disponibles!");
                                    out.println("</div>");
                                    out.println("<div class='valid-feedback'>");
                                    out.println("¡Continuemos con la compra!");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("<div class='col-2 align-self-center>'> <!--BOTON ELIMINAR-->");
                                    out.println("<a class='btn' type='submit' href='carsave?id="+item.getIdprod()+"&opt=3'>");
                                    out.println("<img class='p-1' src='assets/icons/eliminar.png' alt='eliminar' width='30' height='30' class='img-fluid txt_nav d-inline-block'>");
                                    out.println("</a>");
                                    out.println("</div>");
                                    out.println("<div class='col-2 align-self-center>'> <!--PRECIO UNITARIO-->");
                                    out.println("Unidad "+item.getUnitario());
                                    out.println("</div>");
                                    out.println("<div class='col-2 align-self-center>'> <!--PRECIO PARCIAL-->");
                                    out.println("Parcial "+item.getParcial());
                                    out.println("</div>");
                                    out.println("</form>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</li>");
                                }
                                if(total_parcial <= 299){
                                    bandera =1;
                                }
                            }else{
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
                
                <!--TABLA DE PRECIO-->
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-4 py-5 reg-color align-self-center">
                    <ul class="list-group">
                        <li class="list-group-item" style="background-color: #e3f2fd;">
                            <div class="d-flex justify-content-center">
                                <h4>Resumen</h4>
                            </div>
                        </li>
                        <li class="list-group-item bg-light">
                            <div class="d-flex justify-content-start">
                                Total parcial
                            </div>
                            <div class="d-flex justify-content-end">
                                <% 
                                    out.println("<h6>$ "+total_parcial+"</h6>");
                                    if(bandera == 1){
                                        total_parcial = total_parcial+80;
                                    }
                                %>
                            </div>
                        </li>
                        <li class="list-group-item bg-light"> <!--SI SON MENOS DE 500 SE PAGA, SINO PUES NO XD-->
                            <div class="d-flex justify-content-start">
                                Costo de envio
                            </div>
                            <div class="d-flex justify-content-end">
                                <% 
                                    if(bandera == 1){
                                        out.println("<h6>$ 80.00</h6>");
                                    }else{
                                        out.println("<h6>$ 0.00</h6>");
                                    }
                                %>
                            </div>
                        </li>
                        <li class="list-group-item bg-light"> <!--SI SON MENOS DE 500 SE PAGA, SINO PUES NO XD-->
                            <div class="d-flex justify-content-start">
                                Total del pedido
                            </div>
                            <div class="d-flex justify-content-end text-success">
                                <% 
                                    out.println("<h6>$ "+total_parcial+"</h6>");
                                %>
                            </div>
                        </li>
                        <li class="list-group-item bg-light">
                            <div class="d-grid gap-2">
                                <% 
                                    if(total_parcial == 0){
                                        out.println("<a class='btn btn-warning disabled' role='button'>Terminar el pedido</a>");
                                    }else{
                                        out.println("<a class='btn btn-warning' href='direccion_envio.jsp' role='button'>Terminar el pedido</a>");
                                    }
                                %>
                            </div>
                        </li>
                        <li class="list-group-item bg-light">
                            <div class="d-grid gap-2">
                                <a class="btn btn-outline-primary" href="index.jsp" role="button">Seguir comprando</a>
                            </div>
                        </li>
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
