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
	 	/* 	body {
	            padding-top : 50px;
	        } */
	     </style>
	    
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
		  <script type="text/javascript">
	
		<%-- <a href="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}">수정</a> --%>
	
		$(function(){
			$("#modify").on("click",function(){
				self.location="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}";
			});
		});
		
		<!-- <a href="javascript:history.go(-1);">확인</a> -->
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "#confirm" ).on("click" , function() {
				 history.go(-1);
			  });
		});	
		
		$("form").attr("method" , "POST");
		
	</script>


</head>

 <body>

	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
		<!--  화면구성 div Start /////////////////////////////////////-->
		<div class="container">
		
		<h1 class="bg-primary text-center">상품상세조회</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">	
				
			<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>물품번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
			<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>구매방법</strong></div>
	  		<div class="col-xs-8 col-md-4">${purchase.paymentOption.equals("1")?"현금구매":"신용구매"}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자이름</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자연락처</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
				<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
	  		<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id ="modify">수정</button>
	  			  <a class="btn btn-primary btn" href="#" id="confirm" role="button">확인</a>
	  		</div>
		</div>
		
		
		<br/>
	   </form>
	   <!-- form end /////////////////////////////////////-->
 	
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->		
		

</body>
</html>