<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.bd.dao.ProvaDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="model.beans.ProvaBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.Map"%>


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

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
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

<sql:setDataSource var="ds"
	url="jdbc:mysql://localhost:3306/av1?useSSL=true&serverTimezone=America/Sao_Paulo"
	user="root" password="12345" scope="session" />

</head>

<body class="bg-light-gray">
	<%
		ProvaDAO provaDAO = new ProvaDAO();
		Map<String, String> imagensMapa = provaDAO.consultaTodos();
	%>
	<sql:query var="provas" dataSource="${ds}">
		SELECT * FROM PROVAS ORDER BY prova;
	</sql:query>
	
	<div class="pos-f-t">
		<nav class="navbar navbar-dark bg-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
	      		<span class="navbar-toggler-icon"></span>
		    </button>
			<select name="provaSelecionada" onchange="mostraProva(this.value)">
				<option value="" selected disabled hidden>Provas</option>
				<c:forEach var="item" items="${provas.rows}">
					<option name="${item.prova}">${item.prova}</option>
				</c:forEach>
			</select> 
		</nav>
		<div class="collapse" id="navbarToggleExternalContent">
	    	<div class="bg-dark p-4">
				<div class="p-2"><a class="txt-white" href="/inicio.jsp">Nova Prova</a></div>
				<div class="p-2"><a class="txt-white" href="/download.jsp">Download do Código Fonte</a></div>
				<div class="p-2"><a class="txt-white" href="https://github.com/xXxYtfoxXx/_AV1">GitHub</a></div>
				<div class="p-2"><a class="text-danger" href="/index.jsp">Sair</a></div>
			</div>
	  	</div>
	</div>
	
	<h1 class="item">Selecione uma prova</h1>
	
	<c:forEach var="item" items="${ provas.rows }">
		<div id="${item.prova}" class="item oculto">
			<c:set var="pk" value="${item.prova}"></c:set>
			<div class="d-flex col-12 row p-2">
				<div class="col-xs-12 col-lg-4 p-3">
					<hr>
					<h1 class="p-2"><c:out value="${item.prova}"></c:out></h1>
					<hr>
					<div>
						<strong>Data do acesso: </strong>
						<div>
							<fmt:formatDate value="${item.dataHora}"
								pattern="dd/MM/yyyy - HH:mm:ss" />
						</div>
					</div>
					<hr>
					<div>
						<strong>MD5: </strong>
						<c:out value="${item.md5}"></c:out>
					</div>
				</div>
				<div class="imagem col-xs-12 col-lg-8">
					<img alt="" src='<%=(String) imagensMapa.get(pageContext.getAttribute("pk"))%>'>
				</div>
			</div>
			<div class="bg-secondary text-white p-4">
				<h2>Corpo da Prova</h2>
				<c:out value="${item.questoes}"></c:out>
			</div>
			<div class="p-4">
				<strong>Observações</strong>
				<c:out value="${item.observacao}"></c:out>
			</div>
		</div>
	</c:forEach>
</body>

</html>