package servlet;

import bd.conection_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objetos.infocarrito;

public class metodoscarrito extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        java.sql.Statement stmt = null;
        java.sql.ResultSet resultado = null;
        ArrayList<infocarrito> array_info = new ArrayList();
        int bandera = 0;

        conection_db database = new conection_db();
        Connection con = database.conectar_db();

        String opcion = request.getParameter("opt");

        HttpSession session = request.getSession();
        if (session.getAttribute("carrito") == null) { //SI NO EXISTE LA VARIABLE DEL ARRAY, LO CREAMOS ENTONCES
            session.setAttribute("carrito", array_info);
        }
        array_info = (ArrayList<infocarrito>) session.getAttribute("carrito");
        String idproducto;
        String consulta;
        infocarrito obj_carrito;
        int cantidad= 0; 
        
        switch (opcion) {
            case "1":
                //METODO PARA AGREGAR AL CARRITO DESDE LA CARD
                idproducto = request.getParameter("id");
                consulta = "SELECT idproducto as id, nombreproducto as nombre, imagen as img, unidades as uni, precio FROM productos WHERE idproducto = " + idproducto + ";";
                //OBTENGO EL OBJETO SI EXISTE EL PRODUCTO
                obj_carrito = database.existencia_producto(consulta,1);
                if(obj_carrito.getUnidades() == 0){
                    request.setAttribute("mensaje", "Lo sentimos, el producto esta agotado");
                    request.getRequestDispatcher("infoprod.jsp?id="+obj_carrito.getIdprod()).forward(request, response);
                }else{
                    if (obj_carrito != null) {//SI ES NULO EL OBJETO NO EXISTE
                        //SI EXISTE ENTONCES BUSCO DENTRO DE EL SI YA EXISTE EL PRODUCTO EN EL CARRITO
                        if (array_info.size() >= 0) {

                            cantidad = 0;
                            int posicion = 0;
                            float parcial = 0;
                            float precio = 0;

                            for (infocarrito obj_array : array_info) {
                                if (obj_array.getIdprod().equals(obj_carrito.getIdprod())) {
                                    cantidad = obj_array.getCantidad();
                                    if(cantidad <= obj_array.getUnidades()){
                                        bandera = 1;
                                        cantidad = cantidad + 1;
                                        precio = obj_carrito.getUnitario();
                                        parcial = cantidad * precio;
                                        obj_carrito.setCantidad(cantidad);
                                        obj_carrito.setParcial(parcial);
                                        array_info.set(posicion, obj_carrito);
                                        break;
                                    }else{
                                        bandera = 1;
                                        break;
                                    }
                                }
                                posicion = posicion + 1;
                            }
                        } else {
                            array_info.add(obj_carrito);
                            session.setAttribute("carrito", array_info);
                        }

                        if (bandera == 0) {
                            array_info.add(obj_carrito);
                        }
                        response.sendRedirect("carrito.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                }
                break;
            case "2":
                //METODO PARA AGREGAR AL CARRITO DESDE LA INFORMACI??N DEL CARRITO
                idproducto = request.getParameter("id");
                cantidad = Integer.parseInt(request.getParameter("cantidad"));
                
                consulta = "SELECT idproducto as id, nombreproducto as nombre, imagen as img, unidades as uni, precio FROM productos WHERE idproducto = " + idproducto + ";";
                //OBTENGO EL OBJETO SI EXISTE EL PRODUCTO
                obj_carrito = database.existencia_producto(consulta,cantidad);
                if(obj_carrito.getUnidades() == 0){
                    request.setAttribute("mensaje", "Lo sentimos, el producto esta agotado");
                    request.getRequestDispatcher("infoprod.jsp?id="+obj_carrito.getIdprod()).forward(request, response);
                }else{
                    if (obj_carrito != null) {//SI ES NULO EL OBJETO NO EXISTE
                        //SI EXISTE ENTONCES BUSCO DENTRO DE EL SI YA EXISTE EL PRODUCTO EN EL CARRITO
                        if (array_info.size() >= 0) {

                            int posicion = 0;
                            float parcial = 0;
                            float precio = 0;

                            for (infocarrito obj_array : array_info) {
                                if (obj_array.getIdprod().equals(obj_carrito.getIdprod())) {
                                    if(cantidad <= obj_array.getUnidades()){
                                        bandera = 1;
                                        precio = obj_carrito.getUnitario();
                                        parcial = cantidad * precio;
                                        obj_carrito.setCantidad(cantidad);
                                        obj_carrito.setParcial(parcial);
                                        array_info.set(posicion, obj_carrito);
                                        break;
                                    }else{
                                        bandera = 1;
                                        break;
                                    }
                                }
                                posicion = posicion + 1;
                            }
                        } else {
                            array_info.add(obj_carrito);
                            session.setAttribute("carrito", array_info);
                        }

                        if (bandera == 0) {
                            array_info.add(obj_carrito);
                        }

                        response.sendRedirect("carrito.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                }
                break;
            case "3":
                //METODO PARA EL BOTON DE ELIMINAR UN OBJETO DEL CARRITO
                idproducto = request.getParameter("id");
                
                consulta = "SELECT idproducto as id, nombreproducto as nombre, imagen as img, unidades as uni, precio FROM productos WHERE idproducto = " + idproducto + ";";
                //OBTENGO EL OBJETO SI EXISTE EL PRODUCTO
                obj_carrito = database.existencia_producto(consulta,cantidad);
                if(obj_carrito.getUnidades() == 0){
                    request.getRequestDispatcher("infoprod.jsp?id="+obj_carrito.getIdprod()).forward(request, response);
                }else{
                    if (obj_carrito != null) {//SI ES NULO EL OBJETO NO EXISTE
                        //SI EXISTE ENTONCES BUSCO DENTRO DE EL SI YA EXISTE EL PRODUCTO EN EL CARRITO
                        if (array_info.size() >= 0) {

                            int posicion = 0;
                            float parcial = 0;
                            float precio = 0;

                            for (infocarrito obj_array : array_info) {
                                if (obj_array.getIdprod().equals(obj_carrito.getIdprod())) {
                                    array_info.remove(posicion);
                                    break;
                                }
                                posicion = posicion + 1;
                            }
                        }
                        if(array_info.isEmpty()){ //SI EL ARRAY DEL CARRITO ESTA VACIO, ENTONCES ELIMINIA LA VARIABLE DE CARRITO
                            session.removeAttribute("carrito");
                        }
                        response.sendRedirect("carrito.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                }
                break;
            case "4":
                session.removeAttribute("carrito");
                response.sendRedirect("carrito.jsp");
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(metodoscarrito.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodoscarrito.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(metodoscarrito.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodoscarrito.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}