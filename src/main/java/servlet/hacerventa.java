/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
/**
 *
 * @author ksio
 */
public class hacerventa extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        ArrayList<infocarrito> info_car = new ArrayList();
        java.sql.Statement stmt = null;
        java.sql.ResultSet resultado = null;
        
        conection_db database = new conection_db();
        Connection con = database.conectar_db();
        
        //OBTENEMOS LA VARIABLE DE SESSION DEL USUARIO
        HttpSession session = request.getSession();
        String iduser = (String) session.getAttribute("idusuario");
        String tarjeta = request.getParameter("tarj");
        info_car = (ArrayList<infocarrito>) session.getAttribute("carrito");
        
        String name = "";
        int id;
        
        if(tarjeta != null && tarjeta.length()==16 && !info_car.isEmpty()){
            int bandera = 1;
            String consulta = "SELECT MAX(id) as id_max FROM ventas;";
            stmt = con.createStatement();
            resultado = stmt.executeQuery(consulta);
            if(resultado.next()){
                id = resultado.getInt("id_max")+1;
                for(infocarrito obj : info_car){
                    consulta = "SELECT if(unidades>="+obj.getCantidad()+",1,0) as condicion FROM productos WHERE idproducto = "+obj.getIdprod()+";";
                    stmt = con.createStatement();
                    resultado = stmt.executeQuery(consulta);
                    resultado.next();
                    if(resultado.getInt("condicion")!=1){
                        bandera = 0;
                        name = obj.getNombre();
                        break;
                    }
                }
                if (bandera == 1) {
                    int bandera2 = 1;
                    for (infocarrito obj : info_car) {
                        consulta = "UPDATE productos SET unidades = unidades -" + obj.getCantidad() + " WHERE idproducto = " + obj.getIdprod()+";";
                        if (conection_db.actualizar(consulta) == 1) {
                            consulta = "INSERT INTO ventas VALUES (NULL," + iduser + "," + obj.getIdprod() + "," + id + "," + obj.getCantidad() + "," + obj.getParcial() + ",CURDATE(),CURTIME(),DATE_ADD(CURDATE(), INTERVAL 3 DAY),'" + tarjeta + "','0');";
                            if(conection_db.actualizar(consulta)!=1){
                                bandera2 = 0;
                                con.close();
                                request.setAttribute("mensaje", "ERROR: INTENTE DE NUEVO MÁS TARDE (ERROR.10UU)");
                                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                                break;
                            }
                        } else {
                            bandera2 = 0;
                            con.close();
                            request.setAttribute("mensaje", "ERROR: INTENTE DE NUEVO MÁS TARDE (ERROR.12IV)");
                            request.getRequestDispatcher("carrito.jsp").forward(request, response);
                            break;
                        }
                    }
                    if(bandera2 == 1){
                        con.close();
                        session.removeAttribute("carrito");
                        request.setAttribute("mensaje", "Tu venta ha sido realizada con exito");
                        request.getRequestDispatcher("micuenta.jsp").forward(request, response);
                    }
                }else if(bandera==0){
                    con.close();
                    request.setAttribute("mensaje","Lo sentimos, No hay existencias del producto '"+name+"' \nverifica tu compra");
                    request.getRequestDispatcher("carrito.jsp").forward(request, response);
                }
            }else{
                con.close();
                request.setAttribute("mensaje", "ERROR: INTENTE DE NUEVO MÁS TARDE (ERROR.13ID)");
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
            }
        }else{
            response.sendRedirect("index.jsp");
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
            Logger.getLogger(hacerventa.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(hacerventa.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(hacerventa.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(hacerventa.class.getName()).log(Level.SEVERE, null, ex);
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
