<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.beans.LoginBean"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<base href="/" />
<title>Login</title>
<!-- DEPENDENCIAS __CSS__-->
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap-datepicker/bootstrap-datepicker.css" />
<!-- /DEPENDENCIAS __CSS__-->

<!-- DEPENDENCIAS __JS__-->
<script type="text/javascript" src="lib/jquery/jquery.js"></script>
<script type="text/javascript" src="lib/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="lib/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<!-- /DEPENDENCIAS __JS__ -->

<link rel="stylesheet" type="text/css" href="css/main.css" />

<script type="text/javascript" src="lib/projeto/projeto.js"></script>


<sql:setDataSource var="conexao"
	url="jdbc:mysql://localhost:3306/av1?useSSL=true&serverTimezone=America/Sao_Paulo"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="12345"
	scope="session" />

<meta charset="UTF-8">

</head>

<body class="bg-light-gray d-flex justify-content-center align-items-center">
	<div class="col-xs-12 col-sm-9 col-md-6">
		<h1 class="m-2">Bem vindo!</h1>
		<span class="m-2">Insira seus dados para continuar</span>
		<form action="login" class="d-flex flex-column justify-content-center" method="post">

			<div class="m-2">
				<input type="text" name="login" class="w-100"
					placeholder="Nome de usuário" minlength="6" maxlength="20"
					autofocus="true" required onblur="Validator.checkInput(this)" />
				<div class="mt-2 login vazio oculto">Campo não pode estar
					vazio</div>
				<div class="mt-2 login tamanho oculto">Campo deve conter entre
					6 e 20 caracteres</div>
				<div class="mt-2 login invalido oculto">Informe um nome de
					usuário válido</div>
			</div>


			<div class="m-2 relative">
				<input type="password" name="senha" class="w-100"
					placeholder="Senha" minlength="6" maxlength="50" required
					onblur="Validator.checkInput(this)" />
				<div class="show-password" onclick="toggleShowPwd()">
					<svg viewbox="0 0 512 512" width="35" height="35" fill="#888">
						<path
							d="m502.766239,233.245879c-5.49993,-6.476841 -11.331341,-12.522005 -16.925622,-18.039469c-32.432635,-31.952529 -67.244928,-58.648104 -105.733581,-78.540366c-27.566446,-14.244542 -54.616047,-23.62874 -80.761379,-28.305392c-15.766688,-2.818015 -30.247526,-3.605389 -43.012506,-3.605389c-13.321069,0 -28.09832,0.704712 -43.852483,3.605389c-26.435065,4.872034 -53.503036,14.273766 -80.754699,28.305392c-37.411546,19.271046 -72.478503,45.747024 -105.733581,78.540366c-6.429248,6.334897 -11.983451,12.166309 -16.926457,18.039469c-11.426528,13.558199 -11.414838,31.389761 0,44.95297c13.564044,16.128229 31.68033,32.96618 54.391441,51.064931c48.334588,38.495333 95.698109,62.945681 142.090563,73.010377c16.328621,3.493503 33.302671,4.97223 50.785217,4.97223c16.926457,0 33.616619,-1.478727 49.951085,-4.97223c46.936853,-10.123979 94.401405,-34.398148 142.640806,-73.010377c24.191508,-19.365397 41.828523,-36.64922 53.840362,-51.064931c11.580997,-13.894691 11.711252,-31.16432 0.000835,-44.95297zm-23.308948,24.972202c-12.213902,14.990168 -29.086921,30.52056 -49.956094,47.180663c-43.793201,34.965926 -86.812387,57.682882 -129.598617,66.621207c-15.772533,3.256373 -30.248361,4.440356 -43.569429,4.440356l-0.834967,0c-13.599113,0 -27.791052,-1.242431 -43.018351,-4.440356c-42.224297,-8.998443 -85.639258,-31.16432 -130.15554,-66.621207c-20.981894,-16.714376 -37.464148,-32.469374 -49.394161,-47.180663c-1.942134,-1.386046 -1.942134,-3.049301 0,-4.991435c1.386046,-1.942134 3.812461,-4.789373 7.211613,-8.330469c3.540261,-3.676361 6.109456,-6.38249 7.495502,-8.045745c32.18966,-31.639416 65.077353,-55.498608 98.243924,-72.152866c26.506037,-13.315224 50.518862,-22.119119 72.152866,-25.81385c12.504471,-2.130837 25.256926,-3.327345 38.299116,-3.327345c12.486101,0 24.984727,1.053729 38.015227,3.327345c21.935426,3.83083 46.008369,12.616356 72.15871,25.81385c33.793632,17.050868 66.327299,40.791493 97.687001,72.152866c7.211613,7.217457 12.308253,12.681484 15.262368,16.376214c1.492922,1.865317 1.386881,3.605389 0.000835,4.991435z" />
   						<path
							d="m256.33315,158.315912c-26.920181,0 -50.234974,9.430956 -69.381609,28.584271c-19.146636,19.146636 -28.584271,42.183384 -28.584271,69.09772c0,26.920181 9.365828,49.749858 28.584271,68.825521c19.081508,18.944573 42.461428,28.305392 69.381609,28.305392c26.914336,0 49.672206,-9.430956 68.547477,-28.305392c19.146636,-19.14747 28.583436,-41.90534 28.583436,-68.825521c0,-26.914336 -9.508608,-49.880112 -28.583436,-69.09772c-18.946243,-19.081508 -41.63314,-28.584271 -68.547477,-28.584271zm46.895939,144.861819c-13.042189,13.043024 -28.583436,19.42468 -46.895939,19.42468c-18.595557,0 -34.415683,-6.660534 -47.457872,-19.703559c-13.043024,-13.041354 -19.703559,-28.86148 -19.703559,-46.900949c0,-18.590547 6.660534,-34.130959 19.703559,-47.174818c13.043024,-13.043024 28.862315,-19.703559 47.457872,-19.703559c18.590547,0 34.060822,6.725662 46.895939,19.703559c12.977897,13.113997 19.430524,28.584271 19.430524,47.174818c0,18.318348 -6.3875,34.136804 -19.430524,47.179828z" />
					</svg>
				</div>
				<div class="mt-2 senha vazio oculto">Campo não pode estar
					vazio</div>
				<div class="mt-2 senha tamanho oculto">Campo deve conter entre
					6 e 20 caracteres</div>
				<div class="mt-2 senha invalido oculto">Senha deve conter
					letras, números ou (.@-_)</div>
			</div>


			<div class="d-flex justify-content-between">
				<button class="btn btn-primary m-2" type="submit">Entrar</button>
				<button class="btn btn-secondary m-2" type="reset">Apagar</button>
			</div>

		</form>
	</div>
</body>

</html>