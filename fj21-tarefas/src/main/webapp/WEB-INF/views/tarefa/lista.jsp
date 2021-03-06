<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
</head>
<body>
	<script type="text/javascript">
	function finalizaAgora(id){
		$.post("finalizaTarefa", {'id':id}, function(){
			//selecionando o elemento html atrav�s da 
			//id e alterando o html dele
			$("#tarefa_"+id).html("Finalizado");
		});
	}
	</script>
	<c:import url="../layouts/cabecalho.jsp" />
	<a href="novaTarefa">Criar nova tarefa</a>

	<br />
	<br />

	<table border="1" align="center">
		<tr>
			<th>Id</th>
			<th>Descri��o</th>
			<th>Finalizado?</th>
			<th>Data de finaliza��o</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr>
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td id="tarefa_${tarefa.id }"><a href="#"
						onClick="finalizaAgora(${tarefa.id})"> Finaliza agora! </a></td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true}">
					<td>Finalizado</td>
				</c:if>
				<c:choose>
					<c:when test="${tarefa.dataFinalizacao.time eq null}">
						<td>Sem data de Finaliza�ao</td>
					</c:when>
					<c:otherwise>
						<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
								pattern="dd/MM/yyyy" /></td>
					</c:otherwise>
				</c:choose>
				<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
				<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
			</tr>
		</c:forEach>
	</table>
	<c:import url="../layouts/rodape.jsp" />
</body>
</html>