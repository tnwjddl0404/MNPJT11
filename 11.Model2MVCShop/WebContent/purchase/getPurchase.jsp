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
	 	/* 	body {
	            padding-top : 50px;
	        } */
	     </style>
	    
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
		  <script type="text/javascript">
	
		<%-- <a href="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}">����</a> --%>
	
		$(function(){
			$("#modify").on("click",function(){
				self.location="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}";
			});
		});
		
		<!-- <a href="javascript:history.go(-1);">Ȯ��</a> -->
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
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
	
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container">
		
		<h1 class="bg-primary text-center">��ǰ����ȸ</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">	
				
			<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
			<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>���Ź��</strong></div>
	  		<div class="col-xs-8 col-md-4">${purchase.paymentOption.equals("1")?"���ݱ���":"�ſ뱸��"}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
				<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>�������ּ�</strong></div>
	  		<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ڿ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>�ֹ���</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id ="modify">����</button>
	  			  <a class="btn btn-primary btn" href="#" id="confirm" role="button">Ȯ��</a>
	  		</div>
		</div>
		
		
		<br/>
	   </form>
	   <!-- form end /////////////////////////////////////-->
 	
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->		
		

</body>
</html>