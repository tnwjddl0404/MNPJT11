<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
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
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
 	 <script type="text/javascript">
  	


		function fncAddProduct(){
		//Form ��ȿ�� ����
	 	//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
		
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price =$("input[name='price']").val();
		
		
		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
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
	
		//==> �߰��Ⱥκ� : "����"  Event ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "#modify" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
				fncAddProduct();
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
	       <h3 class=" text-info">��ǰ��������</h3>
	       <h5 class="text-muted">��ǰ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		
			<div class="form-group"> 
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		    <div class="col-sm-4">   <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ���� �Է��ϼ���" value="${product.prodName}">
		       <!-- <span id="helpBlock" class="help-block"> --> <!--���� �ؽ�Ʈ  -->
		      	<!-- <strong class="text-danger"></strong> --> <!--�Է��� ��Ʈ������ �Է�  -->
		   			<!--</span> -->
		   	 </div>
		   </div>

 		<div class="form-group"> 
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="������.." value="${product.prodDetail}">
			</div>
		  </div>
			
		<div class="form-group"> 
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="datepicker" name="manuDate" value="${product.manuDate}">
			</div>
		  </div>
		  
		<div class="form-group"> 
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}">
			</div>
		  </div>
		
		
		<div class="form-group"> 
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="file" class="form-control" id="fileName" name="fileName" value="/images/uploadFiles/${product.fileName}">
			</div>
		 </div>
		
		 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
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
