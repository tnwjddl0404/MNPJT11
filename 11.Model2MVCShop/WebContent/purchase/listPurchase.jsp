<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
  <!--  ///////////////////////// JSTL  ////////////////////////// -->   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		   /* body {
	            padding-top : 50px;
	        }  */
	        
	       
	    </style>
    
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
		<script type="text/javascript">
		function fncGetList(currentPage) {
				$("#currentPage").val(currentPage)
				var curPage= $("#currentpage").val()
				
				$("form").attr("method","POST").attr("action","/purchase/listPurchase?curPage="+curPage).submit();
	
		}
		
		 $(function() {
		
			 //tranNo누르면 구매상세내역 조회
		<%-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${i}</a> --%>
		$("td:nth-child(1)").on("click",function(){
			var tranNo = $(this).children("input[name='tranNo']").val();
			self.location="/purchase/getPurchase?tranNo="+tranNo;
		});
	 
		
		//user 누르면 user 상세보기 
		<%-- <a href="/user/getUser?userId=${user.userId}">${user.userId}</a> --%>
		$("td:nth-child(2)").on("click",function(){
			var userId = $(this).children("input[name='userId']").val();
			self.location="/user/getUser?userId="+userId;
		});
		
		/* <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3&managerCheck=N">구매확정</a> */
		$("td:nth-child(6) span").on("click",function(){
			var tranNo = $("td:nth-child(6)").children("input[name='tranNo']").val();		
			self.location="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3&managerCheck=N";
			});
		
			// $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "Beige"); 
		
		 });
</script>

</head>

<body>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!--  화면구성 div Start /////////////////////////////////////-->
		<div class="container">
		
			<div class="page-header text-info">
		       <h3>구매목록조회</h3>
		    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
	    <!--  table Start /////////////////////////////////////-->
        <table class="table table-hover table-striped" >
      
		<thead>
          <tr>
            <th align="center">No</th>
            <th align="left">회원ID</th>
            <th align="left">회원명</th>
            <th align="left">구매요청사항</th>
            <th align="left">배송현황</th>
            <th align="left">거래상태변경</th>
          </tr>
        </thead>
       
		<tbody>
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="ct_list_pop">
			  <td align="left" title="Click : 구매정보 확인">
			  	<input type= "hidden" name="tranNo" value="${purchase.tranNo}">
			  	<b>${i}</b>
			  </td>
			  <td align="left"  title="Click : 상품정보 확인">
			   	<input type="hidden" name="userId" value="${user.userId}">
			   	<b>${user.userId}</b>
			  </td>
			  <td align="left">${user.userName}</td>
			  <td align="left">${purchase.divyRequest}</td>
			  <td align="left">
			  	 <c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim() =='1' }">
					 현재구매완료 상태입니다. 
				 </c:if>
			     <c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim() =='2' }">
					 현재 배송중입니다.  
			     </c:if>
			     <c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim() =='3' }">
					 현재 배송완료 상태입니다.  
		         </c:if>
		        </td>
		         <td align="left">
			  	 <i class="glyphicon glyphicon-ok"></i> 
			  		<c:if test = "${purchase.tranCode.trim() =='2'}">
			  	     <input type="hidden" name="tranNo" value="${purchase.tranNo }">
					   <span>구매확정</span>  
			   		</c:if>
				</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	

		
</body>
</html>