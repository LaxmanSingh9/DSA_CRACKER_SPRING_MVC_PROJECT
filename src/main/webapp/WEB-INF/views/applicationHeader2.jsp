<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/stylesheet/styles.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/images/favicon.png" rel="icon">
</head>
<body>

   <nav class="navbar navbar-expand-xl navbar-dark bg-dark nav-static">
	<a href="#" class="navbar-brand"><i class="fa fa-cube"></i>DSA<b>Cracker</b></a>  		
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
	   <!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">		
		<form id="form1" class="navbar-form form-inline" action="${pageContext.request.contextPath}/search" method="GET">
			<div class="input-group search-box">								
				<input type="text" id="search" name="search" class="form-control" placeholder="Search here..." value="${search}" required>
				<a  href="javascript:$('#form1').submit();"><span style="background: aliceblue;" class="input-group-addon"><i class="fa fa-search"></i></span></a>
			</div>
		</form>
		<div class="navbar-nav ml-auto">
			<a href="#" id='home' class="nav-item nav-link active text-change"><span>Home</span></a>
			<a href="#" id='solve' class="nav-item nav-link text-change"><span>Problems</span></a>
			<div class="nav-item dropdown">
				<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action text-change pad-top" aria-expanded="false">Sheets<b class="caret"></b></a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="topicwise?sheet=love babber" id="sheet1">Love babber</a>
                    <a class="dropdown-item" href="#" id="sheet2" onclick="topicwise_sheet();">Striver</a>
                    <a class="dropdown-item" href="#"  id="sheet3" onclick="topicwise_sheet();">Fraz</a>
				</div>
			</div>
			<a href="#" id="import"class="nav-item nav-link text-change"><span>Admin</span></a>
				
			
			<div class="nav-item dropdown">
				<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action text-change pad-top" aria-expanded="false"><sec:authentication property="principal.username" /><b class="caret"></b></a>
				<div class="dropdown-menu">
					<a href="#" id="logout" class="dropdown-item text-dark text-change" style="font-weight: 600;"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
				</div>
			</div>
		</div>
	</div>    
	</sec:authorize>
	
	
</nav>
<script type="text/javascript">
   document.getElementById("home").onclick=function(){
    location.href = "${pageContext.request.contextPath}/topicwise";
   };
   document.getElementById("solve").onclick=function(){
	   location.href = "${pageContext.request.contextPath}/list";
   }
   document.getElementById("import").onclick = function(){
      location.href = "${pageContext.request.contextPath}/admin/add";
   };
   document.getElementById("logout").onclick = function(){
	      location.href = "${pageContext.request.contextPath}/process_log_out";
   };
   function  topicwise_sheet(){
	   alert("This sheet is not avaibale yet , will update it soon");
   }
   function showAlert(msg, ok) {
       var confirmBox= $("#confirm");
       confirmBox.find(".message").text(msg);
       confirmBox.find(".ok").unbind().click(function() {
          confirmBox.hide();
       });
       confirmBox.find(".").click(ok);
       confirmBox.show();
    }
</script>
</body>
</html>