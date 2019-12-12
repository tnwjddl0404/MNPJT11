<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
<head>
	<title>Apple</title>
	  <link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">


	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ==> ����ũž PC�� ����� ��⿡�� ������ ���̴� ������ ���� ����� ���ؼ��� ����Ʈ ��Ÿ �±׸� ����ϴ°�  --> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- �� viewport : ���������� ����ڿ��� �������� ����
	               �� width=device-width : �������� �ʺ� ����� ��ũ�� �ʺ�� �����մϴ�. ��, ������ ������ ����� ����Ʈ�� ũ��� ���� ����� �ݴϴ�.
   		   �� initial-scale=1.0 : ó�� ������ �ε��� Ȯ��/��Ұ� ���� ���� ���� ũ�⸦ ����ϵ��� �մϴ�. 0~10 ������ ���� �����ϴ�.     -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	a {
		color : black;
	}
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
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
		
		//=============  �� ǰ �� �� Event  ó�� =============	
		$( function() {
	 		$( "a[href='#' ]:contains('�� ǰ �� ��')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			self.location = "/product/listProduct?menu=search"
		  });
	   	});
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start ��� �޴���  /////////////////////////////////////-->
	<div class="navbar" style="background-color: black;">
		
        <div class="container">
        <!-- �� container :: Ŭ������ ���� ȭ���� ���̿� ���� 750px, 970px, �׸��� 1170px�� �޶����� ���� Ȯ���� �� �ְ�, 
        	    �� container-fluid:: ���̸� �����ϰ� ���� �ʾƼ� ȭ�鿡 �������� �ϴ� wrapper�̴� -->
        
        	<a class="navbar-brand" href="#" style="padding:0px 0px"><img src="/images/apple.png"style="width:50px; height:50px;"></a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<!-- ��� �޴��� ������  -->
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#" style="color: white">ȸ������</a></li>
	                 <li><a href="#" style="color: white">�� �� ��</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu ���� Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  ȸ������ ��Ͽ� ���� -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
         			</div>
         			<!--  ȸ������ ������ -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">����������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">ȸ��������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-default">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ���</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ����</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-default">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">��ǰ�˻�</a></li>
						  <li class="list-group-item">
						  	<a href="#">�����̷���ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">�ֱٺ���ǰ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div>
			<!--  Menu ���� end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   		

	        <div class="col-md-9">
				<div class="jumbotron" style="background-color: white; text-align: center">
					
					<img src="/images/appleBackImg.jpg">
					<br />
			  		<h1>���� ���� ������ ��� ��.</h1>
			  		<br />
			  		<a href="/product/listProduct?menu=search">���� �����ϱ� ></a><br /><br />
			  		
			  		<div class="text-center">
			  			<a class="btn btn-default btn-lg" href="#" role="button">ȸ������</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">�α���</a>
			  		</div>
			  		<br />
			  		<img src="/images/appleBackImg2.png" width="700px">
			  	
			  	</div>
	        </div>
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>