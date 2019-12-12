<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 <!--  ///////////////////////// JSTL  ////////////////////////// -->   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
	<meta charset="EUC-KR">
	
<title>Apple</title>
	  <link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">


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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	/*   body {
 		padding-top : 50px;
        } */
        
        .thumbnail { 
			max-width: 250px;
			 height: auto;
			 
		}


    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
	//document.getElementById("currentPage").value = currentPage;
	$("#currentPage").val(currentPage)
   	//document.detailForm.submit();		
	$("form").attr("method","POST").attr("action","/product/listProduct?menu=${menu}").submit();
	
   }

	//검색이벤트 =>키보드 엔터 누르면 검색
	//onkeydown ="javascript:if(event.keyCode==13){fncGetList(1);}"
	 $(function() {
		 
		    $( "#searchKeyword" ).autocomplete({
		        source : function( request, response ) {
					 var searchKeyword = $("#searchKeyword").val();
					 console.log(searchKeyword+'로 상품명 검색');   
		            },
		        //조회를 위한 최소글자수
		        minLength: 1,
		        select: function( event, ui ) {
		            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
		        }
		    });
		 
		$("input[name='searchKeyword']").keydown(function (event) {
		 if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			 fncGetList(1);
	        }
	    });
	
	//<a href="javascript:fncGetList();">검색</a> 검색 linl Evnet 연결처리
		$("#search").on("click",function(){

		fncGetList(1);
	});
	
		//구매 event
		$("#purchaseBtn").on("click",function(){
			var prodNo = $(this).children("input[name=prodNo]").val();
			self.location="/purchase/addPurchase?prodNo="+prodNo;
			
		 });
	 
	
	/* <a href="/product/updateProduct?prodNo=${product.prodNo }">${product.prodName }</a> */
		$("a:contains('상세보기')").on("click",function(){
		var prodNo = $(this).children("input[name=prodNo]").val();
		//var prodNo = $("input[name=prodNo]").val();
		self.location="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu=='manage' ?'manage':'search'}";
	 	});

	
		//List 사용시 링크
		/* <a href="/product/updateProduct?prodNo=${product.prodNo }">${product.prodName }</a> */
	//	$("td:nth-child(2)").on("click",function(){
	//	var prodNo = $(this).children("input[name=prodNo]").val();
	//	self.location="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu=='manage' ?'manage':'search'}";
	// 	});
		
	 // $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "Beige"); 

	 });
	
	//============= 회원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
			});
		});
</script>	

</head>


<body>
		<!-- ToolBar Start ==> 비회원일때! 회원일때! /////////////////////////////////////-->
		<c:choose>
			<c:when test="${sessionScope.user.role != 'admin' && sessionScope.user.role != 'user'}">
				<div class="navbart">
			        <div class="container">
			        	<a class="navbar-brand" href="/index.jsp" style="padding:0px 0px"><img src="/images/apple11.PNG"style="width:50px; height:50px;"></a>
			        	<ul class="nav navbar-nav navbar-right">
	                 <li><a  style="color:black" href="#" style="color: white">회원가입</a></li>
	                 <li><a style="color:black"  href="#" style="color: white">로 그 인</a></li>
	           	</ul>
			   		</div>
			</c:when>
		
			<c:otherwise>
				<jsp:include page="/layout/toolbar.jsp" />
			</c:otherwise>
		</c:choose>
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!--  화면구성 div Start /////////////////////////////////////-->
	
	 	<div class="container">
			<div class="page-header text-info">
		       <h3 class="text-info" style="color:black" >${param.menu =='manage'?"상품관리":"상품목록조회" }</h3>
		    </div>

	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left" style="color:white">
		    	<p class="text-primary" style="color:black">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" } selected="selected">상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="search">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		<!--//////List 형식/////// -->
	    <!--  table Start /////////////////////////////////////-->
      <%--   <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">상품명</th>
            <th align="left">가격</th>
            <th align="left">상세정보</th>
            <th align="left">현재상태</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">${ i }</td>
			  <td align="left"  title="Click : 상품정보 확인">
			   	<input type="hidden" name = "prodNo" value ="${product.prodNo}">${product.prodName}</td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.prodDetail}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok"></i> 판매중</td>
			</tr>
          </c:forEach>
        
        </tbody> 
      
      </table> --%>
	  <!--  table End /////////////////////////////////////--> 
	  
	  
	  <br/>
	  
	  <!--//////Thumbnail 형식/////// -->
	  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />	
	
		<div class="row">
		  <div class="col-xs-6 col-md-3">
		    <div class="thumbnail">
		      <img src="/images/uploadFiles/${product.fileName}" alt="이미지를 준비중입니다." style="width:200px; height:250px">
		      <div class="caption">
		        <h5>${product.prodName}</h5>
		        <p>가격 :<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="￦"/>
		        </p>
		        <c:if test= "${! empty user}">
		       	 	<p><a href="#" class="btn btn-default" role="button" id=purchaseBtn>구매
		        		<input type="hidden" name = "prodNo" value ="${product.prodNo}"></a>
		        </c:if>	
		        	 <a href="#" class="btn btn-primary" role="button">상세보기
		           		<input type="hidden" name = "prodNo" value ="${product.prodNo}"></a>
		        </p>
		      </div>
		    </div>
		  </div>
		 </c:forEach>
		</div>
			
	  
	  
	  
 	<!-- </div> -->
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
	
	
	
	

		
		
		
		
	
	
	

</body>
</html>
