<%-- 
    Document   : infoprod
    Created on : 18 nov 2022, 00:18:50
    Author     : ksio
--%>

<%@page import="objetos.info_comentarios"%>
<%@page import="objetos.productoinfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="bd.conection_db"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String idbusqueda = request.getParameter("id");
    if (request.getAttribute("mensaje") != null) {
        out.println("<script>alert('" + request.getAttribute("mensaje") + "'); </script>");
        request.removeAttribute("mensaje");
        out.println("<script>window.location='infoprod.jsp?id="+idbusqueda+"'</script>");
    }

    String consulta;
    ArrayList<productoinfo> info = new ArrayList();
    productoinfo prod;

    consulta = "SELECT idproducto as id, nombreproducto as nombre, descripcionprod as descrip, precio, unidades, imagen as img, autores.autor as autor, aniopublicacion as anio, mespublicacion as mes, numeropaginas as paginas, editoriales.editorial as ed, colecciones.coleccion as colec, volumen FROM productos INNER JOIN autores ON productos.autores_idautor = autores.idautor INNER JOIN editoriales ON productos.editoriales_ideditorial = editoriales.ideditorial INNER JOIN colecciones ON productos.colecciones_idcoleccion = colecciones.idcoleccion WHERE productos.idproducto = " + idbusqueda + ";";
    info = conection_db.informacionprod(consulta);
    if (info.size() == 0) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    prod = info.get(0);
    
    String bt_nums = request.getParameter("pos");
    int posicion;
    int bandera = 0;
    if(bt_nums == null){
        posicion = 1;
    }else{
        posicion = Integer.parseInt(bt_nums);
        bandera = 1;
    }    
    
    ArrayList<info_comentarios> coments_users = conection_db.comentarios_users(prod.getId());
    int cantidad = coments_users.size();
    float nums_lista = cantidad/5;
    
    if(cantidad % 5 != 0){
        nums_lista = nums_lista+1;
    }
    
    if(posicion <= 0 || posicion > nums_lista && bandera == 1){
        out.println("<script>window.location='index.jsp'</script>");
    }
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fsociety - <% out.println(prod.getNombre()); %></title>
        <link rel="icon" href="../assets/icons/espada.ico">
        <!--CSS Y JS BOOTSTRAP-->
        <style>
            textarea{
                resize: none;
            }
        </style>
    </head>
    <body>

        <jsp:include page="auto/navegacion.jsp" flush="true"/>

        <div class="container my-4">
            <div class="row d-flex justify-content-evenly">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-5 reg-color bg-light">
                    <img width='400' height='550' <% out.println("src='assets/productos/"+prod.getImagen()+"'"); %> class="image-fluid" alt="producto">
                </div>

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 reg-color">
                    <div class="list-group">
                        <li class="list-group-item bg-light" aria-current="true" >
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1"><% out.println(prod.getNombre()); %></h5>
                                <% out.println("<a type='button' href='addwish?idprod="+prod.getId()+"&opt=1'>");%>
                                    <span class='badge text-bg-light'>
                                        <img src='assets/icons/hvacio.png' width='30' height='30' class='img-fluid txt_nav d-inline-block'>
                                    </span>
                                </a>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Sinopsis:</h5>
                            </div>
                            <div class="d-flex w-100 justify-content-start txt_just">
                                <p><% out.println(prod.getDescrip()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <p>$ <% out.println("" + prod.getPrecio()); %></p>
                                <p>Unidades disponibles: <% out.println("" + prod.getUnidades()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                                <%
                                    int calificacion = conection_db.calificacion_producto(prod.getId());
                                %>
                                <%
                                    if (calificacion != 0) {
                                        out.println("<div class='d-flex w-100 justify-content-center'>");
                                        out.println("<img src='assets/icons/cal_" + calificacion + ".png' width='250' class='img-fluid'>");
                                        out.println("</div>");
                                    } else if (calificacion == 0) {
                                        out.println("<div class='d-flex w-100 justify-content-evenly'>");
                                        out.println("<img src='assets/icons/espada_rota.png' alt='c1' width='70' class='img-fluid'>");
                                        out.println("</div>");
                                    }
                                %>
                        </li>
                        <!--COLOCAR SI HAY UNIDADES O NO, SINO NO MOSTRAR ESTE FOMRULARIO Y PONER UN AVISO DE QUE NO HAY-->
                        <li class="list-group-item bg-light" aria-current="true">
                            <%
                                if (prod.getUnidades() > 0) {
                                    out.println("<form class='row g-3 needs-validation px-5 justify-content-evenly'  method='POST' action='carsave?id=" + prod.getId() + "&opt=2'" + " novalidate>");
                                    out.println("<div class='col-6 align-self-center'> <!--UNIDADES-->");
                                    out.println("<input type='number' max='" + prod.getUnidades() + "' min='1' value='1' class='form-control' name='cantidad' id='num' required> ");
                                    out.println("<div class='invalid-feedback'>");
                                    out.println("Solo hay " + prod.getUnidades() + " unidades disponibles");
                                    out.println("</div>");
                                    out.println("<div class='valid-feedback'>");
                                    out.println("¡Continuemos con la compra!");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("<div class='col-6 align-self-center'>");
                                    out.println("<div class='col-12 d-flex justify-content-end py-3'>");
                                    out.println("<button class='btn btn-warning' type='submit'>");
                                    out.println("<img class='p-1' src='assets/icons/carro.png' alt='Añadir al carrito' width='30' height='30' class='img-fluid txt_nav d-inline-block'>");
                                    out.println("Agregar al carrito");
                                    out.println("</button>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</form>");
                                } else {
                                    out.println("<div class='d-flex justify-content-center'>");
                                    out.println("<a class='btn btn-danger' href='index.jsp' role='button'>Unidades terminadas, estamos trabajando para traer de vuelta este maravilloso titulo, pero ¡puedes ver más cosas en nuestra tienda!</a>");
                                    out.println("</div>");
                                }
                            %>

                        </li>
                    </div>
                </div>
            </div>
        </div>

        <!--TARJEAS DE INFORMACION DEL PRODUCTO-->
        <div class="container my-4">
            <div class="row d-flex justify-content-evenly">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-5 reg-color">
                    <div class="list-group bg-light">
                        <li class="list-group-item" style="background-color: #e3f2fd;" aria-current="true">
                            <div class="d-flex w-100 justify-content-center">
                                <h5 class="mb-1">Detalles del producto</h5><br>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Autor:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getAutor()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Año de publicación:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getAño()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Mes:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getMes()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Numero de paginas:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getPaginas()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Editorial:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getEd()); %></p>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Colección:</h6>
                            </div>
                            <div class="d-flex w-100 justify-content-start">
                                <p><% out.println(prod.getColec()); %></p>
                            </div>
                        </li>
                    </div>
                </div>
                
                <%
                    info_comentarios coments = null;
                    if(session.getAttribute("idusuario") != null){
                        coments = conection_db.check_comentario(session.getAttribute("idusuario").toString(), prod.getId());
                    }
                %>
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 reg-color">
                    <div class="list-group">
                        <li class="list-group-item" style="background-color: #e3f2fd;" aria-current="true">
                            <div class="d-flex w-100 justify-content-center">
                                <h5 class="mb-1">¡Deja tu comentario sobre el producto!</h5><br>
                            </div>
                        </li>
                        <li class="list-group-item bg-light" aria-current="true">
                            <form class="row g-3 needs-validation px-2"  method="POST" <% 
                                if (session.getAttribute("idusuario") == null) {
                                    out.println("action='login.jsp?opt=2&id="+prod.getId()+"&msg="+1+"'");
                                }else{
                                    out.println("action='coments?id="+prod.getId()+"'");
                                }
                            %> novalidate>
                                <div class="d-flex justify-content-end">
                                    <span class="text-muted"><% if(coments != null){out.println(coments.getFecha()+ " / " + coments.getHora());}%></span>
                                </div>
                                <div class="col-12 align-items-stretch align-self-center"> <!--comentario-->
                                    <div class="row d-flex justify-content-start">
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <input type="text" maxlength="100" name="coment" class="form-control" id="floating" placeholder="¡Coloca tu comentario aquí!" required value=<% if(coments != null){out.println("'"+coments.getComentario()+"'");} %>>
                                                <label for="floating">Tu comentario <% if(coments!=null){out.println(coments.getUser());} %></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="row d-flex justify-content-between">
                                        <span class="m-2">¡Califica el producto!</span>
                                        <div class="col-3 form-check">
                                            <input class="form-check-input" type="radio" name="calif" id="exampleRadios1" value="1" required <% if(coments != null){if(coments.getCalificacion().equals("1")){out.println("checked");}} %>>
                                            <label class="form-check-label" for="exampleRadios1"><img src='assets/icons/ca1.png' alt='c1' width='50' class='img-fluid'></label>
                                        </div>
                                        <div class="col-4 form-check">
                                            <input class="form-check-input" type="radio" name="calif" id="exampleRadios2" value="2" required <% if(coments != null){if(coments.getCalificacion().equals("2")){out.println("checked");}} %>>
                                            <label class="form-check-label" for="exampleRadios2"><img src='assets/icons/ca2.png' alt='c2' width="100" class='img-fluid'></label>
                                        </div>
                                        <div class="col-5 form-check">
                                            <input class="form-check-input" type="radio" name="calif" id="exampleRadios3" value="3" required <% if(coments != null){if(coments.getCalificacion().equals("3")){out.println("checked");}} %>>
                                            <label class="form-check-label" for="exampleRadios3"><img src='assets/icons/ca3.png' alt='c3' width="130" class='img-fluid'></label>
                                        </div>
                                        <div class="col-6 form-check d-flex justify-content-evenly py-4">
                                            <input class="form-check-input" type="radio" name="calif" id="exampleRadios4" value="4" required <% if(coments != null){if(coments.getCalificacion().equals("4")){out.println("checked");}} %>>
                                            <label class="form-check-label" for="exampleRadios4"><img src='assets/icons/ca4.png' alt='c4' width="160" class='img-fluid'></label>
                                        </div>
                                        <div class="col-6 form-check py-4">
                                            <input class="form-check-input" type="radio" name="calif" id="exampleRadios5" value="5" required <% if(coments != null){if(coments.getCalificacion().equals("5")){out.println("checked");}} %>>
                                            <label class="form-check-label" for="exampleRadios5"><img src='assets/icons/ca5.png' alt='c5' width="190" class='img-fluid'></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <span class="text-muted">¡Recuerda, el peso de tus palabras esta en la forma que las dices!</span>
                                </div>
                                <div class="col-4>">
                                    <div class="d-flex justify-content-end py-3">
                                        <%
                                            if(coments != null){
                                                out.println("<button value='1' name='eliminar' class='btn btn-danger m-2' type='submit'>Eliminar</button>");
                                                out.println("<button value='2' name='editar' class='btn btn-secondary m-2' type='submit'>Editar</button>");
                                                out.println("<button value='3' name='comentar' disabled class='btn btn-success m-2' type='submit'>Comentar</button>");
                                            }else{
                                                out.println("<button value='1' name='eliminar' class='btn btn-danger m-2 disabled' type='submit'>Eliminar</button>");
                                                out.println("<button value='2' name='editar' class='btn btn-secondary m-2 disabled' type='submit'>Editar</button>");
                                                out.println("<button value='3' name='comentar' class='btn btn-success m-2' type='submit'>Comentar</button>");
                                            }
                                        %>
                                    </div>
                                </div>
                            </form>
                        </li>
                    </div>
                </div>
            </div>
        </div>

        <div class="containter my-3 mx-1">
            <div class="row my-4 text-end">
                <div class="col-5">
                    <ul class="list-group">
                        <li class="list-group-item active" style="background-color: #1e1e1e;"  aria-current="true">
                            <h3>¡Comentarios de otros usuarios!</h3>
                        </li>
                    </ul>        
                </div>
            </div>
        </div>
        
        <%
            if(coments_users.isEmpty()){
                out.println("<div class='container my-2 bg-light'>");
                out.println("<div class='row d-flex justify-content-start'>");
                out.println("<div class='col-sm-12 col-md-6 col-lg-6 col-xl-12 reg-color'>");
                out.println("<div class='col-12 align-items-stretch align-self-evenly'>");
                out.println("<div class='row d-flex justify-content-start'>");
                out.println("<div class='col-9 py-4'>");
                out.println("<div class='form-floating'>");
                out.println("<input type='text' disabled class='form-control' id='floating1' value = 'No hay comentarios aun, ¡Se el primero en dejar uno!'>");
                out.println("<label for='floating1'>Comentarios vacios </label>");
                out.println("</div>");
                out.println("</div>");
                out.println("<div class='col-3 d-flex align-content-center py-4'>");
                out.println("<div class='d-flex w-100 justify-content-evenly'>");
                out.println("<img src='assets/icons/espada_rota.png' alt='c1' width='70' class='img-fluid'>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("<hr>");
                out.println("</div>");
                out.println("</div>");
            } else {
                    int fin = 0;
                    int inicio = (posicion * 5) - 5;
                    if ((inicio + 5) <= coments_users.size()) {
                        fin = inicio + 5;
                    } else {
                        fin = coments_users.size();
                    }
                    for (int x = inicio; x < fin; x++) {
                        info_comentarios com = coments_users.get(x);
                        out.println("<div class='container my-2 bg-light'>");
                        out.println("<div class='row d-flex justify-content-start'>");
                        out.println("<div class='col-sm-12 col-md-6 col-lg-6 col-xl-12 reg-color'>");
                        out.println("<div class='col-12 align-items-stretch align-self-evenly'>");
                        out.println("<div class='row d-flex justify-content-start'>");
                        out.println("<div class='col-9 py-4'>");
                        out.println("<div class='form-floating'>");
                        out.println("<input type='text' disabled class='form-control' id='floating1' value = '"+com.getComentario()+"'>");
                        out.println("<label for='floating1'>Comentario de "+com.getUser()+" </label>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("<div class='col-3 d-flex align-content-center py-4'>");
                        out.println("<img src='assets/icons/cal_"+com.getCalificacion()+".png' class='img-fluid'>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("<div class='d-flex justify-content-end py-1'>");
                        out.println("<span class='text-muted'>"+com.getFecha()+" / "+ com.getHora() +"</span>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("<hr>");
                        out.println("</div>");
                        out.println("</div>");
                    }

                }
        %>
        <div class="containter-fluid my-3">
            <div class="row my-4">
                <div class="col-12 d-flex justify-content-center">
                    <nav aria-label="...">
                        <ul class="pagination pagination-lg">
                            <%
                                if (nums_lista > 1 && !coments_users.isEmpty()) {
                                    for (int x = 1; x <= nums_lista; x++) {
                                        if (posicion == x) {
                                            out.println("<li class='page-item active' aria-current='page'>");
                                            out.println("<span class='page-link'>" + x + "</span>");
                                            out.println("</li>");
                                        } else {
                                            out.println("<li class='page-item'><a class='page-link' href='infoprod.jsp?id="+ idbusqueda +"&pos=" + x + "'>" + x + "</a></li>");
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
