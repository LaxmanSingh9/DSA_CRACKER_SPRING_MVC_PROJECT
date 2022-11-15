<%@ page import="java.util.*" %>
<%@page import="com.dsc.utils.*"%>
<%@page import="com.dsc.entity.Users"%>
<%@page import="com.dsc.service.QuestionService"%>
<%@page import="com.dsc.service.UserService"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by CryptoSingh1337 on 6/1/2021
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Problem List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/assets/stylesheet/styles.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/images/favicons.png" rel="icon">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert2@7.8.2/dist/sweetalert2.all.js"></script>
 </head>
<body data-new-gr-c-s-check-loaded="14.1083.0" data-gr-ext-installed="" style="background: #f9f4f4;">
    <div id="preloader">
          <div id="loader" class="center"></div>
    </div>
    <jsp:include page="applicationHeader2.jsp"/>
    <div class="topic text-center" style="padding-top: 80px;">
            <h4>${sheet} SDE Sheet ${tagType} Problems</h4>
            <h3 style="margin-bottom: 15px;text-align: center;color: #e75770;font-size: inherit;"> \*Curated Lists of All Popular ${tagType} Interview Questions */</h3>       
   </div>
      <div class="fluid-container" style="padding-left: 9.5%;display: flex;">
     <div class="form-check form-switch" style="padding-top: 11px;width: 82%;">
         <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
         <label class="form-check-label" for="flexSwitchCheckDefault" style="color: #6b6b6b;font-size: 15px;font-weight: 600;">Hide Solved</label>
     </div>
      <div class="dropdown" style="padding-bottom: 0px;float: right;/* padding-left: 83.5%; */width: 15%;padding-bottom: -2px;">
               <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="background: orange;">
                  Sort By
             </button>
              <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
                <a class="dropdown-item" href="list?sheet=${sheet}&tagType=${tagType}&sortBy=0&filter=${filter}">Id</a>
                <a class="dropdown-item" href="list?sheet=${sheet}&tagType=${tagType}&sortBy=1&filter=${filter}">Name</a>
                <a class="dropdown-item"  href="list?sheet=${sheet}&tagType=${tagType}&sortBy=2&filter=${filter}">Difficulty</a>
              </div>
     </div>
   
   </div> 
    <c:if test="${filter== 1}" >
      <script>
       document.getElementById("flexSwitchCheckDefault").checked=true;
      </script>
     </c:if>   
   <c:url value="list" var="switchUrl">
          <c:param name="sheet" value="${sheet}"></c:param>
          <c:param name="tagType" value="${tagType}"></c:param>
          <c:param name="sortBy" value="${sortBy}"></c:param>
          <c:param name="page" value="${page-1}"></c:param>
   </c:url>  
   <div class="container mt-5">
        <c:choose>
            <c:when test="${questions.size() > 0}">
             <div style="padding-left: 11px;width: 99%;position: relative;">
                  <table class="table">
                      <thead class="table-dark" style="--bs-table-bg: #638ab1;">
                        <tr>
                            <th scope="col" style="width: 7%;padding-: 35px;font-size:14px;">Id</th>
                            <th scope="col" style="width: 64%; font-size:14px;">Title</th>
                            <th scope="col" style="width: 64%; font-size:14px;">Tags</th>
                            <th scope="col" style="width: 7%;font-size:14px;">Difficulty</th>
                            <th scope="col" style="width:5%; font-size:14px;">Action</th>
                        </tr>    
                    </thead>
                  </table>
               </div>
                <div class="inner-jsp container ">
                   <table class="table table-striped bg-white" script="margin-top:-16px">
                      <tbody>
                        <c:forEach var="question" items="${questions}">
                            <tr>
                                <td style="width:5%; font-size:14px;font-weight:600;">${question.id}. </td>
                                
                                 <td style="width:64%; font-size:14px;">
                                  <a class="li-table" href="${question.link1}" target="_blank">
                                       ${question.name}
                                  </a>
                                </td>
                                
                                <td style="width:64%; font-size:14px;">
                                  <c:forTokens var="token" items="${question.tag}" delims=",">
                                    <span class="badge rounded-pill bg-secondary"><c:out value="${token}"/></span>
                                 </c:forTokens>
                                </td>
                                
                                <td class="${question.diff}" style="width: 5%;font-size:14px;">${question.diff}</td>
                                <td style="width:5%; font-size:14px;">
                                 <sec:authorize access="hasRole('ADMIN')">
                                      <div style="display:flex;"> 
                                        <a class="li-cls1" onclick="editOrDelete('delete',${question.id});" href="#"><i class="fa fa-trash" data-toggle="tooltip" title="delete"></i></a>
                                        <a class="li-cls1" onclick="editOrDelete('update',${question.id});" href="#"><i class="fa fa-edit" data-toggle="tooltip" title="update"></i></a>
                                      </div> 
                                  </sec:authorize>
                                  <sec:authorize access="hasRole('ROLE_USER')">
                                      <div style="display:flex;"> 
                                          <div class="form-check">
                                            <input title="Unsolve" type="checkbox" class="form-check-input bg-blue" id="${question.id}" onClick="markSolvedOrUnsoved(${question.id});sweetAlert('Greetings', 'Hi', 'error');" name="isSolved"></input>
                                          </div>
                                         <c:if test="${userSolvedQuesIds.contains(question.id)}">
                                            <script>
                                               document.getElementById("<c:out value='${question.id}'/>").checked = true;
                                               document.getElementById("<c:out value='${question.id}'/>").setAttribute("title", "Solve");
                                            </script>
                                          </c:if>
                                       </div> 
                                  </sec:authorize>
                                 
                                </td>
                                
                          </tr>
                        </c:forEach>
                    </tbody>
                  </table>
               </div>
            </c:when>
            <c:otherwise>
                <h3 class="text-center" style="padding-top: 80px;">No record exists!</h3>
            </c:otherwise>
        </c:choose>
    </div>
    <c:if test="${page > 0}">
       <nav class="pg1"  aria-label="Page navigation">
       <ul class="pagination pagination-lg pg2">
         <c:url value="list?sheet=${sheet}&tagType=${tagType}&sortBy=${sortBy}&filter=${filter}" var="prev">
          <c:param name="page" value="${page-1}"/>
         </c:url>
        <li class="page-item">
            <a class="page-link bg-col-text box-shadow" href="<c:out value="${prev}" />"> <span aria-hidden="true">&laquo;</span></a>
        </li>
        <c:forEach begin="${startIndex}" end="${endIndex}"  step="1" varStatus="i">
         <c:choose>
            <c:when test="${page == i.index}">
                <li class="page-link text-dark box-shadow">${i.index}</li>
            </c:when>
            <c:otherwise>
                <c:url value="list?sheet=${sheet}&tagType=${tagType}&sortBy=${sortBy}&filter=${filter}" var="url">S
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <li class="page-item">
                  <a  class="page-link box-shadow" href='<c:out value="${url}" />'>${i.index}</a>
                </li>
                
            </c:otherwise>
         </c:choose>
        </c:forEach>
       <c:url value="list?sheet=${sheet}&tagType=${tagType}&sortBy=${sortBy}&filter=${filter}" var="next">
        <c:param name="page" value="${page + 1}"/>
       </c:url>
        <li class="page-item">
          <a class="page-link bg-col-text box-shadow" href='<c:out value="${next}" />'><span aria-hidden="true">&raquo;</span></a>
        </li>
      </ul>
    </nav>
    </c:if>
    
    <script>
       var loader = document.getElementById("preloader");
       window.addEventListener("load" ,function(){
   	     loader.style.display='none';
       });
       function editOrDelete(action,idToChange){
         let msg="Are you sure you want to "+action +" this question?";
         let link="${pageContext.request.contextPath}/admin/"+action+"?id="+idToChange;
         if(confirm(msg)){
            location.href =link;
         }
       }
       function markSolvedOrUnsoved(id){
            var isMark = document.getElementById(id+'').checked;
            document.getElementById(id+'').setAttribute("title", isMark==true ? "Solve" : "Unsolve");
            $.ajax({
                  type : "GET",
                  url : "${pageContext.request.contextPath}/markQuestion",
                  data : {"id":id , "isMark":isMark},
                  success: function(data){
                     alert(data);
                 }
           });
       }
       
       document.getElementById("flexSwitchCheckDefault").onclick=function(){
            var isCheck = document.getElementById("flexSwitchCheckDefault").checked;
            
            if(isCheck){
               location.href ='list?sheet=${sheet}&tagType=${tagType}&sortBy=${sortBy}'+'&filter=1';
            }
            else{
               location.href ='list?sheet=${sheet}&tagType=${tagType}&sortBy=${sortBy}'+'&filter=-1';
            }
      };
      $("#home").removeClass('active');
	  $("#solve").addClass('active');
	  $("#import").removeClass('active');
</script>
   
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>