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

<link rel="stylesheet" href="../css/style.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">



</head>

<body>
	<div class="container mt-5 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body ">
				<form action="../Controlador/Validar.jsp" method="post">
					<div class="form-group text-center">
						<h3 class="Isesion">
							<strong>Inicio de Sesión</strong>
						</h3>
						<img src="../Img/Logotdeportivo.png" alt="" width="170" height="70">
						<div>
							<label class="Lbienvenidos"><strong>Bienvenidos
									al sistema </strong></label>
						</div>

					</div>
					<div class="form-group">
						<label class="lusuario"><strong> Usuario: </strong> </label> <input
							type="email" name="txtEmail" placeholder="Ingrese email"
							class="form-control" required>
					</div>
					<div class="form-group">
						<label class="lcontrasenia"><strong> Contraseña:</strong>
						</label>


						<div class="input-group mb-3">
							<input type="password" name="txtPassword" id="pass"
								class="form-control" placeholder="Ingrese contraseña"
								aria-label="Username" aria-describedby="basic-addon1" required>
							<span class="input-group-text" id="basic-addon1"> <i
								class="bi bi-eye-fill" id="icono" onclick="mostrarPass()"></i>

							</span>
						</div>


					</div>
					<div class="form-group">
						<input type="submit" name="accion" value="Ingresar"
							class=" Btningresar btn btn-primary my-3 " />
					</div>
				</form>
				
					<%
					String mensaje = request.getParameter("mensaje");
					if (mensaje != null) {
						out.println("<div class='bg-danger text-center p-1 rounded'>");
						out.println(mensaje);
						out.println("</div>");
						
					}
					%>
				
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