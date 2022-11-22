<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	
		<meta charset="UTF-8" />
    	<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Follow </title>
	 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/index.css" />
	</head>
	
	<body>
		<section class="container" style="width: 75%">
		    <c:import url="../template/top_part.jsp"></c:import>
      		<c:import url="../template/header.jsp"></c:import>
      		<div style="margin-top: 3em; padding-bottom: 70px">
      			
      			<h3>인스타그램 팔로우 화면 캡처 (PNG)</h3>
      			
      			
 	             	<form action="/follow/getFollow" method="post" enctype="multipart/form-data">
		  				<input type="file" name="f">
			            <button class="btn btn-success" type="submit">
			            <b>전송</b>
			            </button>	              	              
					</form><br><br>
					
      			
      		</div>
    	</section>
	</body>
</html>