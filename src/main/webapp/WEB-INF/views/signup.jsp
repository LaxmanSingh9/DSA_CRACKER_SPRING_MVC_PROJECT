<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/assets/stylesheet/styles.css" rel="stylesheet">
</head>
<body>
    <script>
       var ms = 3000;
       setTimeout(function () {
         document.getElementById('alert').remove();
         document.getElementById('msgS').remove();
       }, ms);

         function check_pass() {
            if (document.getElementById('password').value ==
                document.getElementById('confirm_password').value){
            document.getElementById('btnForm').disabled = false;
            document.getElementById('msg').style.color = 'green';
            document.getElementById('msg').innerHTML = 'matching';
        } else {
        	 document.getElementById('btnForm').disabled = true;
        	 document.getElementById('msg').style.color = 'red';
        	 document.getElementById('msg').innerHTML = 'not matching';
        }
      }
    </script>
    <div class="container-fluid">
      <div class="">
          <div class="text-center"><h1 class="pt-3 pb-3">Sign Up Form</h1>
           <div style="text-align:center;font-size: 25px;font-style: italic;font-weight: 600;color: #878c9b;margin-top: -20px;">dsaCracker:</div></div>
      </div>
    <div class="" style="margin-top:50px">
           <div class="rounded d-flex justify-content-center">
                <div class="col-md-4 col-sm-12 shadow-lg p-5 bg-light">
                        <div class="text-center">
                            <h3 class="text-primary">Create Account</h3>
                       </div>
                       <c:if test="${msgClass}" id="alert">
                           <div class="${msgClass}" role="alert">${message}</span></div>
                        </c:if>
                        <div style="text-align:center;">
                          <span id="msg"></span>  
                         </div>
                        <div class="p-4">
                             <form:form class="form-container" action="/dsaCracker/do_register" method="POST" modelAttribute="user">
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i class="bi bi-person-plus-fill text-white"></i></span>
                                   <form:input type="text" cssClass="form-control" name="username" path="username"/>
                                   <form:errors cssClass="error ps-5" path="username"/>
                                </div>
                                <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i class="fa fa-lock text-white" style="font-weight: 300;font-size: 24px;"></i></span>
                                   <form:input type="password" cssClass="form-control" name="password" path="password" onchange='check_pass();' id="password"/>
                                   <form:errors cssClass="error ps-5" path="password"/>
                                </div>
                                <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i class="bi bi-key text-white"></i></span> 
                                   <input type="password" class="form-control" name="confirm password" onchange='check_pass();' id="confirm_password"/> 
                                    
                              </div>
                                 
                                <div class="d-grid col-12 mx-auto">
                                    <button class="btn btn-primary" type="submit" id="btnForm"><span></span> Sign up</button>
                                </div>
                                <p class="text-center mt-3">Already have an account?
                                       <a href="/dsaCracker/login" class="text-primary">Sign in</a>
                                </p>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>   
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
</body>
</html>
