<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	 	<meta charset="EUC-KR">

		<!-- ���� : http://getbootstrap.com/css/   ���� -->
		 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<!-- Bootstrap Dropdown Hover CSS -->
	     <link href="/css/animate.min.css" rel="stylesheet">
	     <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	   
	    <!-- Bootstrap Dropdown Hover JS -->
	     <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		 <style>
	 		body {
	         
	        }
	     </style>
	    
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
		  <script type="text/javascript">
	

		//���� event
		$(function(){
			$("#purchase").on("click",function(){
			//	alert('${product.prodNo}');
				self.location="/purchase/addPurchase?prodNo=${product.prodNo}"
				
			 })
		 })
	
		//���� Event
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "#previous" ).on("click" , function() {
				 history.go(-1);
			  });
		});	

         //		<!-- <form name="detailForm" method="post"> -->
		$("form").attr("method" , "POST");
 
	</script>
	
</head>

 <body>

		<!-- ToolBar Start ==> ��ȸ���϶�! ȸ���϶�! /////////////////////////////////////-->
		<c:choose>
			<c:when test="${sessionScope.user.role != 'admin' && sessionScope.user.role != 'user'}">
				<div class="navbar  navbar-default">
			        <div class="container">
			        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
			   		</div>
			   	</div>
			</c:when>
		
			<c:otherwise>
				<jsp:include page="/layout/toolbar.jsp" />
			</c:otherwise>
		</c:choose>
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">��ǰ����ȸ</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
		<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "/images/uploadFiles/${product.fileName }" style="width: 60%;"/></div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
	  		<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-md-12 text-center ">
	  		<c:if test= "${! empty user}">
	  			<button type="button" class="btn btn-primary" id = "purchase">����</button>
	  		</c:if>
	  			 <a class="btn btn-primary btn" href="#" id="previous" role="button">����</a>
	  		</div>
		</div>
		
		<br/>
	   </form>
	   <!-- form end /////////////////////////////////////-->
 	
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
</body>
</html>