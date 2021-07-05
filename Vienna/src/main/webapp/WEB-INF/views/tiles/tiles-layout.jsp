<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 공통변수 처리 -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application"/>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript">
		var CONTEXT_PATH = "${CONTEXT_PATH}";
		var RESOURCES_PATH = "${RESOURCES_PATH}";
	</script>
	<script src="${RESOURCES_PATH}/js/common/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="${RESOURCES_PATH}/css/vn_common.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
  
  <body>
  	<div align="center" class='wrap'>
  		<tiles:insertAttribute name="header" />
		  <div align="center" class='content'>  	
  			<%-- <tiles:insertAttribute name="left"/> --%>
	  		<div align="center" class="page_content">
	  			<tiles:insertAttribute name="body"/>
	  		</div>
  		</div>
  		<tiles:insertAttribute name="foot" />
  	</div>
  </body>
  
</html>