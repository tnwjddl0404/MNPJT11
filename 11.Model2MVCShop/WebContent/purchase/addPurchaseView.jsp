<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>

		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 		 <link rel="stylesheet" href="/resources/demos/style.css">
		 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  

		<!-- Bootstrap Dropdown Hover CSS -->
	     <link href="/css/animate.min.css" rel="stylesheet">
	     <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	   
	    <!-- Bootstrap Dropdown Hover JS -->
	     <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		 <style>
	 		/* body {
	            padding-top : 50px;
	        } */
	     </style>
	  	<!--  ///////////////////////// JavaScript ////////////////////////// -->
		 	 <script type="text/javascript">   


		/* function fncAddPurchase() {
			/* document.addPurchase.submit(); */
			/* $("form").attr("method","POST").attr("action","/purchase/addPurchase?prodNo=${product.prodNo}&userId=${user.userId}").submit();
		
		} */ 

		//달력이벤트 
		$( function() {
    		$( "#datepicker" ).datepicker({
    			dateFormat:"yy-mm-dd",
    			showAnim:"fold"
   			 	});
  			});

		/* <a href="javascript:fncAddPurchase();">구매</a> */
		$(function(){
			
			$("#purchase").on("click",function(){
				
				$("form").attr("method","POST").attr("action","/purchase/addPurchase?prodNo=${product.prodNo}").submit();
			});
		});
	
	
		/* <a href="javascript:history.go(-1)">취소</a> */
		$(function(){
			
			$("#cancel").on("click",function(){
			history.go(-1);
				
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
		
				<h1 class = "bg-primary text-center"> 구 매 </h1>
		
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
		
<%-- 		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "/images/uploadFiles/${product.fileName }"/></div>
		</div>
		
		<hr/> --%>
		
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
		<!--///////////////// ↑ 상품정보불러오기 ↑ //////////////////////////-->		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		
		 <div class="form-group"> 
		    <label for="paymentOption" class="col-xs-4 col-md-2">구매방법</label>
		    <div class="col-xs-8 col-md-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
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
		 
		 <hr/>
		 
		  <div class="form-group"> 
		    <label for="receiverName" class="col-xs-4 col-md-2">구매자이름</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="receiverName" style="width: 200px;" 
		      								name="receiverName" value="${user.userName}">
			</div>
		  </div>
		  
		  	 <hr/>
		 <div class="form-group"> 
		    <label for="receiverPhone" class="col-xs-4 col-md-2">구매자연락처</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
			</div>
		  </div>

		  	<hr/>
		 
		  <div class="form-group"> 
		    <label for="divyAddr" class="col-xs-4 col-md-2">구매자주소</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${user.addr}">
			</div>
		  </div>
		
			<hr/>
		 
		  <div class="form-group"> 
		    <label for="divyRequest" class="col-xs-4 col-md-2">구매요청사항</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="요청사항을 입력해주세요..">
			</div>
		  </div>
		
			<hr/>
			
		 <div class="form-group"> 
		    <label for="divyDate" class="col-xs-4 col-md-2">배송희망일자</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="datepicker" name="divyDate" >
			</div>
		  </div>
		  
		  <hr/>

		<div class="form-group">
	  		<div class="col-md-12 text-center ">
	  		<c:if test= "${! empty user}">
	  			<button type="button" class="btn btn-primary" id ="purchase">구매</button>
	  		</c:if>
	  			 <a class="btn btn-primary btn" href="#" id="cancel" role="button">취소</a>
	  		</div>
		</div>
		
		<br/>
	   </form>
	   <!-- form end /////////////////////////////////////-->
 	
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
	

</body>
</html>