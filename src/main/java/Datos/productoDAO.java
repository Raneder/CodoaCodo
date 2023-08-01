package Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
		Conexion con = null;
		try {
			con = new Conexion();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Statement st = con.conectar();
		
		ResultSet rs = st.executeQuery("SELECT * FROM productos");
		
		
		List<Producto> listPro = new ArrayList<Producto>();
		
		while (rs.next()) {
			Producto pro = new Producto(rs.getInt("sku"),rs.getString("descripcion"),rs.getDouble("precio"),rs.getString("categoria"));
			
			listPro.add(pro);
		}
        
		return listPro;
	}
	
    public int modificarProducto(Producto pro) throws SQLException {
    	
    	Connection con = null;
		try {
			con = new Conexion().conexion();
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		String sql = "UPDATE productos SET descripcion = ?, precio = ?, categoria = ? WHERE sku = ?";
		
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1, pro.getDescripcion());
		preparedStatement.setDouble(2, pro.getPrecio());
		preparedStatement.setString(3, pro.getCategoria());
		preparedStatement.setInt(4, pro.getSku());
		
		
		return preparedStatement.executeUpdate();
    	
    }
}

