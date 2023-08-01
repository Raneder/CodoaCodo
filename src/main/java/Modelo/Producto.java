package Modelo;

public class Producto {
     private Integer sku;
     private String descripcion;
     private Double precio;
     private String categoria;
	public Producto(Integer sku, String descripcion, Double precio, String categoria) {
		super();
		this.sku = sku;
		this.descripcion = descripcion;
		this.precio = precio;
		this.categoria = categoria;
	}
	public Integer getSku() {
		return sku;
	}
	public void setSku(Integer sku) {
		this.sku = sku;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
     
     
}
