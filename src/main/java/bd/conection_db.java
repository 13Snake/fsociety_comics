/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import objetos.productoinfo;
import objetos.productos;

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
    
    //Metodo para crear la conexion a la base de datos
    public static Connection conectar_db() throws SQLException, ClassNotFoundException{
        try {   
            Class.forName("com.mysql.cj.jdbc.Driver"); //hacer la conexion con la libreria
        } catch (ClassNotFoundException ex) {}
        
        java.sql.Connection con=null; //importar sql.connection para la conexion
        //INICIAR LA CONEXION A LA BASE DE DATOS
        con = DriverManager.getConnection(url,usuario,pass); //montar el servidor
        return con;
    }
    
    //Metodo para actualizar alguna tabla de la base de datos
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
    
    //Metodo para poder obtener los datos del usuario
    public static String[] datos_usuario(String idusuario) throws SQLException, ClassNotFoundException, ClassNotFoundException{
        String[] usuario_datos = usuario_datos = new String[15];
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM usuarios WHERE idusuario = '"+idusuario+"';");
        if(rs.next()){
            usuario_datos[1] = rs.getString("nombreuser");
            usuario_datos[2] = rs.getString("apellidosuser");
            usuario_datos[3] = rs.getString("correouser");
            usuario_datos[4] = rs.getString("password");
            usuario_datos[5] = rs.getString("telefono");
            usuario_datos[6] = rs.getString("cp");
            usuario_datos[7] = rs.getString("calle");
            usuario_datos[8] = rs.getString("colonia");
            usuario_datos[9] = rs.getString("estado");
            usuario_datos[10] = rs.getString("ciudad");
            usuario_datos[11] = rs.getString("numint");
            usuario_datos[12] = rs.getString("numext");
            usuario_datos[13] = rs.getString("municipio");
            usuario_datos[14] = rs.getString("referencia");
            
        }
        return usuario_datos;
    }
    
    //METODO PARA OBTENER LA INFORMACION DE LOS PRODUCTOS EN EL INDEX
    public static ArrayList<productos> mas_deseados(String consulta) throws SQLException, ClassNotFoundException{
        ArrayList<productos> info  = new ArrayList();
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery(consulta);
        while(rs.next()){
            productos prod = new productos(rs.getString("prod"), rs.getString("img"), rs.getString("name"), rs.getString("preci"), rs.getString("descrip"));
            info.add(prod);
        }
        con.close();
        return info;
    }
    
    public static ArrayList<productoinfo> informacionprod(String consulta) throws SQLException, ClassNotFoundException{
        ArrayList<productoinfo> prod_info = new ArrayList();
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery(consulta);
        if(rs.next()){
            productoinfo info = new productoinfo(rs.getString("id"),rs.getString("nombre"),rs.getString("descrip"),
                    rs.getFloat("precio"),rs.getInt("unidades"), rs.getString("img"), rs.getString("autor"),rs.getString("anio"),
                    rs.getString("mes"),rs.getString("paginas"),rs.getString("ed"),rs.getString("colec"),rs.getString("volumen"));
            prod_info.add(info);
        }
        con.close();
        return prod_info;
    }
}
