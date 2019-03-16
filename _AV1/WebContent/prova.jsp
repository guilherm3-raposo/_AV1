<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@page import="java.io.PrintWriter"%>
<sql:setDataSource var="ds"
					url="jdbc:mysql://localhost:3306/av1?useSSL=true&serverTimezone=America/Sao_Paulo" 
					user="root"
					password="12345"
					scope="session"/>

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
	<c:catch var="erroNoInsert">
		<sql:transaction dataSource="${ds}">
			<sql:update var="cadPessoa">
				INSERT INTO provas (prova, questoes, observacao, dataHora, md5) VALUES (?,?,?,?,?);
				<sql:param value="${param['nome']}"></sql:param>
				<sql:param value="${param['questoes']}"></sql:param>
				<sql:param value="${param['observacoes']}"></sql:param>
				<fmt:parseDate value="${param['horaData']}" var="dataOK" pattern="yyyy-MM-dd HH:mm:ss"/>
				<sql:dateParam value="${dataOK}"></sql:dateParam>
				<sql:param value="${param['md5']}"></sql:param>
			</sql:update>
		</sql:transaction>
	</c:catch>
	<div>
		<c:out value="${param.nome}" />
	</div>
	<jsp:forward page="/UploadServlet.html"> 
		<jsp:param name="idProva" value="${param.nome}"/>
		<jsp:param name="img64" value="${param.base64}" /> 
	</jsp:forward>
</body>

</html>