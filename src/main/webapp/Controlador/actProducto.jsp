<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.Conexion"%>

<% 
     String sku = request.getParameter("txtSku");
     String descripcion = request.getParameter("txtDescripcion");
     String precio = request.getParameter("txtPrecio");
     String categoria = request.getParameter("txtCategoria");
   
//out.println(usuario);
   
 //out.println(password);
   
 Conexion conexion = new Conexion();
 Statement st= conexion.conectar();
 
 
 
 
 try {
	 Integer okAct= st.executeUpdate("UPDATE `productos` SET descripcion='"+descripcion+"', precio = '"+precio+"', categoria = '"+categoria+"' WHERE sku="+sku);
	 
	 if (okAct==1){
		 response.sendRedirect("../Vista/ListadoProductos.jsp");
	 } else {
		 response.sendRedirect("../Vista/modificarProducto.jsp?mensaje=El%20producto%20no%20pudo%20ser%20modificado");
	 }
 }catch ( Exception e){
	 response.sendRedirect("../Vista/modificarProducto.jsp?mensaje=El%20producto%20no%20pudo%20ser%20modificado");
 }

%>