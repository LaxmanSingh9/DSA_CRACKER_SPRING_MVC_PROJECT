<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.saransh.utils.SortUtils" %>
<%--
  Created by CryptoSingh1337 on 6/1/2021
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/stylesheet/styles.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/images/favicon.png" rel="icon">
</head>
<body data-new-gr-c-s-check-loaded="14.1083.0" data-gr-ext-installed="" style="background: #f9f4f4;">
      <jsp:include page="applicationHeader.jsp"/>
        <c:choose>
          <c:when test="${topics.size() > 0}">
              <div class="text-center" style="padding-top: 90px;">
                <h4><span id="sheetName"> SDE Sheet Problems</h4>
                <h3 style="margin-bottom: 15px;text-align: center;color: #e75770;font-size: inherit;"> \*Curated Lists of All Popular Interview Questions */</h3>       
             </div>  
             <div class="row row-cols-1 row-cols-md-3 g-4" style="width: 97%;padding-left: 5%;";>
             <c:forEach var="topic"  items="${topics}">
               <script>
                  document.getElementById('sheetName').innerHTML="<c:out value='${topic.sheet}'/>";
               </script>  
              <div class="col">
               <div class="card h-100 hvr-grow text-white bg-info-2 mb-3 text-bg-info mb-3">
                 <div class="card-body">
                   <h5 class="card-title text-dark">${topic.name}</h5>
                   <p class="card-text text-muted">Total Questions: ${topic.count}</p>
                 
                    <div class="firstDropContainer">
                      <p class="text-light " style="font-weight: 300;font-size: 14px;">Chapter: ${topic.id}/></p>
                    </div>
                    <div class="secondDropContainer">
                       <a href="list?name=${topic.sheet}+${topic.name}" class="btn btn-primary">Start now</a>
                    </div>
                 
                 </div>
               </div>
             </div>
           </c:forEach>      
           </div>
         </c:when>
      <c:otherwise>
            <h3 class="text-center">No record exists!</h3>
      </c:otherwise>
     </c:choose>
    

     
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>     
 </body>
</html>













>