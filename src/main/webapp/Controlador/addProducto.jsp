<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.Conexion"%>

<% 
     String descripcion = request.getParameter("txtDescripcion");
     String precio = request.getParameter("txtPrecio");
     String categoria = request.getParameter("txtCategoria");
   
//out.println(usuario);
   
 //out.println(password);
   
 Conexion conexion = new Conexion();
 Statement st= conexion.conectar();
 
 
 
 
 try {
	 Integer okIns= st.executeUpdate("INSERT INTO productos (descripcion, precio, categoria) VALUES ('"+descripcion+"', '"+precio+"','"+categoria+"') ");
	 
	 if (okIns==1){
		 response.sendRedirect("../Vista/principal.jsp?mensaje=El%20producto%20se%20agrego%20correctamente");
	 } else {
		 response.sendRedirect("../Vista/altaProductos.jsp?mensaje=No%20se%20pudo%20agregar%20el%20producto");
	 }
 }catch ( Exception e){
	 response.sendRedirect("../Vista/altaProductos.jsp?mensaje=No%20se%20pudo%20agregar%20el%20producto");
 }

%>