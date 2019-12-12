<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    

    
<!DOCTYPE html>

<html lang="ko">

<head>

	<meta charset="EUC-KR">
	
	<title>Apple</title>
	  <link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">

		<!-- 참조 : http://getbootstrap.com/css/ ==> 데스크탑 PC와 모바일 기기에서 적절히 보이는 반응형 웹을 만들기 위해서는 뷰포트 메타 태그를 사용하는것  -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
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

		//=====기존Code 주석 처리 후  jQuery 변경 ======//
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
	
		/* document.detailForm.action='/addProduct.do'; */
		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();
		
		$("form").attr("method","POST").attr("action","/product/addProduct").submit();
		}
	
	
		//onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"
				//제조일자 달력
		/*  $(function() {
			$("img[src='../images/ct_icon_date.gif']").on("click",function() {
				show_calendar($("input[name='manuDate']"),$("input[name='manuDate']").val())
			});
			
		});  */
	
		$( function() {
		    $( "#datepicker" ).datepicker({
		    	dateFormat:"yy-mm-dd",
		    	showAnim:"fold"
		    	
		    });
		  });
			
	
			//==> 추가된부분 : "등록"  Event 연결
			$(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "#register" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
				fncAddProduct();
				});
			});	
		
	
			
			/*============= jQuery 변경 주석처리 =============
			function resetData() {
					document.detailForm.reset();
			}========================================	*/
			//==> 추가된부분 : "취소"  Event 처리 및  연결
			$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "#cancel" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
				$("form")[0].reset();
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
		
				<h1 class = "bg-primary text-center"> 상 품 등 록 </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">	
	
		 <div class="form-group"> 
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">   <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명을 입력하세요">
		       <!-- <span id="helpBlock" class="help-block"> --> <!--도움말 텍스트  -->
		      	<!-- <strong class="text-danger"></strong> --> <!--입력할 멘트있으면 입력  -->
		   			<!--</span> -->
		   	 </div>
		   </div>

 		<div class="form-group"> 
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상세정보..">
			</div>
		  </div>
			
		<div class="form-group"> 
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="datepicker" name="manuDate" >
			</div>
		  </div>
		  
		<div class="form-group"> 
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="text" class="form-control" id="price" name="price" >
			</div>
		  </div>
		
		
		<div class="form-group"> 
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">  <!--offset 칼럼 왼쪽에  공백을 두고싶은 만큼 할당하는 클래스  -->
		      <input type="file" class="form-control" id="fileName" name="fileName" >
			</div>
		 </div>
		
		 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="register"  >등 &nbsp;록</button>
			  <a class="btn btn-primary btn "id="cancel" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form End /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div End /////////////////////////////////////-->
		
	</body>
	</html>