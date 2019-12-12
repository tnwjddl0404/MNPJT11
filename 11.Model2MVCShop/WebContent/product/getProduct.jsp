<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	 	<meta charset="EUC-KR">

		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	

		//구매 event
		$(function(){
			$("#purchase").on("click",function(){
			//	alert('${product.prodNo}');
				self.location="/purchase/addPurchase?prodNo=${product.prodNo}"
				
			 })
		 })
	
		//이전 Event
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "#previous" ).on("click" , function() {
				 history.go(-1);
			  });
		});	

         //		<!-- <form name="detailForm" method="post"> -->
		$("form").attr("method" , "POST");
 
	</script>
	
</head>

 <body>

		<!-- ToolBar Start ==> 비회원일때! 회원일때! /////////////////////////////////////-->
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
	   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">상품상세조회</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
		<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "/images/uploadFiles/${product.fileName }" style="width: 60%;"/></div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
	  		<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>가 격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-md-12 text-center ">
	  		<c:if test= "${! empty user}">
	  			<button type="button" class="btn btn-primary" id = "purchase">구매</button>
	  		</c:if>
	  			 <a class="btn btn-primary btn" href="#" id="previous" role="button">이전</a>
	  		</div>
		</div>
		
		<br/>
	   </form>
	   <!-- form end /////////////////////////////////////-->
 	
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
</body>
</html>