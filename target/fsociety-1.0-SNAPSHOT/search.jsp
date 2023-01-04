<%-- 
    Document   : search
    Created on : 12 dic 2022, 22:29:21
    Author     : ksio
--%>

<%@page import="bd.conection_db"%>
<%@page import="objetos.productos"%>
<%@page import="objetos.productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetos.infocarrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<%
    ArrayList<infocarrito> info_car = new ArrayList();
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='search.jsp'</script>");
    }

    String busqueda = request.getParameter("bus");
    String bt_nums = request.getParameter("pos");
    int posicion;
    int bandera = 0;
    if(bt_nums == null){
        posicion = 1;
    }else{
        posicion = Integer.parseInt(bt_nums);
        bandera = 1;
    }    
    
    ArrayList<productos> res_bus = conection_db.buscar_producto(busqueda);
    int cantidad = res_bus.size();
    float nums_lista = cantidad/8;
    
    if(cantidad % 8 != 0){
        nums_lista = nums_lista+1;
    }
    
    if(posicion > nums_lista && bandera == 1){
        out.println("<script>window.location='index.jsp'</script>");
    }
%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″ />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fsociety-Busqueda</title>

        <!--CSS Y JS BOOTSTRAP-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="scrips/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        
        <jsp:include page="auto/navegacion.jsp" flush="true"/>

        <div class="containter-fuid py-4">
            <%
                if(res_bus.isEmpty()){
                    out.println("<div class='row row-cols-12 row-cols-md-12 g-12 px-5'>");
                    out.println("<div class='card text-center'>");
                    out.println("<div class='card-header'>");
                    out.println("</div>");
                    out.println("<div class='card-body'>");
                    out.println("<h5 class='card-title'>¡Lo sentimos!</h5>");
                    out.println("<p class='card-text'>No encontramos lo que buscabas, trata de ser más especifico</p>");
                    out.println("<a href='index.jsp' class='btn btn-warning'>Volver al inicio</a>");
                    out.println("</div>");
                    out.println("<div class='card-footer text-muted'>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                }else{
                    out.println("<div class='containter-fluid my-3'>");
                    out.println("<div class='row my-4 text-end'>");
                    out.println("<div class='col-5'>");
                    out.println("<ul class='list-group'>");
                    out.println("<li class='list-group-item active' style='background-color: #1e1e1e;' aria-current='true'>");
                    out.println("<h2>Resultados de tu busqueda</h2>");
                    out.println("</li>");
                    out.println("</ul>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("<div class='row row-cols-2 row-cols-md-4 g-4 px-5'>");
                    int fin = 0;
                    int inicio = (posicion*8)-8;
                    if((inicio+8) <= res_bus.size()){
                        fin = inicio + 8;
                    }else{
                        fin = res_bus.size();
                    }
                    for(int x = inicio; x<fin; x++){
                        productos prod = res_bus.get(x);
                        out.println("<div class='col-3 col d-flex justify-content-end'>");
                        out.println("<div class='card text-bg-light border-dark' style='width: 15rem;'>");
                        out.println("<a type='button' href='infoprod.jsp?id=" + prod.getIdproducto() + "' ><img width='200' height='250' src='assets/productos/" + prod.getImagen() + "' class='card-img-top image-fluid'></a>");
                        out.println("<div class='card-body'>");
                        out.println("<div class='row d-flex justify-content-between'>");
                        out.println("<div class='col-9'>");
                        out.println("<a type='button' href='infoprod.jsp?id="+prod.getIdproducto()+"' >"+prod.getName()+"</strong></a>");
                        out.println("</div>");
                        out.println("<div class='col-3 d-flex justify-content-start'>");
                        out.println("<a type='button' href='#'>");
                        out.println("<span class='badge text-bg-light'>");
                        out.println("<img src='assets/icons/hvacio.png' width='30' height='30' class='img-fluid txt_nav d-inline-block'>");
                        out.println("</span>");
                        out.println("</a>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("<div class='card-footer d-flex justify-content-between'>");
                        out.println("<span>$ " + prod.getPrecio() + "</span>");
                        out.println("<a type='button' href='carsave?id=" + prod.getIdproducto() + "&opt=1' class='btn btn-warning'>");
                        out.println("<img src='assets/icons/carro.png' alt='Añadir al carrito' width='20' height='20' class='img-fluid txt_nav d-inline-block'>");
                        out.println("</a>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                    }
                    out.println("</div>");
                }
            %>
            
            <div class="containter-fluid my-3">
                <div class="row my-4">
                    <div class="col-12 d-flex justify-content-center">
                        <nav aria-label="...">
                            <ul class="pagination pagination-lg">
                                <%
                                    if (nums_lista > 1 && !res_bus.isEmpty()) {
                                        for (int x = 1; x <= nums_lista; x++) {
                                            if (posicion == x) {
                                                out.println("<li class='page-item active' aria-current='page'>");
                                                out.println("<span class='page-link'>" + x + "</span>");
                                                out.println("</li>");
                                            } else {
                                                out.println("<li class='page-item'><a class='page-link' href='search.jsp?bus=" + busqueda + "&pos=" + x + "'>" + x + "</a></li>");
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
    </body>
</html>
