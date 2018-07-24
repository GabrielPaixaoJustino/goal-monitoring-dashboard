<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" isELIgnored ="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="snk" uri="/WEB-INF/tld/sankhyaUtil.tld" %>
<html>
<head>
	<title>HTML5 Component</title>
	<link rel="stylesheet" type="text/css" href="${BASE_FOLDER}/css/style.css">
	<snk:load/> <!-- essa tag deve ficar nesta posição -->
	
</head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<body>
		
			<snk:query var="B2B">
				select
				SUM(vlrnota) VALOR,
				100 META
				from tgfcab cab
				where TIPMOV = 'V'
				and CONVERT(date,dtfatur) = '2018-07-20'
				and cab.codvend = 1
			</snk:query>
			
			<snk:query var="VN">
				select
				SUM(vlrnota) VALOR,
				100 META
				from tgfcab cab
				where TIPMOV = 'V'
				and CONVERT(date,dtfatur) = '2018-07-20'
				and cab.codvend = 3
			</snk:query>
			
			<div id="header">
				<h2>Metas</h2><h2 style="color:red;"> & </h2><h2>Resultados</h2>
				<div id="logo" style="padding-right:15%;">
					<img src="${BASE_FOLDER}/Images/LogoAjustado2.png">
				</div>
			</div>
			
			 <c:set var = "meta" scope = "session" value = "${B2B.rows[0].VALOR}"/>
			
			
			<div id="row1">
			 <c:if test = "${meta < 1000000}">
					<div class="squareWhite" style="width:160px; color:red;">Total: <c:out value="${meta}" /></div>
			 </c:if>
			 <c:if test = "${meta >= 1000000}">
					<div class="squareWhite" style="width:160px; color:blue;background-color:red;">Total:<c:out value="${meta}" /></div>
			 </c:if>
				
				<div class="squareWhite" style="width:160px;"><c:out value="${B2B.rows[0].META}" /></div>
				<div class="squareWhite" style="width:160px;"><c:out value="${VN.rows[0].VALOR}" /></div>
				<div class="squareGreen" style="width:160px;"><c:out value="${VN.rows[0].META}" /></div>
			</div>
				
			<div id="row2">
				<div class="squareWhite" style="width:160px;"></div>
				<div class="squareWhite" style="width:160px;"></div>
				<div class="squareWhite" style="width:320px;"></div>
			</div>
			
			
		</body>
	</meta>		
</html>