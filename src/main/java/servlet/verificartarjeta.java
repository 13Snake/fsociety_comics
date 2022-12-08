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
public class verificartarjeta extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        conection_db database = new conection_db();
        
        //OBTENEMOS LA VARIABLE DE SESSION DEL USUARIO
        HttpSession session = request.getSession();
        String iduser = (String) session.getAttribute("idusuario");
        
        String num_tarjet = request.getParameter("tarjeta");
        String nombre = request.getParameter("nombre");
        String fecha_exp = request.getParameter("fecha");
        String cvc = request.getParameter("cvc");
        
        if(num_tarjet.length()==16){
            if(nombre != null){
                if(database.comprobar_vencimiento(fecha_exp) == 1){
                    if(cvc.length() == 3){
                        request.setAttribute("mensaje", "Tarjeta ingresada con exito");
                        out.println("<script>window.location='soldprod?tarj="+num_tarjet+"'</script>");
                    }else{
                        request.setAttribute("mensaje", "Inserte un cvc valido");
                        request.getRequestDispatcher("pagoproducto.jsp").forward(request, response);    
                    }
                }else{
                    request.setAttribute("mensaje", "La tarjeta ingresada ya expiro, intente con otra");
                    request.getRequestDispatcher("pagoproducto.jsp").forward(request, response);    
                }
            }else{
                request.setAttribute("mensaje", "Inserta tu nombre correctamente");
                request.getRequestDispatcher("pagoproducto.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("mensaje", "Inserta un numero de tarjeta valido");
            request.getRequestDispatcher("pagoproducto.jsp").forward(request, response);
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
            Logger.getLogger(verificartarjeta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(verificartarjeta.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(verificartarjeta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(verificartarjeta.class.getName()).log(Level.SEVERE, null, ex);
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
