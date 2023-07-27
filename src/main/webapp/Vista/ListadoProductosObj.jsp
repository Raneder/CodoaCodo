<!DOCTYPE html>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.List"%>
<%@page import="Datos.productoDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Datos.Conexion"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tienda Deportiva</title>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600&family=Roboto:wght@100&display=swap"
	rel="stylesheet">
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Css -->
<link rel="stylesheet" href="../css/listadoProducto.css">
<!-- Icono -->
<link rel="shortcut icon" href="img/utn.png">
<!-- Animate Css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<!-- Iconos -->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="principal.jsp">¿Quienes Somos?</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"> ¿ Donde encontrarnos?</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Productos </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="ListadoProductos.jsp">Listado
									de Productos</a></li>
							<li><a class="dropdown-item" href="altaProductos.jsp">Agregar
									Productos</a></li>

						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Sucursal </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="#">Alta de sucursal</a></li>
							<li><a class="dropdown-item" href="#">Baja de sucursal</a></li>
							<li><a class="dropdown-item" href="#">Modificación de
									sucursal</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="text-center fs-3 my-4">Listado de Productos
		   
		   <% 
			String mensaje=request.getParameter("mensaje");
			if(mensaje!=null) {
				out.println("<div class='bg-danger text-center p-1 rounded'>");
				out.println(mensaje);
				out.println("</div>");
			}	
		%>
		
		</div>
            
            


		<table class="table table-primary table-striped text-center">
			<thead>
				<tr>
					<th scope="col">SKU</th>
					<th scope="col">Descripción</th>
					<th scope="col">Precio</th>
					<th scope="col">Categoría</th>
					<th scope="col">Operaciones</th>
				</tr>
			</thead>
			<tbody>
				<%
				
				try{
					
					productoDAO pdao= new productoDAO();
					List<Producto> listPro = pdao.listarProductos();
					
					
					for (Producto pro:listPro) {
						out.println("<tr>");

						out.println("<td>");
						Integer sku = pro.getSku();
						out.println(sku);
						out.println("</td>");

						out.println("<td>");
						String descripcion = pro.getDescripcion();
						out.println(descripcion);
						out.println("</td>");

						out.println("<td>");
						out.println(pro.getPrecio());
						out.println("</td>");

						out.println("<td>");
						out.println(pro.getCategoria());
						out.println("</td>");

						out.println("<td>");
						out.println("<a href='modificarProducto.jsp?sku=" + sku + "'><i class='bi bi-pencil-fill m-1'></i></a>");
						out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#eliminarModal' Sku='" + sku + "' descripcion='"
						+ descripcion + "'><i class='bi bi-trash3-fill m-1'></i> </a>");
						out.println("</td>");

						out.println("<tr>");

					}

					
				}catch ( Exception e){
					out.println();
				}
				
				%>
			</tbody>
		</table>


	</div>

	<div class="modal fade" id="eliminarModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Eliminar
						Producto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="../Controlador/eliminarProducto.jsp" method="post">
				   <input type="hidden" name="sku" id="sku">
					<div class="modal-body text-center">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">¿
								Desea eliminar el producto?</label>
							<div id="dataProducto" class="text-danger"></div>
						</div>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancelar</button>
							<input type="submit" class="btn btn-primary" value="Eliminar">
						
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="../js/listPro.js"></script>

</body>

</html>