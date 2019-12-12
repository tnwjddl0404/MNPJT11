<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    

    
<!DOCTYPE html>

<html lang="ko">

<head>

	<meta charset="EUC-KR">
	
	<title>Apple</title>
	  <link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">

		<!-- ���� : http://getbootstrap.com/css/ ==> ����ũž PC�� ����� ��⿡�� ������ ���̴� ������ ���� ����� ���ؼ��� ����Ʈ ��Ÿ �±׸� ����ϴ°�  -->
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

		//=====����Code �ּ� ó�� ��  jQuery ���� ======//
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
	
		/* document.detailForm.action='/addProduct.do'; */
		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();
		
		$("form").attr("method","POST").attr("action","/product/addProduct").submit();
		}
	
	
		//onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"
				//�������� �޷�
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
			
	
			//==> �߰��Ⱥκ� : "���"  Event ����
			$(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "#register" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
				fncAddProduct();
				});
			});	
		
	
			
			/*============= jQuery ���� �ּ�ó�� =============
			function resetData() {
					document.detailForm.reset();
			}========================================	*/
			//==> �߰��Ⱥκ� : "���"  Event ó�� ��  ����
			$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "#cancel" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
				$("form")[0].reset();
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
		
				<h1 class = "bg-primary text-center"> �� ǰ �� �� </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">	
	
		 <div class="form-group"> 
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		    <div class="col-sm-4">   <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ���� �Է��ϼ���">
		       <!-- <span id="helpBlock" class="help-block"> --> <!--���� �ؽ�Ʈ  -->
		      	<!-- <strong class="text-danger"></strong> --> <!--�Է��� ��Ʈ������ �Է�  -->
		   			<!--</span> -->
		   	 </div>
		   </div>

 		<div class="form-group"> 
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="������..">
			</div>
		  </div>
			
		<div class="form-group"> 
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="datepicker" name="manuDate" >
			</div>
		  </div>
		  
		<div class="form-group"> 
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="text" class="form-control" id="price" name="price" >
			</div>
		  </div>
		
		
		<div class="form-group"> 
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">  <!--offset Į�� ���ʿ�  ������ �ΰ���� ��ŭ �Ҵ��ϴ� Ŭ����  -->
		      <input type="file" class="form-control" id="fileName" name="fileName" >
			</div>
		 </div>
		
		 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="register"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn "id="cancel" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form End /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
		
	</body>
	</html>