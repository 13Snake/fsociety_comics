/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import bd.conection_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
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

/**
 *
 * @author ksio
 */
public class editarcuenta extends HttpServlet {

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
        java.sql.Statement stmt = null;
        java.sql.ResultSet resultado = null;
        
        conection_db database = new conection_db();
        Connection con = database.conectar_db();
        
        //OBTENEMOS LA VARIABLE DE SESSION DEL USUARIO
        HttpSession session = request.getSession();
        String iduser = (String) session.getAttribute("idusuario");
        
        String opcion = request.getParameter("opcion"); //OPCION QUE SE MANDA POR METODO GET PARA ENTRAR AL SWITCH
        String consulta = "";
        
        switch(opcion){
            case "1":
                //CASO PARA EDITAR NOMBRES DEL USUARIO
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                
                consulta = "UPDATE `usuarios` SET `nombreuser`='"+nombre+"',`apellidosuser`='"+apellidos+"' WHERE idusuario = "+iduser+";";
                if(conection_db.actualizar(consulta) == 1){
                    request.setAttribute("mensaje","Tu nombre ha sido editado");
                    request.getRequestDispatcher("micuenta.jsp").forward(request, response);
                }
                break;
            case "2":
                //CASO PARA EDITAR EL CORREO ELECTRONIO
                String correo = request.getParameter("email");
                
                consulta = "SELECT correouser FROM usuarios WHERE correouser = '"+correo+"';"; 
                stmt = con.createStatement();
                resultado = stmt.executeQuery(consulta);
                
                if (!resultado.next()) {
                    consulta = "UPDATE `usuarios` SET `correouser`='"+correo+"' WHERE idusuario = "+iduser+";";
                    if(conection_db.actualizar(consulta) == 1){
                        request.setAttribute("mensaje","Tu Correo ha sido editado, inicie sesión de nuevo");
                        request.getRequestDispatcher("close_login").forward(request, response);
                    }
                } else {
                    request.setAttribute("mensaje","Ya hay una cuenta relacionada a este correo, intente con otro");
                    request.getRequestDispatcher("micuenta.jsp").forward(request, response);
                }
                break;
            case "3":
                //CASO PARA EDITAR EL NUMERO CELULAR DEL USUARIO
                String telefono = request.getParameter("telefono");
                
                if(telefono.length() == 10){
                    consulta = "UPDATE `usuarios` SET `telefono`='"+telefono+"' WHERE idusuario = "+iduser+";";
                    if(conection_db.actualizar(consulta) == 1){
                        request.setAttribute("mensaje","Tu numero telefonico ha sido editado");
                        request.getRequestDispatcher("micuenta.jsp").forward(request, response);
                    }
                }else{
                    request.setAttribute("mensaje","Inserta un numero telefonico valido");
                    request.getRequestDispatcher("micuenta.jsp").forward(request, response);
                }
                break;
            case "4":
                //CASO PARA EDITAR LA DIRECCION DEL USUARIO
                String cp = request.getParameter("cp");
                String calle = request.getParameter("calle");
                String colonia = request.getParameter("colonia");
                String estado = request.getParameter("estado");
                String ciudad = request.getParameter("ciudad");
                String municipio = request.getParameter("municipio");
                String numint = request.getParameter("numint");
                String numext = request.getParameter("numext");
                String referes = request.getParameter("referes");
                
                consulta = "UPDATE usuarios SET cp='"+cp+"', calle='"+calle+"', colonia='"+colonia+"', estado='"+estado+"', ciudad='"+ciudad+"', numint= '"+numint+"', numext='"+numext+"', municipio='"+municipio+"', referencia='"+referes+"' WHERE idusuario = "+iduser+";";
                if(conection_db.actualizar(consulta) == 1){
                    request.setAttribute("mensaje","Tu direccion ha sido editada");
                    request.getRequestDispatcher("micuenta.jsp").forward(request, response);
                }
                break;
            case "5":
                //CASO PARA EDITAR LA CONTRASEÑA DE LA CUENTA
                String actual = request.getParameter("actual");
                String nueva = request.getParameter("nueva");
                String confirmacion = request.getParameter("confirmacion");
                
                consulta = "SELECT idusuario, password FROM usuarios WHERE password = '"+actual+"' AND idusuario = "+iduser+";";
                
                stmt = con.createStatement();
                resultado = stmt.executeQuery(consulta);
                
                if(resultado.next()){ //REVISAMOS SI LA CONTRASEÑA ACTUAL ES LA CORRECTA
                    if(actual.equals(nueva)){
                        if(nueva.equals(confirmacion)){
                            consulta = "UPDATE `usuarios` SET `password`='"+nueva+"' WHERE idusuario = "+iduser+";";
                            if(conection_db.actualizar(consulta) == 1){
                                request.setAttribute("mensaje","Tu contraseña ha sido cambiada, inicia sesión de nuevo por favor");
                                request.getRequestDispatcher("close_login").forward(request, response);
                            }else{
                                request.setAttribute("mensaje","ERROR AL CAMBIAR TU CONTRASEÑA INTENTA DE NUEVO");
                                request.getRequestDispatcher("miseguridad.jsp").forward(request, response);
                            }
                        }else{
                            request.setAttribute("mensaje","Las nuevas contraseñas no coinciden, intente de nuevo");
                            request.getRequestDispatcher("miseguridad.jsp").forward(request, response); 
                        }
                    }else{
                        request.setAttribute("mensaje","La contraseña actual no puede ser igual a la nueva contraseña, intente de nuevo");
                        request.getRequestDispatcher("miseguridad.jsp").forward(request, response); 
                    }
                }else{
                    request.setAttribute("mensaje","Contraseña incorrecta, intente de nuevo");
                    request.getRequestDispatcher("miseguridad.jsp").forward(request, response);
                }
                break;
            case "6":
                //CASO PARA DAR DE BAJA LA CUENTA
                String texto = request.getParameter("confirmacion");
                String texto_2 = "Estoy seguro de cerrar mi cuenta";
                if(texto.equals(texto_2)){
                    consulta = "UPDATE `usuarios` SET `estadocuenta`= 0 WHERE idusuario = "+iduser+";";
                    if(conection_db.actualizar(consulta) == 1){
                        request.setAttribute("mensaje","Lamentamos tu partida, recuerda que puedes reactivar tu cuenta, vuelve pronto");
                        request.getRequestDispatcher("close_login").forward(request, response);
                    }
                }else{
                    request.setAttribute("mensaje","Inserte el texto correctamente, intente de nuevo");
                    request.getRequestDispatcher("miseguridad.jsp").forward(request, response);
                }
                break;
            default:
                request.getRequestDispatcher("micuenta.jsp").forward(request, response);
                break;
        }
        
        con.close();
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
            Logger.getLogger(editarcuenta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editarcuenta.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editarcuenta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editarcuenta.class.getName()).log(Level.SEVERE, null, ex);
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
