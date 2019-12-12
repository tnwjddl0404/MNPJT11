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
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
 	 <script type="text/javascript">
  	


		function fncAddProduct(){
		//Form 유효성 검증
	 	//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
		
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price =$("input[name='price']").val();
		
		
		if(name == null || name.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
			
		/* document.detailForm.action='/updateProduct.do?prodNo=${product.prodNo}&menu=manage'; */
		//document.detailForm.action='/product/updateProduct?prodNo=${product.prodNo}&menu=manage';
		//document.detailForm.submit();
		
		$("form").attr("method","POST").attr("action","/product/updateProduct?prodNo=${product.prodNo}&menu=manage").submit();
		
	}
	
		$( function() {
		    $( "#datepicker" ).datepicker({
		    	dateFormat:"yy-mm-dd",
		    	showAnim:"fold"
		    	
		    });
		  } );
	
		//==> 추가된부분 : "수정"  Event 연결
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "#modify" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
				fncAddProduct();
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
	       <h3 class=" text-info">상품정보수정</h3>
	       <h5 class="text-muted">상품정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		
			<div class="form-group"> 
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">   <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명을 입력하세요" value="${product.prodName}">
		       <!-- <span id="helpBlock" class="help-block"> --> <!--도움말 텍스트  -->
		      	<!-- <strong class="text-danger"></strong> --> <!--입력할 멘트있으면 입력  -->
		   			<!--</span> -->
		   	 </div>
		   </div>

 		<div class="form-group"> 
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상세정보.." value="${product.prodDetail}">
			</div>
		  </div>
			
		<div class="form-group"> 
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="datepicker" name="manuDate" value="${product.manuDate}">
			</div>
		  </div>
		  
		<div class="form-group"> 
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}">
			</div>
		  </div>
		
		
		<div class="form-group"> 
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="file" class="form-control" id="fileName" name="fileName" value="/images/uploadFiles/${product.fileName}">
			</div>
		 </div>
		
		 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
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
