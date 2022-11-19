<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/assets/stylesheet/styles.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/images/favicons.png" rel="icon">
</head>
<body>
    <script>
        var ms = 3000;
       setTimeout(function () {
           $("#alert").hide();
        }, ms);

        function removeMsg(){
 	       $("#msg").hide();
        }
       function save_user(){
    	   var regExp = /[a-zA-Z]/;
    	   let username = document.getElementById('username').value.trim();
    	   if(document.getElementById('username').value.trim().length<8){
    		   $("#msg").show();
    		   document.getElementById('msg').style.color = 'red';
    		   document.getElementById('msg').innerHTML = 'Username must contain minimum 8 Characters';
    		   return false; 
    	   }
    	   if(!regExp.test(username)){
    		   $("#msg").show();
    		   document.getElementById('msg').style.color = 'red';
    		   document.getElementById('msg').innerHTML = 'Invalid Username!';
    		   return false; 
    	   }
    	   if(document.getElementById('password').value.trim().length<8){
    		   $("#msg").show();
    		   document.getElementById('msg').style.color = 'red';
    		   document.getElementById('msg').innerHTML = 'Password must contain Minimum 8 Characters';
    		   return false; 
    	   }
    	   if(document.getElementById('password').value!=document.getElementById('confirm_password').value){
    		   $("#msg").show(); 
    		   document.getElementById('msg').style.color = 'red';
    	       document.getElementById('msg').innerHTML = 'Password not matching!';
    		   return false;  
    	   }
    	   return true;
    	}     
              
    </script>
           <jsp:include page="applicationHeader2.jsp"/>
           <div class="rounded d-flex justify-content-center">
                <div class="col-md-4 col-sm-12 shadow-lg p-5 bg-light" style="margin-top:86px;">
                        <div class="text-center">
                            <h3 class="text-primary">Create Account</h3>
                       </div>
                       <c:if test="${param.exist != null}" >
                           <div class="alert alert-warning"  id="alert" role="alert"><span>"User Name already exist , please enter another User Name"</span></div>
                      </c:if>
                      <c:if test="${param.error != null}">
                           <div class="alert alert-danger" id="alert" role="alert"><span>"Something went wrong , please try after some time."</span></div>
                     </c:if>
                        <div style="text-align:center;height:2px;">
                           <span id="msg"></span>  
                         </div>
                        <div>
                             <form:form class="form-container" onsubmit="return save_user();" action="${pageCaontext.request.contextPath}/do_register" style="margin-top:20px" method="POST" modelAttribute="user">
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i class="bi bi-person-plus-fill text-white"></i></span>
                                   <form:input type="text" cssClass="form-control" style="box-shadow:none;" oninput='removeMsg();' name="username" path="username"/>
                                   <form:errors cssClass="error ps-5" path="username"/>
                                </div>
                                <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i class="fa fa-lock text-white" style="font-weight: 300;font-size: 24px;"></i></span>
                                   <form:input type="password" cssClass="form-control" style="box-shadow:none;" name="password" path="password" oninput='removeMsg();' id="password"/>
                                   <form:errors cssClass="error ps-5" path="password"/>
                                </div>
                                <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i class="bi bi-key text-white"></i></span> 
                                   <input type="password" class="form-control" style="box-shadow:none;" name="confirm password" oninput='removeMsg();' id="confirm_password"/> 
                                    
                              </div>
                                 
                                <div class="d-grid col-12 mx-auto">
                                    <button class="btn btn-primary" style="box-shadow:none;" type="submit" id="btnForm"><span></span> Sign up</button>
                                </div>
                                <p class="text-center mt-3">Already have an account?
                                       <a href="${pageCaontext.request.contextPath}/login" class="text-primary">Sign in</a>
                                </p>
                            </form:form>
                        </div>
                    </div>
                </div>
            
        
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
</body>
</html>
