
<!doctype html>

<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.Conexion"%>
<%@page import="java.sql.Statement"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet" href="../css/altaProducto.css">

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

	<%
	String sku = request.getParameter("sku");

	String Desc = new String();
	String Pre = new String();
	String Categ = new String();

	try {
		Conexion conexion = new Conexion();
		Statement st = conexion.conectar();
		ResultSet rs = st.executeQuery("SELECT * FROM productos WHERE sku=" + sku);

		if (rs.next()) {
			Desc = rs.getString("descripcion");
			Pre = rs.getString("precio");
			Categ = rs.getString("categoria");
		} else {
			response.sendRedirect("ListadoProductos.jsp");
		}
	} catch (Exception e) {
		response.sendRedirect("ListadoProductos.jsp");
	}
	%>

	<div class="container mt-5 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body ">
				<form action="../Controlador/actProducto.jsp" method="post">
					<div class="form-group text-center">
						<h3 class="Aproducto">
							<strong>Modificación de Productos</strong>
						</h3>
						<img src="../Img/producto.png" alt="" width="170" height="70">


					</div>
					<div class="form-group">
					
					    <label class="ldescripcion"><strong> SKU:
						</strong> </label> <input type="hidden" name="txtSku"
							placeholder="SKU del producto" class="form-control"
							required value="<%out.println(sku);%>">
						<label class="ldescripcion"><strong> Descripción:
						</strong> </label> <input type="text" name="txtDescripcion"
							placeholder="Descripción del producto" class="form-control"
							required value="<%out.println(Desc);%>">
					</div>
					<div class="form-group">
						<label class="lPrecio"><strong> Precio:</strong> </label>


						<div class="input-group mb-3">
							<input type="text" name="txtPrecio" class="form-control"
								placeholder="Ingrese Precio" required
								value="<%out.println(Pre);%>">



						</div>

						<div class="form-group">
							<label class="lcategoria"><strong> Categoría: </strong> </label>
							<input type="text" name="txtCategoria"
								placeholder="Categoría del producto" class="form-control"
								required value="<%out.println(Categ);%>">
						</div>


					</div>
					<div class="form-group">
						<input type="submit" name="accion" value="Modificar Producto"
							class=" Btningresar btn btn-primary my-3 " />



					</div>


				</form>



			</div>

		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="../js/script.js"></script>
</body>
</html>