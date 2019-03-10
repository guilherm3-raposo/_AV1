<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.beans.ProvaBean"%>
<%@ page language="java" import="java.time.LocalDateTime"%>
<%@ page language="java" import="java.time.format.DateTimeFormatter"%>

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

<meta charset="UTF-8">

</head>

<body class="d-flex justify-content-center align-items-lg-center">
	<%
		session.setAttribute("dataHora", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
	%>

	<div class="jumbotron col-xs-12 col-sm-9 col-md-6">
		
		<form action="prova" method="post" enctype="multipart/form-data"
			class="d-flex flex-column justify-content-center">

			<div class="frame m-2">
				<img alt="" src="" class="pic" id="imagemPrevia">
			</div>
			
			
			<div class="m-2">
				<c:out value="${dataHora}"></c:out>
			</div>
			
			<input type="text" name="nome" class="m-2" placeholder="ID da prova" required="required" /> 
			
			<input type="textarea" name="questoes" class="m-2" placeholder="Questões" required="required" /> 
			
			<input type="textarea" name="observacoes" class="m-2" placeholder="Observações" required="required" />
			
			<div class="w-100 m-2">
				<input type="file" name="imagem" class="btn" required="required" onchange="updateImagem(this)" />
				<input type="hidden" name="base64" value=""/>
			</div>

			<div class="m-2 d-flex justify-content-between">
				<button class="btn btn-danger" type="reset">Cancelar</button>
				<button class="btn btn-primary" type="submit">Enviar</button>
			</div>
			<div class="mt-2 senha vazio oculto">Campo não pode estar vazio</div>
			<div class="mt-2 senha tamanho oculto">Campo deve conter entre
				6 e 20 caracteres</div>
			<div class="mt-2 senha invalido oculto">Senha deve conter
				letras, números ou (.@-_)</div>
		</form>
	</div>
	<script>
		function updateImagem(imagem) {
			let imagemPrevia = document.getElementById("imagemPrevia");
			let base64 = document.querySelector("input[name='base64']");
			let leitor = new FileReader();

			leitor.onload = function(imagem) {
				let resultado = imagem.target.result; // <--- base64
				imagemPrevia.src = resultado;
				base64.value = resultado;
			}

			leitor.readAsDataURL(imagem.files[0])
			
		}
	</script>
</body>

</html>