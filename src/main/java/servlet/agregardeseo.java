/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import bd.conection_db;
import com.mysql.cj.util.StringUtils;
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
public class agregardeseo extends HttpServlet {

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
            
            
            //OBTENEMOS LA VARIABLE DE SESSION DEL USUARIO
            HttpSession session = request.getSession();
            
            String iduser = (String) session.getAttribute("idusuario");
            String idprod = request.getParameter("idprod");
            String opt = request.getParameter("opt");
            if(StringUtils.isNullOrEmpty(opt) == true){
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }else if(StringUtils.isNullOrEmpty(iduser) == true){
                request.setAttribute("mensaje", "Primero incia sesión para agregarlo a tu lista de deseos!");
                request.getRequestDispatcher("login.jsp?opt=3&id="+idprod).forward(request, response);
            }else{
                if(opt.equals("1")){
                    switch (conection_db.check_lista(idprod, iduser)) {
                    case 1:
                        request.setAttribute("mensaje", "El producto ya esta guardado en tu lista de deseos");
                        request.getRequestDispatcher("lista_deseos.jsp").forward(request, response);
                        break;
                    case 0:
                        String consulta = "INSERT INTO listadeseos VALUES ("+iduser+","+idprod+");";
                        if(conection_db.actualizar(consulta) == 1){
                            request.setAttribute("mensaje", "El producto ha sido agregado a tu lista de deseos");
                            request.getRequestDispatcher("lista_deseos.jsp").forward(request, response);
                        }
                        break;
                    default:
                        request.setAttribute("mensaje", "ERROR (AW): Intente de nuevo más tarde");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        break;
                    }
                }else if(opt.equals("2")){
                    switch (conection_db.check_lista(idprod, iduser)) {
                    case 1:
                        String consulta = "DELETE FROM `listadeseos` WHERE usuarios_idusuario="+iduser+" AND productos_idproducto="+idprod+";";
                        if(conection_db.actualizar(consulta) == 1){
                            request.setAttribute("mensaje", "Producto eliminado de tu lista de deseos");
                            request.getRequestDispatcher("lista_deseos.jsp").forward(request, response); 
                        }
                        break;
                    default:
                        request.setAttribute("mensaje", "ERROR (EW): Intente de nuevo más tarde");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        break;
                    }
                }else{
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
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
            Logger.getLogger(agregardeseo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(agregardeseo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(agregardeseo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(agregardeseo.class.getName()).log(Level.SEVERE, null, ex);
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
