<%-- 
    Document   : mispedidos
    Created on : 15 dic 2022, 22:34:31
    Author     : ksio
--%>

<%@page import="objetos.tablapedidos"%>
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
    
    String bt_nums = request.getParameter("pos");
    int posicion;
    int bandera = 0;
    if(bt_nums == null){
        posicion = 1;
    }else{
        posicion = Integer.parseInt(bt_nums);
        bandera = 1;
    }    
    
    ArrayList<tablapedidos> num_pedidos = conection_db.numero_pedidos(user);
    int cantidad = num_pedidos.size();
    float nums_lista = cantidad/3;
    
    if(cantidad % 3 != 0){
        nums_lista = nums_lista+1;
    }
    
    if(posicion <= 0 || posicion > nums_lista && bandera == 1){
        out.println("<script>window.location='index.jsp'</script>");
    }
    
    //CONSULTA PARA QUE CAMBIE EL ESTADO DE ENVIO DEL PEDIDO SI YA HAN PASADO TRES DIAS DESPUES DE LA VENTA DEL PRODUCTO, COMO SIMULACION
    conection_db.actualizar("UPDATE ventas SET estadoventa = if(CURDATE()>=(fechallegada+3),'1','0') WHERE usuarios_idusuario = "+user+";");
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

                        <a href="mispedidos.jsp" class="list-group-item list-group-item-action active" style="background-color: #1e1e1e;" aria-current="true">
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
                
                <div class='col-sm-12 col-md-4 col-lg-5 col-xl-6 py-4 reg-color'>
                <% 
                    if(num_pedidos.isEmpty()){
                        out.println("<div class='row row-cols-12 row-cols-md-12 g-12 px-5'>");
                        out.println("<div class='card text-center'>");
                        out.println("<div class='card-header'>");
                        out.println("</div>");
                        out.println("<div class='card-body'>");
                        out.println("<h5 class='card-title'>¡Aun no tienes pedido realizados!</h5>");
                        out.println("<p class='card-text'>Corre y obten todas las historias que te interesen</p>");
                        out.println("<a href='index.jsp' class='btn btn-warning'>Volver al inicio</a>");
                        out.println("</div>");
                        out.println("<div class='card-footer text-muted'>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                    } else {
                        //Variables para los botones de los modals
                        int w = 0;
                        int y = 0;
                        int z = 0;
                        
                        int fin = 0;
                        int inicio = (posicion * 3) - 3;
                        if ((inicio + 3) <= num_pedidos.size()) {
                            fin = inicio + 3;
                        } else {
                            fin = num_pedidos.size();
                        }
                        for (int x = inicio; x < fin; x++) {
                            double total = 0;
                            String fecha_llegada = "";
                            String estado_venta = "";
                            String fecha_venta = "";
                            
                            tablapedidos prod_tabla = num_pedidos.get(x);
                            out.println("<div class='card mb-3' style='max-width: 540px;'>");
                            out.println("<div class='row g-0'>");
                            out.println("<div class='col-md-12'>");
                            out.println("<div class='card-body'>");
                            out.println("<strong><span class='card-title d-flex justify-content-center'>Pedido Num. "+(x+1)+"</span></strong>");
                            out.println("<div class='accordion accordion-flush' id='z"+z+"'>");
                            out.println("<div class='accordion-item'>");
                            out.println("<h2 class='accordion-header' id='x"+x+"'>");
                            out.println("<button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#y"+y+"' aria-expanded='true' aria-controls='x"+x+"'>");
                            out.println("Productos comprados");
                            out.println("</button>");
                            out.println("</h2>");
                            out.println("<div id='y"+y+"' class='accordion-collapse collapse' aria-labelledby='x"+x+"' data-bs-parent='#z"+z+"'>");
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
                            ArrayList<prodventa> pedidos = conection_db.obtener_pedidos(user,prod_tabla.getId());
                            for(prodventa pedido_tabla : pedidos){
                                out.println("<tr>");
                                out.println("<td>"+pedido_tabla.getName()+"</td>");
                                out.println("<td>"+pedido_tabla.getUnidades()+"</td>");
                                out.println("<td>$ "+pedido_tabla.getSubtotal()+"</td>");
                                out.println("</tr>");
                                total = total + pedido_tabla.getSubtotal();
                                fecha_llegada = pedido_tabla.getFechallegada();
                                estado_venta = pedido_tabla.getEstadoventa();
                                fecha_venta = pedido_tabla.getFechaventa();
                            }
                            out.println("</tbody>");
                            out.println("</table>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("<div class='card-footer'>");
                            out.println("<span class='d-flex justify-content-evenly'> <small>TOTAL: $ "+total+"</small>");
                            out.println("<small>Comprado el "+fecha_venta+"</small>");
                            if(estado_venta.equals("0")){
                                out.println("<small><strong>Llega el "+fecha_llegada+"</strong></small></span>");
                            }else{
                                out.println("Pedido Entregado</span>");
                            }
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            w = w+1;
                            y = y+1;
                            z = z+1;
                        }
                    }
                %>
                <div class="containter-fluid my-3">
                    <div class="row my-4">
                        <div class="col-12 d-flex justify-content-center">
                            <nav aria-label="...">
                                <ul class="pagination pagination-lg">
                                    <%
                                        if (nums_lista > 1 && !num_pedidos.isEmpty()) {
                                            for (int x = 1; x <= nums_lista; x++) {
                                                if (posicion == x) {
                                                    out.println("<li class='page-item active' aria-current='page'>");
                                                    out.println("<span class='page-link'>" + x + "</span>");
                                                    out.println("</li>");
                                                } else {
                                                    out.println("<li class='page-item'><a class='page-link' href='mispedidos.jsp?pos=" + x + "'>" + x + "</a></li>");
                                                    out.println("</li>");
                                                }
                                            }
                                        }
                                    %>
                                </ul>      
                            </nav>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </body>
</html>
