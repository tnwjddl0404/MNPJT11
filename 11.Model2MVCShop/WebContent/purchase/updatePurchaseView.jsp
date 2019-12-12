<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <!--  ///////////////////////// JSTL  ////////////////////////// -->   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>
			<meta charset="EUC-KR">
			
			<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		
			//�޷��̺�Ʈ 
			$( function() {
				$( "#datepicker" ).datepicker({
					dateFormat:"yy-mm-dd",
					showAnim:"fold"
					 });
				});
				
			//==> �߰��Ⱥκ� : "����"  Event ����
			$(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
				 $( "#modify" ).on("click" , function() {
					var tranNo= $("input[name=tranNo]").val();
					$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?prodNo="+tranNo).submit();
					
				});
			});	
			
			//==> �߰��Ⱥκ� : "���"  Event ���� �� ó��
			$(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
				 $( "#cancel" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('���')" ).html() );
					history.go(-1); //������������ �����ϴ� ���尴ü history.go�� �������� �ٲ� -> -1�� ����������
				});
			});
			


</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">������������</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		 <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${purchase.buyer.userId}" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		    </div>
		  </div>
			
		 <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		     <select name="paymentOption" class="ct_input_g" style="width: 100px; height: 35px" maxLength="20">
				<c:choose>
					<c:when test="${ purchase.paymentOption.trim().equals('1') }">
						<option value="1" selected="selected">���ݱ���</option>
						<option value="2">�ſ뱸��</option>
					</c:when>
					
					<c:otherwise>
						<option value="1" >���ݱ���</option>
						<option value="2" selected="selected">�ſ뱸��</option>
					</c:otherwise>
				</c:choose>	
			 </select>
		    </div>
		  </div>
			
		 <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" placeholder="����ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" placeholder="������ ����ó">
		    </div>
		  </div>
			
		 <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}" placeholder="������ �ּ�">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}" placeholder="���ſ�û����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="datepicker" name="divyDate"	>
		    </div>
		  </div>
			
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    	<input type="hidden" name="tranNo" value="${purchase.tranNo}">
		      <button type="button" class="btn btn-primary" id="modify">��&nbsp;��</button>
			  <a class="btn btn-primary btn "id="cancel" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form End /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
		
			

	

	
		



</body>
</html>