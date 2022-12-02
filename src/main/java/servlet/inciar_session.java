/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import bd.conection_db;
import static bd.conection_db.conectar_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ksio
 * 
 */
public class inciar_session extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        java.sql.Statement stmt = null;
        java.sql.ResultSet resultado = null;
        
        String correo = request.getParameter("email");
        String password = request.getParameter("pass_ini");
        String opt = request.getParameter("opt");
        
        conection_db database = new conection_db();
        
        Connection con = database.conectar_db();
        
        String consulta = "SELECT correouser, nombreuser, password, idusuario, estadocuenta FROM usuarios WHERE correouser = '"+correo+"' and password = '"+password+"';";
        stmt = con.createStatement();
        resultado = stmt.executeQuery(consulta);
        
        if(resultado.next()){
            HttpSession session = request.getSession();
            session.setAttribute("idusuario",resultado.getString("idusuario")); //GUARDAMOS EL ID DEL USUARIO EN LA VARIABLE DE SESSION
            
            if(resultado.getInt("estadocuenta") == 1){
                request.setAttribute("mensaje","Bienvenido a Fsociety "+resultado.getString("nombreuser"));
            }else if(resultado.getInt("estadocuenta") == 0){
                //OBTENEMOS LA VARIABLE DE SESSION DEL USUARIO
                String iduser = (String) session.getAttribute("idusuario");
                consulta = "UPDATE `usuarios` SET `estadocuenta`= 1 WHERE idusuario = "+iduser+";";
                if(conection_db.actualizar(consulta) == 1){
                    request.setAttribute("mensaje","Es un gusto verte de vuelta en Fsociety, "+resultado.getString("nombreuser") + ", gracias por reactivar tu cuenta");
                }
            }
            con.close();
            switch(opt){
                case "1":
                    request.getRequestDispatcher("direccion_envio.jsp").forward(request, response);
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }
        }else{
            con.close();
            request.setAttribute("mensaje","Usuario o contraseña incorrecta, intente de nuevo");
            request.getRequestDispatcher("login.jsp?opt="+opt).forward(request, response);
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
            Logger.getLogger(inciar_session.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(inciar_session.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(inciar_session.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(inciar_session.class.getName()).log(Level.SEVERE, null, ex);
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
