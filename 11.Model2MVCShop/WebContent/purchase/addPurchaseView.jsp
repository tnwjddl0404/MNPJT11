<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>

		<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

		//�޷��̺�Ʈ 
		$( function() {
    		$( "#datepicker" ).datepicker({
    			dateFormat:"yy-mm-dd",
    			showAnim:"fold"
   			 	});
  			});

		/* <a href="javascript:fncAddPurchase();">����</a> */
		$(function(){
			
			$("#purchase").on("click",function(){
				
				$("form").attr("method","POST").attr("action","/purchase/addPurchase?prodNo=${product.prodNo}").submit();
			});
		});
	
	
		/* <a href="javascript:history.go(-1)">���</a> */
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
	
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container">
		
				<h1 class = "bg-primary text-center"> �� �� </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">	


		<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
<%-- 		<div class="form-group">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "/images/uploadFiles/${product.fileName }"/></div>
		</div>
		
		<hr/> --%>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
	  		<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		<!--///////////////// �� ��ǰ�����ҷ����� �� //////////////////////////-->		
		<hr/>
		
		<div class="form-group">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		
		 <div class="form-group"> 
		    <label for="paymentOption" class="col-xs-4 col-md-2">���Ź��</label>
		    <div class="col-xs-8 col-md-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
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
		 
		 <hr/>
		 
		  <div class="form-group"> 
		    <label for="receiverName" class="col-xs-4 col-md-2">�������̸�</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="receiverName" style="width: 200px;" 
		      								name="receiverName" value="${user.userName}">
			</div>
		  </div>
		  
		  	 <hr/>
		 <div class="form-group"> 
		    <label for="receiverPhone" class="col-xs-4 col-md-2">�����ڿ���ó</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
			</div>
		  </div>

		  	<hr/>
		 
		  <div class="form-group"> 
		    <label for="divyAddr" class="col-xs-4 col-md-2">�������ּ�</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${user.addr}">
			</div>
		  </div>
		
			<hr/>
		 
		  <div class="form-group"> 
		    <label for="divyRequest" class="col-xs-4 col-md-2">���ſ�û����</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="��û������ �Է����ּ���..">
			</div>
		  </div>
		
			<hr/>
			
		 <div class="form-group"> 
		    <label for="divyDate" class="col-xs-4 col-md-2">����������</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="datepicker" name="divyDate" >
			</div>
		  </div>
		  
		  <hr/>

		<div class="form-group">
	  		<div class="col-md-12 text-center ">
	  		<c:if test= "${! empty user}">
	  			<button type="button" class="btn btn-primary" id ="purchase">����</button>
	  		</c:if>
	  			 <a class="btn btn-primary btn" href="#" id="cancel" role="button">���</a>
	  		</div>
		</div>
		
		<br/>
	   </form>
	   <!-- form end /////////////////////////////////////-->
 	
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	

</body>
</html>