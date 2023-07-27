<%@page import="Datos.productoDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.Conexion"%>

<% 
     String usuario = request.getParameter("txtEmail");
     String password = request.getParameter("txtPassword");
   
//out.println(usuario);
   
 //out.println(password);
 
 
   
 Conexion conexion = new Conexion();
 Statement st= conexion.conectar();
 
 ResultSet rs=st.executeQuery("SELECT * FROM usuario WHERE email='"+usuario+"' AND clave='"+password+"'");
 
 if (rs.next()){
	 response.sendRedirect("../Vista/principal.jsp");
 } else {
	 response.sendRedirect("../Vista/login.jsp?mensaje=Usuario%20o%20password%20incorrectos");
 } 

%>