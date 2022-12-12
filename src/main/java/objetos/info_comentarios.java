/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objetos;

public class info_comentarios {
    private String idcomnetario;
    private String idusuario;
    private String idprod;
    private String comentario;
    private String calificacion;
    private String fecha;
    private String hora;
    private String user;

    public info_comentarios(String idcomnetario, String idusuario, String idprod, String comentario, String calificacion, String fecha, String hora, String user) {
        this.idcomnetario = idcomnetario;
        this.idusuario = idusuario;
        this.idprod = idprod;
        this.comentario = comentario;
        this.calificacion = calificacion;
        this.fecha = fecha;
        this.hora = hora;
        this.user = user;
    }

    public String getIdcomnetario() {
        return idcomnetario;
    }

    public void setIdcomnetario(String idcomnetario) {
        this.idcomnetario = idcomnetario;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getIdprod() {
        return idprod;
    }

    public void setIdprod(String idprod) {
        this.idprod = idprod;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }    
}
