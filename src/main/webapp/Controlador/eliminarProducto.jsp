<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.Conexion"%>

<% 
     String sku = request.getParameter("sku");
     
   
//out.println(usuario);
   
 //out.println(password);
   

 
 
 
 
 try {
	 Conexion conexion = new Conexion();
	 Statement st= conexion.conectar();
	 Integer okElim= st.executeUpdate("DELETE FROM productos WHERE sku="+sku);
	 
	 if (okElim==1){
		 response.sendRedirect("../Vista/ListadoProductos.jsp?mensaje=El%20producto%20se%20elimino%20correctamente");
	 } else {
		 response.sendRedirect("../Vista/altaProductos.jsp?mensaje=No%20se%20pudo%20eliminar%20el%20producto");
	 }
 }catch ( Exception e){
	 response.sendRedirect("../Vista/ListadoProductos.jsp?mensaje=No%20se%20pudo%20borrar%20el%20producto.Error%20en%20cargar%20productos.");
 }

%>