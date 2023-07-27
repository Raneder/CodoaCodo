package Modelo;

public class Producto {
     private Integer sku;
     private String descripcion;
     private String precio;
     private String categoria;
	public Producto(Integer sku, String descripcion, String precio, String categoria) {
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
	public String getPrecio() {
		return precio;
	}
	public void setPrecio(String precio) {
		this.precio = precio;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
     
     
}
