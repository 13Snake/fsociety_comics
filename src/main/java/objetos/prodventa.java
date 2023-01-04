/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objetos;

/**
 *
 * @author ksio
 */
public class prodventa {
    private String id;
    private String user;
    private String name;
    private String unidades;
    private double subtotal;
    private String fechaventa;
    private String fechacompra;

    public prodventa(String id, String user, String name, String unidades, double subtotal, String fechaventa, String fechacompra) {
        this.id = id;
        this.user = user;
        this.name = name;
        this.unidades = unidades;
        this.subtotal = subtotal;
        this.fechaventa = fechaventa;
        this.fechacompra = fechacompra;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUnidades() {
        return unidades;
    }

    public void setUnidades(String unidades) {
        this.unidades = unidades;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public String getFechaventa() {
        return fechaventa;
    }

    public void setFechaventa(String fechaventa) {
        this.fechaventa = fechaventa;
    }

    public String getFechacompra() {
        return fechacompra;
    }

    public void setFechacompra(String fechacompra) {
        this.fechacompra = fechacompra;
    }
    
    
}
