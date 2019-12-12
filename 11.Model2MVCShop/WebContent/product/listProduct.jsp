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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
	
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
	//document.getElementById("currentPage").value = currentPage;
	$("#currentPage").val(currentPage)
   	//document.detailForm.submit();		
	$("form").attr("method","POST").attr("action","/product/listProduct?menu=${menu}").submit();
	
   }

	//�˻��̺�Ʈ =>Ű���� ���� ������ �˻�
	//onkeydown ="javascript:if(event.keyCode==13){fncGetList(1);}"
	 $(function() {
		 
		    $( "#searchKeyword" ).autocomplete({
		        source : function( request, response ) {
					 var searchKeyword = $("#searchKeyword").val();
					 console.log(searchKeyword+'�� ��ǰ�� �˻�');   
		            },
		        //��ȸ�� ���� �ּұ��ڼ�
		        minLength: 1,
		        select: function( event, ui ) {
		            // ���� �˻�����Ʈ���� �����Ͽ����� ������ �����Ϳ� ���� �̺�Ʈ�߻�
		        }
		    });
		 
		$("input[name='searchKeyword']").keydown(function (event) {
		 if(event.keyCode == 13){//Ű�� 13�̸� ���� (���ʹ� 13)
			 fncGetList(1);
	        }
	    });
	
	//<a href="javascript:fncGetList();">�˻�</a> �˻� linl Evnet ����ó��
		$("#search").on("click",function(){

		fncGetList(1);
	});
	
		//���� event
		$("#purchaseBtn").on("click",function(){
			var prodNo = $(this).children("input[name=prodNo]").val();
			self.location="/purchase/addPurchase?prodNo="+prodNo;
			
		 });
	 
	
	/* <a href="/product/updateProduct?prodNo=${product.prodNo }">${product.prodName }</a> */
		$("a:contains('�󼼺���')").on("click",function(){
		var prodNo = $(this).children("input[name=prodNo]").val();
		//var prodNo = $("input[name=prodNo]").val();
		self.location="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu=='manage' ?'manage':'search'}";
	 	});

	
		//List ���� ��ũ
		/* <a href="/product/updateProduct?prodNo=${product.prodNo }">${product.prodName }</a> */
	//	$("td:nth-child(2)").on("click",function(){
	//	var prodNo = $(this).children("input[name=prodNo]").val();
	//	self.location="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu=='manage' ?'manage':'search'}";
	// 	});
		
	 // $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "Beige"); 

	 });
	
	//============= ȸ������ ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('�� �� ��')").on("click" , function() {
				self.location = "/user/login"
			});
		});
</script>	

</head>


<body>
		<!-- ToolBar Start ==> ��ȸ���϶�! ȸ���϶�! /////////////////////////////////////-->
		<c:choose>
			<c:when test="${sessionScope.user.role != 'admin' && sessionScope.user.role != 'user'}">
				<div class="navbart">
			        <div class="container">
			        	<a class="navbar-brand" href="/index.jsp" style="padding:0px 0px"><img src="/images/apple11.PNG"style="width:50px; height:50px;"></a>
			        	<ul class="nav navbar-nav navbar-right">
	                 <li><a  style="color:black" href="#" style="color: white">ȸ������</a></li>
	                 <li><a style="color:black"  href="#" style="color: white">�� �� ��</a></li>
	           	</ul>
			   		</div>
			</c:when>
		
			<c:otherwise>
				<jsp:include page="/layout/toolbar.jsp" />
			</c:otherwise>
		</c:choose>
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	
	 	<div class="container">
			<div class="page-header text-info">
		       <h3 class="text-info" style="color:black" >${param.menu =='manage'?"��ǰ����":"��ǰ�����ȸ" }</h3>
		    </div>

	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left" style="color:white">
		    	<p class="text-primary" style="color:black">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" } selected="selected">��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="search">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		<!--//////List ����/////// -->
	    <!--  table Start /////////////////////////////////////-->
      <%--   <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">��ǰ��</th>
            <th align="left">����</th>
            <th align="left">������</th>
            <th align="left">�������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">${ i }</td>
			  <td align="left"  title="Click : ��ǰ���� Ȯ��">
			   	<input type="hidden" name = "prodNo" value ="${product.prodNo}">${product.prodName}</td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.prodDetail}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok"></i> �Ǹ���</td>
			</tr>
          </c:forEach>
        
        </tbody> 
      
      </table> --%>
	  <!--  table End /////////////////////////////////////--> 
	  
	  
	  <br/>
	  
	  <!--//////Thumbnail ����/////// -->
	  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />	
	
		<div class="row">
		  <div class="col-xs-6 col-md-3">
		    <div class="thumbnail">
		      <img src="/images/uploadFiles/${product.fileName}" alt="�̹����� �غ����Դϴ�." style="width:200px; height:250px">
		      <div class="caption">
		        <h5>${product.prodName}</h5>
		        <p>���� :<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="��"/>
		        </p>
		        <c:if test= "${! empty user}">
		       	 	<p><a href="#" class="btn btn-default" role="button" id=purchaseBtn>����
		        		<input type="hidden" name = "prodNo" value ="${product.prodNo}"></a>
		        </c:if>	
		        	 <a href="#" class="btn btn-primary" role="button">�󼼺���
		           		<input type="hidden" name = "prodNo" value ="${product.prodNo}"></a>
		        </p>
		      </div>
		    </div>
		  </div>
		 </c:forEach>
		</div>
			
	  
	  
	  
 	<!-- </div> -->
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
	
	
	
	

		
		
		
		
	
	
	

</body>
</html>
