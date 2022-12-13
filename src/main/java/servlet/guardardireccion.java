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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ksio
 */
public class guardardireccion extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        conection_db database = new conection_db();
        Connection con = database.conectar_db();
        
        //OBTENEMOS LA VARIABLE DE SESSION DEL USUARIO
        HttpSession session = request.getSession();
        String iduser = (String) session.getAttribute("idusuario");
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellidos");
        String numero = request.getParameter("numero");
        String calle = request.getParameter("calle");
        String numint = request.getParameter("numint");
        String numext = request.getParameter("numext");
        String cp = request.getParameter("cp");
        String colonia = request.getParameter("colonia");
        String municipio = request.getParameter("municipio");
        String ciudad = request.getParameter("ciudad");
        String estado = request.getParameter("estado");
        String referencia = request.getParameter("referencia");
        
        if (numero.length() == 10) {
            if (numint.length() == 0) {
                numint = "S/N";
            }
            if (numext.length() == 0) {
                numext = "S/N";
            }
            if (cp.length() == 5) {
                if (ciudad.length() == 0) {
                    ciudad = "Sin ciudad";
                }
                String consulta = "UPDATE usuarios SET nombreuser='" + nombre + "',apellidosuser='" + apellido + "',telefono='" + numero + "',cp='" + cp + "',calle='" + calle + "',colonia='" + colonia + "',estado='" + estado + "',municipio='" + municipio + "',ciudad='" + ciudad + "',numint='" + numint + "',numext='" + numext + "',referencia='" + referencia + "' WHERE idusuario = " + iduser + " AND estadocuenta = 1;";
                if (conection_db.actualizar(consulta) == 1) {
                    con.close();
                    request.setAttribute("mensaje", "Tu dirección ha sido guardada");
                    request.getRequestDispatcher("pagoproducto.jsp").forward(request, response);
                } else {
                    con.close();
                    request.setAttribute("mensaje", "ERROR: INTENTE DE NUEVO MÁS TARDE");
                    request.getRequestDispatcher("direccion_envio.jsp").forward(request, response);
                }
            } else {
                con.close();
                request.setAttribute("mensaje", "Inserte un codigo postal valido");
                request.getRequestDispatcher("direccion_envio.jsp").forward(request, response);
            }
        } else {
            con.close();
            request.setAttribute("mensaje", "Inserte un numero telefonico valido");
            request.getRequestDispatcher("direccion_envio.jsp").forward(request, response);
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
            Logger.getLogger(guardardireccion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(guardardireccion.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(guardardireccion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(guardardireccion.class.getName()).log(Level.SEVERE, null, ex);
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
