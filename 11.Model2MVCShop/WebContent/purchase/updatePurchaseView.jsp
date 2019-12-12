<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <!--  ///////////////////////// JSTL  ////////////////////////// -->   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>
			<meta charset="EUC-KR">
			
			<!-- 참조 : http://getbootstrap.com/css/   참조 -->
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			
			<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
			<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		  	<link rel="stylesheet" href="/resources/demos/style.css">
		  	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		
			//달력이벤트 
			$( function() {
				$( "#datepicker" ).datepicker({
					dateFormat:"yy-mm-dd",
					showAnim:"fold"
					 });
				});
				
			//==> 추가된부분 : "수정"  Event 연결
			$(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
				 $( "#modify" ).on("click" , function() {
					var tranNo= $("input[name=tranNo]").val();
					$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?prodNo="+tranNo).submit();
					
				});
			});	
			
			//==> 추가된부분 : "취소"  Event 연결 및 처리
			$(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
				 $( "#cancel" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
					history.go(-1); //웹브라우저에서 제공하는 내장객체 history.go는 페이지가 바뀜 -> -1은 이전페이지
				});
			});
			


</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		 <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${purchase.buyer.userId}" placeholder="중복확인하세요"  readonly>
		    </div>
		  </div>
			
		 <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		     <select name="paymentOption" class="ct_input_g" style="width: 100px; height: 35px" maxLength="20">
				<c:choose>
					<c:when test="${ purchase.paymentOption.trim().equals('1') }">
						<option value="1" selected="selected">현금구매</option>
						<option value="2">신용구매</option>
					</c:when>
					
					<c:otherwise>
						<option value="1" >현금구매</option>
						<option value="2" selected="selected">신용구매</option>
					</c:otherwise>
				</c:choose>	
			 </select>
		    </div>
		  </div>
			
		 <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" placeholder="변경회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" placeholder="변경할 연락처">
		    </div>
		  </div>
			
		 <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}" placeholder="변경할 주소">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}" placeholder="구매요청사항">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="datepicker" name="divyDate"	>
		    </div>
		  </div>
			
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    	<input type="hidden" name="tranNo" value="${purchase.tranNo}">
		      <button type="button" class="btn btn-primary" id="modify">수&nbsp;정</button>
			  <a class="btn btn-primary btn "id="cancel" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form End /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div End /////////////////////////////////////-->
		
			

	

	
		



</body>
</html>