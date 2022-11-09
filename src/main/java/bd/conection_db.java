/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ksio
 */
public class conection_db {
    private static String url = "jdbc:mysql://localhost:3306/dbfsociety"; //donde se encuentra la base de datos
    private static String usuario = "root";
    private static String pass = "";
    
    private static java.sql.Statement stmt = null;
    private static java.sql.ResultSet rs = null;
    
    public static Connection conectar_db() throws SQLException, ClassNotFoundException{
        try {   
            Class.forName("com.mysql.cj.jdbc.Driver"); //hacer la conexion con la libreria
        } catch (ClassNotFoundException ex) {}
        
        java.sql.Connection con=null; //importar sql.connection para la conexion
        //INICIAR LA CONEXION A LA BASE DE DATOS
        con = DriverManager.getConnection(url,usuario,pass); //montar el servidor
        return con;
    }
    
    public static ResultSet consultar(String consulta) throws SQLException, ClassNotFoundException, ClassNotFoundException{
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery(consulta);
        if(rs == null){
            return rs;
        }else{
            return null;
        }
    }
    
    public static int actualizar(String consulta) throws SQLException, ClassNotFoundException, ClassNotFoundException{
        try{
            Connection con = conectar_db();
            stmt = con.createStatement();
            stmt.executeUpdate(consulta);
            con.close();
            return 1;
        }catch(SQLException e){
            System.err.println(e);
            return 0;
        }
    }
}
