package sv.edu.udb.www.desafio03_productos.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "productos", schema = "productos_dwf", catalog = "")
public class ProductosEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "codigo_producto", nullable = false, length = 15)
    private String codigoProducto;
    @Basic
    @Column(name = "nombre_producto", nullable = false, length = 100)
    private String nombreProducto;
    @Basic
    @Column(name = "descripcion", nullable = false, length = -1)
    private String descripcion;
    @Basic
    @Column(name = "nombre_imagen", nullable = true, length = 255)
    private String nombreImagen;
    @Basic
    @Column(name = "categoria", nullable = false, length = 50)
    private String categoria;
    @Basic
    @Column(name = "precio", nullable = false, precision = 2)
    private BigDecimal precio;
    @Basic
    @Column(name = "existencias", nullable = false)
    private int existencias;

    public String getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(String codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreImagen() {
        return nombreImagen;
    }

    public void setNombreImagen(String nombreImagen) {
        this.nombreImagen = nombreImagen;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public int getExistencias() {
        return existencias;
    }

    public void setExistencias(int existencias) {
        this.existencias = existencias;
    }
}
