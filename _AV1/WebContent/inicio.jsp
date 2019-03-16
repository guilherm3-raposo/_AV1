<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.beans.ProvaBean"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<base href="/" />
<title>Início</title>
<!-- DEPENDENCIAS __CSS__-->
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/bootstrap.css" />
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

<body class="bg-light-gray">
	<div class="pos-f-t">
		<nav class="navbar navbar-dark bg-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
	      		<span class="navbar-toggler-icon"></span>
		    </button>
		</nav>
		<div class="collapse" id="navbarToggleExternalContent">
	    	<div class="bg-dark p-4">
				<div class="p-2"><a class="txt-white" href="/prova.jsp">Vizualizar Provas</a></div>
				<div class="p-2"><a class="txt-white" href="/download.jsp">Download do Código Fonte</a></div>
				<div class="p-2"><a class="txt-white" href="https://github.com/xXxYtfoxXx/_AV1">GitHub</a></div>
				<div class="p-2"><a class="btn btn-outline-danger text-danger w-25" href="/index.jsp">Sair</a></div>
			</div>
	  	</div>
	</div>
	<form action="/prova.jsp" method="post"
		class="row mt-5 w-100 justify-content-around align-items-center">

		<div class="m-2 col-xs-8 col-md-6 d-flex justify-content-center">
			<img alt="" src="" class="pic" id="imagemPrevia">
		</div>

		<div class="m-2 col-xs-8 col-md-4">
			<h2 class="text-white w-100">
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" var="blah"
					pattern="yyyy-MM-dd HH:mm:ss" />
				<input type="hidden" value="${blah}" name="horaData" />
			</h2>
			
			<input type="text" name="md5" class="w-100 mt-3" placeholder="Checksum"
				required="required"	onblur="Validator.checkInput(this)" />
			<div class="mt-2 md5 vazio oculto">Campo não pode estar vazio</div>
			<div class="mt-2 md5 tamanho oculto">Campo deve conter entre mais de 6 caracteres</div>
			<div class="mt-2 md5 invalido oculto">Formato inválido</div>
				
			<input type="text" name="nome" class="w-100 mt-3" placeholder="ID da prova"
				required="required" onblur="Validator.checkInput(this)" /> 
			<div class="mt-2 nome vazio oculto">Campo não pode estar vazio</div>
			<div class="mt-2 nome tamanho oculto">Campo deve conter entre 6 e 20 caracteres</div>
			<div class="mt-2 nome invalido oculto">Informe um nome válido</div>
				
			<input type="textarea" name="questoes" class="w-100 mt-3" placeholder="Questões" 
				required="required"	onblur="Validator.checkInput(this)" />
			<div class="mt-2 questoes vazio oculto">Campo não pode estar vazio</div>
			<div class="mt-2 questoes tamanho oculto">Campo deve conter mais de 6 caracteres</div>
			
			<input type="textarea" name="observacoes" class="w-100 mt-3" placeholder="Observações" 
				required="required"	onblur="Validator.checkInput(this)" />
			<div class="mt-2 observacoes vazio oculto">Campo não pode estar vazio</div>
			<div class="mt-2 observacoes tamanho oculto">Campo deve conter mais de 6 caracteres</div>

			<div class="w-100 mt-5 d-flex justify-content-center">
				<input type="file" id="imagem" name="imagem" hidden onchange="updateImagem(this)" 
					required="required"	onblur="Validator.checkInput(this)"/> 
				<label for="imagem" class="btn btn-dark">Escolher Imagem</label>
				<input type="hidden" name="base64" value="" />
			</div>
			<div class="mt-2 imagem vazio oculto">Campo não pode estar vazio</div>
			<div class="mt-2 imagem invalido oculto">Arquivo inválido</div> 

			<div class="w-100 mt-3 d-flex justify-content-between">
				<button class="btn btn-danger" type="reset">Cancelar</button>
				<button class="btn btn-primary" type="submit">Enviar</button>
			</div>
		</div>
	</form>
</body>

</html>