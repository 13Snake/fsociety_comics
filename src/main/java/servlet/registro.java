package servlet;

import bd.conection_db;
import static bd.conection_db.conectar_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksio
 */
public class registro extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, ClassNotFoundException, SQLException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        java.sql.Statement stmt = null;
        java.sql.ResultSet resultado = null;
        
        String consulta = "";
        
        conection_db database = new conection_db();
        
        String nom = request.getParameter("nombre");
        String apel = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String numero = request.getParameter("numero");
        String pas1 = request.getParameter("pass_1");
        String pas2 = request.getParameter("pass_2");
        String opt = request.getParameter("opt");
        
            if(pas1.equals(pas2)){
                if(numero.length() == 10){
                    if(pas1.length() >= 9){
                        
                        Connection con = conectar_db();
                        consulta = "SELECT correouser FROM usuarios WHERE correouser = '"+correo+"';"; 
                        stmt = con.createStatement();
                        resultado = stmt.executeQuery(consulta);
                        
                        if(!resultado.next()){
                            consulta = "INSERT INTO usuarios (idusuario, nombreuser, apellidosuser, correouser, password, estadocuenta, telefono) VALUES (NULL, '"+nom+"', '"+apel+"', '"+correo+"', '"+pas1+"', '1', '"+numero+"');";
                            
                            if(database.actualizar(consulta)==1){
                                con.close();
                                out.println("<script>alert('Usuario registrado, inicie sesión por favor'); window.location='login.jsp?opt="+opt+"' </script>");
                            }
                        }else{
                            out.println("<script>alert('El usuario ya esta registrado, inicie sesión por favor'); window.location='login.jsp?opt="+opt+"' </script>");
                        }
                    }else{
                        out.println("<script>alert('La contraseña es demasiado corta, intente de nuevo'); window.location='login.jsp?opt="+opt+"' </script>");
                    }
                }else{
                    out.println("<script>alert('El numero telefonico no es valido, intente de nuevo'); window.location='login.jsp?opt="+opt+"' </script>");
                }
            }else{
                out.println("<script>alert('Las contraseñas no coinciden, intente de nuevo'); window.location='login.jsp?opt="+opt+"' </script>");
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
            Logger.getLogger(registro.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(registro.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(registro.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(registro.class.getName()).log(Level.SEVERE, null, ex);
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
