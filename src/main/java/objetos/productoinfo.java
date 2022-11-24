/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objetos;


public class productoinfo {
    private String id;
    private String nombre;
    private String descrip;
    private float precio;
    private int unidades;
    private String imagen;
    private String autor;
    private String año;
    private String mes;
    private String paginas;
    private String ed;
    private String colec;
    private String volumen;

    public productoinfo(String id, String nombre, String descrip, float precio, int unidades, String imagen, String autor, String año, String mes, String paginas, String ed, String colec, String volumen) {
        this.id = id;
        this.nombre = nombre;
        this.descrip = descrip;
        this.precio = precio;
        this.unidades = unidades;
        this.imagen = imagen;
        this.autor = autor;
        this.año = año;
        this.mes = mes;
        this.paginas = paginas;
        this.ed = ed;
        this.colec = colec;
        this.volumen = volumen;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getUnidades() {
        return unidades;
    }

    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getAño() {
        return año;
    }

    public void setAño(String año) {
        this.año = año;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getPaginas() {
        return paginas;
    }

    public void setPaginas(String paginas) {
        this.paginas = paginas;
    }

    public String getEd() {
        return ed;
    }

    public void setEd(String ed) {
        this.ed = ed;
    }

    public String getColec() {
        return colec;
    }

    public void setColec(String colec) {
        this.colec = colec;
    }

    public String getVolumen() {
        return volumen;
    }

    public void setVolumen(String volumen) {
        this.volumen = volumen;
    }
    
}
