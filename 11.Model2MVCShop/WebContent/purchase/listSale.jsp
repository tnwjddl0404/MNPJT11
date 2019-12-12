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
		 /*  body {
	            padding-top : 50px;
	        } */
	    </style>
    
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
		<script type="text/javascript">
	
		function fncGetList(currentPage) {
		//	document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//   	document.detailForm.submit();	
		$("form").attr("method","POST").attr("action","/purchase/listSale").submit();
		}
		
	
		//�˻�â �������
		$(function() {
			
			//var tranNo = $(".ct_list_pop td:nth-child(1)").children("input[name='tranNo']").val();
			
			$("input[name='[searchKeyword']").keydown(function (event) {
				 if(event.keyCode == 13){//Ű�� 13�̸� ���� (���ʹ� 13)
					 fncGetList(1);
			        }
			    });
			
			//<a href="javascript:fncGetList();">�˻�</a> �˻� linl Evnet ����ó��
			$("td.ct_btn01:contains('�˻�')").on("click",function(){
				alert("ddd");
				fncGetList(1);
			});
			
			//no������ ���Ż󼼳��� ��ȸ
			$("td:nth-child(1)").on("click",function() {
				var tranNo = $(this).children("input[name='tranNo']").val();
				console.log(tranNo)
				self.location="/purchase/getPurchase?tranNo="+tranNo;
			});
		
			//
			$("td:nth-child(2)").on("click",function() {
				var userId = $(this).children("input[name='userId']").val();
				self.location="/user/getUser.do?userId="+userId;
			});	
			
			 /* <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=2">��۽���</a>  */
			//ũ����Ż�� ���� 
				//"tr.ct_list_pop:contains('��۽���')" <-- �̷����ϴϱ� ��۽����� ���ִ�... �� tranCode�� 1�̿��� tr�� ���� ��ũ�� �ɷ��� ���������� 
				//���� ��..�� 
		
		 	$("td:nth-child(6) span").on("click",function() { 
		 	/* $("tr.ct_list_pop:contains('��۽���')").on("click",function() {  */
				//console.log('1')
				 var tranNo = $("td:nth-child(6)").children("input[name='tranNo']").val();
				// alert(tranNo);
				//console.log(tranNo)
				self.location="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=2";
				//console.log('3');
			});		 
			
		 	// $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "Beige"); 
		
		 });	
			
</script>

</head>

<body>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container">
		
			<div class="page-header text-info">
		       <h3 style="color:black">�ǸŸ����ȸ</h3>
		    </div>
		    
		<!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary" style="color:black">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
	    <!--  table Start /////////////////////////////////////-->
        <table class="table table-hover table-striped" >
	      
			<thead>
	          <tr>
	            <th align="center">No</th>
	            <th align="left">ȸ��ID</th>
	            <th align="left">������</th>
	            <th align="left">����ó</th>
	            <th align="left">�����Ȳ</th>
	            <th align="left">�ŷ����º���</th>
	          </tr>
	        </thead>

			<tbody>
			  <c:set var="i" value="0" />
			  <c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
				  <td align="left" title="Click : �������� Ȯ��">
				  	<input type= "hidden" name="tranNo" value="${purchase.tranNo}">
				  	<b>${i}</b>
				  </td>
				  <td align="left"  title="Click : ��ǰ���� Ȯ��">
				   	<input type="hidden" name="userId" value="${purchase.buyer.userId}">
				   	<b>${purchase.buyer.userId}</b>
				  </td>
				  <td align="left">${purchase.receiverName}</td>
				  <td align="left">${purchase.divyRequest}</td>
				  <td align="left">
				  	 <c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim() =='1' }">
						 ���籸�ſϷ� �����Դϴ�. 
					 </c:if>
				     <c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim() =='2' }">
						 ���� ������Դϴ�.  
				     </c:if>
				     <c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim() =='3' }">
						 ���� ��ۿϷ� �����Դϴ�.  
			         </c:if>
			        </td>
			         <td align="left">
				  	 <i class="glyphicon glyphicon-ok"></i> 
				  		<c:if test = "${purchase.tranCode.trim() =='1'}">
				  	     <input type="hidden" name="tranNo" value="${purchase.tranNo }">
						   <span>��۽���</span>  
				   		</c:if>
					</td>
				</tr>
	          </c:forEach>
	        </tbody>

 	 	</table>
	 	 <!--  table End /////////////////////////////////////-->
	  
 	 </div>
 	 <!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	





	


</body>
</html>