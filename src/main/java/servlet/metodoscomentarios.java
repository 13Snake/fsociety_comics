/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import bd.conection_db;
import java.io.IOException;
import java.io.PrintWriter;
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
public class metodoscomentarios extends HttpServlet {

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
        
        String eliminar = request.getParameter("eliminar");
        String editar = request.getParameter("editar");
        String comentar = request.getParameter("comentar");
        
        HttpSession session = request.getSession();
        String iduser = (String) session.getAttribute("idusuario");
        String idprod = request.getParameter("id");
        String coment = request.getParameter("coment");
        String calif = request.getParameter("calif");
        
        if(eliminar != null){
            if(conection_db.verificar_comentario(iduser, idprod) == 1)
            {
                if (conection_db.actualizar("DELETE FROM `comentarios` WHERE usuarios_idusuario = "+iduser+" and productos_idproducto = "+idprod+";") == 1) {
                    request.setAttribute("mensaje", "Comentario Eliminado");
                    request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
                } else {
                    request.setAttribute("mensaje", "ERROR (EC1): No se pudo eliminar el comentario, intente de nuevo más tarde");
                    request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
                }
            }else{
                request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
            }
        }else if(editar != null){
            if(conection_db.verificar_comentario(iduser, idprod) == 1)
            {
                if (conection_db.actualizar("UPDATE comentarios SET comentario = '" + coment + "', calificacion=" + calif + " WHERE usuarios_idusuario= " + iduser + " AND productos_idproducto=" + idprod + ";") == 1) {
                    request.setAttribute("mensaje", "Comentario Editado");
                    request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
                } else {
                    request.setAttribute("mensaje", "ERROR (EDC1): No se pudo Editar el comentario, intente de nuevo más tarde");
                    request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
                }
            }else{
                request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
            }
        }else if(comentar != null){
            if(conection_db.verificar_comentario(iduser, idprod) == 0)
            {
                if (conection_db.actualizar("INSERT INTO comentarios VALUES (null," + iduser + "," + idprod + ",'" + coment + "'," + calif + ",CURDATE(), CURTIME())") == 1) {
                    request.setAttribute("mensaje", "Gracias por tu comentario");
                    request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
                } else {
                    request.setAttribute("mensaje", "ERROR(MC1): No se pudo registrar el comentario, intente de nuevo más tarde");
                    request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
                }
            }else{
                request.getRequestDispatcher("infoprod.jsp?id=" + idprod).forward(request, response);
            }
        }else{
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
            Logger.getLogger(metodoscomentarios.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodoscomentarios.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(metodoscomentarios.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodoscomentarios.class.getName()).log(Level.SEVERE, null, ex);
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
