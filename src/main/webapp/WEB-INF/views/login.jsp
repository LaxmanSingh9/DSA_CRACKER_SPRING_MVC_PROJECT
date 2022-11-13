<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.dsc.utils.SortUtils" %>
<%--
  Created by CryptoSingh1337 on 6/1/2021
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/assets/stylesheet/styles.css" rel="stylesheet">
 </head>
<body>
    <script>
       var ms = 3500;
       setTimeout(function () {
         document.getElementById('alert').remove();
         
       }, ms);
    </script>
     <jsp:include page="applicationHeader2.jsp"/>
    <div class="container-fluid" style="padding-top: 123px;">
      <div class="rounded d-flex justify-content-center">
             <div class="col-md-4 col-sm-12 shadow-lg p-5 bg-light">
                 <div class="text-center">
                    <h3 class="text-primary">Log in</h3>
                </div> 
           <form action="login" method="post" style="padding-top: 9px;">
			 <fieldset>
				<c:if test="${param.error != null}">
					<div class="alert alert-danger" id="alert">
						<p>Authentication Failed : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
					</div>
				</c:if>
				<c:if test="${param.logout != null}">
					<div class="alert alert-success" id="alert">
						<p>You have been logged out successfully.</p>
					</div>
				</c:if>
				<c:if test="${param.login != null}">
					<div class="alert alert-success" id="alert">
						<p>You have been registered successfully.</p>
					</div>
				</c:if>
				<div class="input-group mb-3">
                   <span class="input-group-text bg-primary"><i class="bi bi-person-plus-fill text-white"></i></span>
                   <input type="text" class="form-control" style="box-shadow:none;" name="username"/>
               </div>
               <div class="input-group mb-3">
                    <span class="input-group-text bg-primary"><i class="fa fa-lock text-white" style="font-weight: 300;font-size: 24px;"></i></span>
                    <input type="password" class="form-control" name="password" style="box-shadow:none;"  onchange='check_pass();' id="password"/>
               </div>
               <div class="d-grid col-12 mx-auto">
                  <button class="btn btn-primary" style="box-shadow:none;" type="submit" id="btnForm"><span></span> Sign in</button>
               </div>
              <p class="text-center mt-3">Do not have an account?
                  <a href="/dsaCracker/signup" type="sumbit" class="text-primary">Register</a>
               </p>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
      </div>
   </div>
   
  </div>
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
</body>
</html>

