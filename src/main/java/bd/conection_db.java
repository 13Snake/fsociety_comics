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
import objetos.info_comentarios;
import objetos.infocarrito;
import objetos.productoinfo;
import objetos.productos;
import objetos.prodventa;
import objetos.tablapedidos;

/**
 *
 * @author ksio
 */
public class conection_db {
    private static String url = "jdbc:mysql://localhost:3306/dbfsociety?characterEncoding=utf-8"; //donde se encuentra la base de datos
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
        Connection con = null;
        try{
            con = conectar_db();
            stmt = con.createStatement();
            stmt.executeUpdate(consulta);
            con.close();
            return 1;
        }catch(SQLException e){
            System.err.println(e);
            con.close();
            return 0;
        }
    }
    
    //Metodo para poder obtener los datos del usuario
    public static String[] datos_usuario(String idusuario) throws SQLException, ClassNotFoundException, ClassNotFoundException{
        String[] usuario_datos = new String[15];
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
        con.close();
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
    
    //METODO PARA EXTRAER INFORMACIO DEL PRODUCTO
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
    
    //REVISAR SI EXISTE UN PRODUCTO EN LA BASE DE DATOS O NO Y SI EL STOCK ES SUFICIENTE, PARA AGREGAR AL CARRITO
    public static infocarrito existencia_producto(String consulta, int existencia)throws SQLException, ClassNotFoundException{
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery(consulta);
        if(rs.next()){
            infocarrito obj_carrito = new infocarrito(rs.getString("id"), rs.getString("nombre"),rs.getString("img"),rs.getInt("uni"),existencia,rs.getFloat("precio"),rs.getFloat("precio"));
            con.close();
            return obj_carrito;
        }else{
            con.close();
            return null;
        }
    }
    
    //METODO PARA COMPRAR FECHA DE VENCIMIENTO DE LA TARJETA
    public static int comprobar_vencimiento(String fecha) throws SQLException, ClassNotFoundException{
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT CURDATE() < '"+fecha+"' as resultado;");
        if(rs.next() && rs.getString("resultado").equals("1")){
            con.close();
            return 1;
        }else{
            con.close();
            return 0;
        }
    }
    
    //CALCULAR LA CALIFICACION DEL PRODUCTO Y RETORNA EL NUMERO DE ESPADAS
    public static int calificacion_producto(String id) throws SQLException, ClassNotFoundException{
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT idproducto as prod, TRUNCATE(SUM(comentarios.calificacion) / COUNT(comentarios.comentario),2) AS promedio FROM productos INNER JOIN comentarios ON comentarios.productos_idproducto = productos.idproducto WHERE productos.idproducto = "+id+";");
        if(rs.next()){
            double cal = rs.getDouble("promedio");
            con.close();
            return (int) cal;
        }else{
            con.close();
            return 0;
        }
    }
    
    //IDENTIFICAR SI EL USUARIO YA GENERO UN COMENTARIO EN EL PRODUCTO
    public static info_comentarios check_comentario(String idusuario, String idprod) throws SQLException, ClassNotFoundException, ClassNotFoundException{
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT idcomentario, usuarios_idusuario, productos_idproducto,comentario, fechacomentario, calificacion, fechacomentario, horacomentario, SUBSTRING_INDEX(usuarios.correouser,'@',1) AS name_u FROM comentarios INNER JOIN usuarios ON comentarios.usuarios_idusuario = usuarios.idusuario where comentarios.productos_idproducto = "+idprod+" AND comentarios.usuarios_idusuario = "+idusuario+";");
        if(rs.next()){
            info_comentarios coments = new info_comentarios(rs.getString("idcomentario"),rs.getString("usuarios_idusuario"),rs.getString("productos_idproducto"),rs.getString("comentario"),rs.getString("calificacion"),rs.getString("fechacomentario"),rs.getString("horacomentario"),rs.getString("name_u"));
            con.close();
            return coments;
        }else{
            con.close();
            return null;
        }
    }
    
    //OBTENER COMENTARIOS DE LOS USUARIOS
    public static ArrayList<info_comentarios> comentarios_users(String idprod) throws SQLException, ClassNotFoundException, ClassNotFoundException{
        ArrayList<info_comentarios> coments_user = new ArrayList();
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT idcomentario, usuarios_idusuario, productos_idproducto,comentario, fechacomentario, calificacion, fechacomentario, horacomentario, SUBSTRING_INDEX(usuarios.correouser,'@',1) AS name_u FROM comentarios INNER JOIN usuarios ON comentarios.usuarios_idusuario = usuarios.idusuario where comentarios.productos_idproducto = "+idprod+" ORDER BY idcomentario DESC LIMIT 50;");
        while(rs.next()){
            info_comentarios coments = new info_comentarios(rs.getString("idcomentario"),rs.getString("usuarios_idusuario"),rs.getString("productos_idproducto"),rs.getString("comentario"),rs.getString("calificacion"),rs.getString("fechacomentario"),rs.getString("horacomentario"),rs.getString("name_u"));
            coments_user.add(coments);
        }
        con.close();
        return coments_user;
    }

    //VERIFICAR SI EL USUARIO YA COMENTO CIERTO PRODUCTO
    public static int verificar_comentario (String iduser, String idprod) throws SQLException, ClassNotFoundException, ClassNotFoundException{
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM comentarios WHERE usuarios_idusuario = "+iduser+" AND productos_idproducto = "+idprod+";");
        if(rs.next()){
            con.close();
            return 1;
        }else{
            con.close();
            return 0;
        }
    }
    
    //METODO PARA BUSCAR UN PRODUCTO CON LA BARRA DEL MENU
    public static ArrayList<productos> buscar_producto(String busqueda)  throws SQLException, ClassNotFoundException, ClassNotFoundException{
        ArrayList<productos> resultado_bus = new ArrayList();
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT idproducto, nombreproducto, imagen, precio, unidades, editoriales.editorial, colecciones.coleccion, categorias.categoria, autores.autor FROM productos INNER JOIN editoriales ON editoriales.ideditorial = editoriales_ideditorial INNER JOIN colecciones ON colecciones.idcoleccion = colecciones_idcoleccion INNER JOIN categorias ON categorias.idcategoria = categorias_idcategorias INNER JOIN autores ON autores.idautor = autores_idautor WHERE nombreproducto LIKE '%"+busqueda+"%' OR editoriales.editorial LIKE '%"+busqueda+"%' OR colecciones.coleccion LIKE '%"+busqueda+"%'OR categorias.categoria LIKE '%"+busqueda+"%' LIMIT 100;");
        while(rs.next()){
            productos prod = new productos(rs.getString("idproducto"),rs.getString("imagen"),rs.getString("nombreproducto"),rs.getString("precio"),"");
            resultado_bus.add(prod);
        }
        con.close();
        return resultado_bus;
    }
    
    //METODO PARA OBTENER LA LISTA DE DESEOS DEL USUARIO
    public static ArrayList<productos> lista_deseos(String id)  throws SQLException, ClassNotFoundException, ClassNotFoundException{
        ArrayList<productos> resultado_bus = new ArrayList();
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT idproducto, nombreproducto, imagen, precio, unidades FROM productos INNER JOIN listadeseos ON listadeseos.productos_idproducto = idproducto INNER JOIN usuarios ON usuarios.idusuario = listadeseos.usuarios_idusuario WHERE usuarios.idusuario = "+id+";");
        while(rs.next()){
            productos prod = new productos(rs.getString("idproducto"),rs.getString("imagen"),rs.getString("nombreproducto"),rs.getString("precio"),"");
            resultado_bus.add(prod);
        }
        con.close();
        return resultado_bus;
    }
    
    //verificar que el producto no este ya registrado en la lista de deseados del usuario
    public static int check_lista(String idprod, String iduser) throws SQLException, ClassNotFoundException{
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM listadeseos WHERE usuarios_idusuario = "+iduser+" AND productos_idproducto = "+idprod+";");
        if(rs.next()){
            con.close();
            return 1;
        }else{
            con.close();
            return 0;
        }
    }
    
    //METODOS UTILZADOS PARA EL APARTADO DE LOS PEDIDOS DEL USUARIO
    public static ArrayList<tablapedidos> numero_pedidos (String user) throws SQLException, ClassNotFoundException{
        ArrayList<tablapedidos> num_pedidos = new ArrayList();
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT usuarios_idusuario as user, id, COUNT(id) AS numprod FROM ventas INNER JOIN productos ON productos_idproducto = productos.idproducto WHERE usuarios_idusuario = "+user+" GROUP BY id ORDER BY id DESC LIMIT 24");
        while(rs.next()){
            tablapedidos num = new tablapedidos(rs.getString("id"),rs.getString("numprod"));
            num_pedidos.add(num);
        }
        return num_pedidos;
    }
    public static ArrayList<prodventa> obtener_pedidos (String user, String id) throws SQLException, ClassNotFoundException{
        ArrayList<prodventa> pedidos = new ArrayList();
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT usuarios_idusuario as user, id, subtotal, ventas.unidades as unidades, fechaventa, fechallegada, productos.nombreproducto as name, estadoventa FROM ventas INNER JOIN productos ON productos_idproducto = productos.idproducto WHERE usuarios_idusuario = "+user+" AND id = "+id+";");
        while(rs.next()){
            prodventa pedido = new prodventa(rs.getString("id"),rs.getString("user"),rs.getString("name"),rs.getString("unidades"),rs.getDouble("subtotal"),rs.getString("fechaventa"),rs.getString("fechallegada"),rs.getString("estadoventa"));
            pedidos.add(pedido);
        }
        return pedidos;
    }
    
    //METODO PARA OBTENER TODOS LOS COMENTARIOS DE UN USUARIO
    public static ArrayList<info_comentarios> comentarios_usuario (String user)throws SQLException, ClassNotFoundException{
        ArrayList<info_comentarios> comentarios = new ArrayList();
        Connection con = conectar_db();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT usuarios_idusuario, productos_idproducto, productos.nombreproducto, comentario, calificacion, fechacomentario, horacomentario FROM comentarios INNER JOIN productos ON productos_idproducto = productos.idproducto WHERE usuarios_idusuario = "+user+" ORDER BY fechacomentario DESC;");
        while(rs.next()){
            info_comentarios coment = new info_comentarios(rs.getString("nombreproducto"), rs.getString("usuarios_idusuario"), rs.getString("productos_idproducto"), rs.getString("comentario"), rs.getString("calificacion"), rs.getString("fechacomentario"), rs.getString("horacomentario"),"");
            comentarios.add(coment);
        }
        return comentarios;
    }
}
