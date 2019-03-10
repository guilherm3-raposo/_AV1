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
<title>Prova</title>
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
	
	<div class="jumbotron col-xs-12 col-sm-9 col-md-6">
		<div>${param.nome}</div>
		<div>${param.questoes}</div>
		<div>${param.observacoes}</div>
		<div>${param.data}</div>
		<img src="${param.base64}" class="pic"></img>
		<div>${param.erro}</div>
		
	</div>
	<script>
		function updateImagem(imagem) {
			let imagemPrevia = document.getElementById("imagemPrevia");
			let leitor = new FileReader();
			
			leitor.onload = function(imagem) {
				let resultado = imagem.target.result; // <--- base64
				imagemPrevia.src = resultado;
			}

			leitor.readAsDataURL(imagem.files[0])
		}
		function getDataHora(obj) {
			let data = new Date();
			let dataHora = data.getFullYear() + "-" + data.getMonth() + "-" +
			data.getDate() + " " + data.getHours() + ":" + data.getMinutes();
			console.log(dataHora);
		}
	</script>
</body>

</html>