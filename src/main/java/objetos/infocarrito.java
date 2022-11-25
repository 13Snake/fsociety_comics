package objetos;

import java.io.Serializable;

public class infocarrito implements Serializable{
    private String idprod;
    private String nombre;
    private String img;
    private int unidades;
    private int cantidad;
    private float unitario;
    private float parcial;

    public infocarrito(String idprod, String nombre, String img, int unidades, int cantidad, float unitario, float parcial) {
        this.idprod = idprod;
        this.nombre = nombre;
        this.img = img;
        this.unidades = unidades;
        this.cantidad = cantidad;
        this.unitario = unitario;
        this.parcial = parcial;
    }

    public String getIdprod() {
        return idprod;
    }

    public void setIdprod(String idprod) {
        this.idprod = idprod;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getUnidades() {
        return unidades;
    }

    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getUnitario() {
        return unitario;
    }

    public void setUnitario(float unitario) {
        this.unitario = unitario;
    }

    public float getParcial() {
        return parcial;
    }

    public void setParcial(float parcial) {
        this.parcial = parcial;
    }

    
}
