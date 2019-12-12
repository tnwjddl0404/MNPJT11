<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	 	<meta charset="EUC-KR">
	 	
		<title>��ǰ���</title>
	
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
	 	/* 	body {
	            padding-top : 50px;
	        } */
	     </style>
	    
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
		  <script type="text/javascript">
		
		// Ȯ�� Event
		$(function(){
			
			$( "#confirm" ).on("click", function(){
				self.location = "/product/listProduct?menu=manage"
			})
		});
			
		//�߰���� Event
		$(function(){
			
			$( "#addRegister" ).on("click", function() {
				self.location = "/product/addProduct"
			})
		});
	
	
		</script>
	
</head>

<body>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container">

     <div class="page-header">
	       <h3 class=" text-info">��ǰ���</h3>
	       <h5 class="text-muted">����Ͻ� ��ǰ�Դϴ�.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "/images/uploadFiles/${product.fileName }"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id = "confirm">Ȯ��</button>
	  			 <a class="btn btn-primary btn" href="#" id="addRegister" role="button">�߰����</a>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
     
</body>
</html>
