package Datos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Modelo.Producto;

//ESTARAN TODAS LAS CLASES QUE CONCENTRAN LAS CONSULTAS, ELIMINACIONES, MODIFICACIONES, INSERCIONES A LA TABLA USUARIOS

public class productoDAO {
	
	// Se conecta a la base de datos, trae todos los usuarios con sql y devuelve un listado de objetos productos
    
	public List<Producto> listarProductos() throws SQLException {
		Conexion con = new Conexion();
		Statement st = con.conectar();
		
		ResultSet rs = st.executeQuery("SELECT * FROM productos");
		
		
		List<Producto> listPro = new ArrayList<Producto>();
		
		while (rs.next()) {
			Producto pro = new Producto(rs.getInt("sku"),rs.getString("descripcion"),rs.getString("precio"),rs.getString("categoria"));
			
			listPro.add(pro);
		}
        
		return listPro;
	}
	
	
}
