<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.saransh.utils.SortUtils" %>
<%@page import="com.saransh.service.QuestionServiceImpl"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>
<body data-new-gr-c-s-check-loaded="14.1083.0" data-gr-ext-installed="" style="background: #f9f4f4;>
    <jsp:include page="applicationHeader.jsp"/>
    <div class="text-center" style="padding-top: 120px;">
            <h4>${sheet} SDE Sheet ${tagType} Problems</h4>
            <h3 style="margin-bottom: 15px;text-align: center;color: #e75770;font-size: inherit;"> \*Curated Lists of All Popular ${tagType} Interview Questions */</h3>       
    </div> 
    <div class="dropdown" style="padding-bottom: 0px;padding-left: 83.5%;padding-bottom: -2px;">
               <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="background: orange;">
                  Sort By
          </button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="list?sortBy=0">Id</a>
                <a class="dropdown-item" href="list?sortBy=1">Name</a>
                <a class="dropdown-item" href="list?sortBy=2">Difficulty</a>
              </div>
    </div>
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
                <div class="container ">
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
                                 <%-- <div style="display:flex;"> 
                                      <a class="li-cls1" onclick="editOrDelete('delete',${question.id});" href="#"><i class="fa fa-trash" data-toggle="tooltip" title="delete"></i></a>
                                      <a class="li-cls1" onclick="editOrDelete('update',${question.id});" href="#"><i class="fa fa-edit" data-toggle="tooltip" title="update"></i></a>
                                  </div> --%>
                                   <div class="form-check">
                                      <input type="checkbox" class="form-check-input bg-blue" id="check" onClick="markSolved(this)" name="isSolved"></input>
    <                               </div>
                                </td>
                                
                          </tr>
                        </c:forEach>
                    </tbody>
                  </table>
               </div>
            </c:when>
            <c:otherwise>
                <h3 class="text-center">No record exists!</h3>
            </c:otherwise>
        </c:choose>
    </div>
    <nav aria-label="Page navigation pg1" style="width: 94%;padding-right:3.5%;padding-left:6%;padding-bottom:100%;margin-top:-16px;">
       <ul class="pagination pagination-lg pg2">
         <c:url value="list?sheet=${sheet}&tagType=${tagType}&sortBy=${sortBy}" var="prev">
          <c:param name="page" value="${page-1}"/>
         </c:url>
        <li class="page-item">
            <a class="page-link " href="<c:out value="${prev}" />"> <span aria-hidden="true">&laquo;</span></a>
        </li>
        <c:forEach begin="${startIndex}" end="${endIndex}"  step="1" varStatus="i">
         <c:choose>
            <c:when test="${page == i.index}">
                <li class="page-link text-dark">${i.index}</li>
            </c:when>
            <c:otherwise>
                <c:url value="list?sheet=${sheet}&tagType=${tagType}&sortBy=${sortBy}" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <li class="page-item">
                  <a  class="page-link " href='<c:out value="${url}" />'>${i.index}</a>
                </li>
                
            </c:otherwise>
         </c:choose>
        </c:forEach>
       <c:url value="list?sheet=${sheet}&tagType=${tagType}&sortBy=${sortBy}" var="next">
        <c:param name="page" value="${page + 1}"/>
       </c:url>
        <li class="page-item">
          <a class="page-link" href='<c:out value="${next}" />'><span aria-hidden="true">&raquo;</span></a>
        </li>
      </ul>
    </nav>
    <script>
      function editOrDelete(action,idToChange){
         let msg="Are you sure you want to "+action +" this question?";
         let link=action+"?id="+idToChange;
         if(confirm(msg)){
            location.href =link;
         }
      }
      function markSolvedOrUnsoved(username , id){
        var isCheck=$('#'+id).is(':checked'); 
        <%
          QuestionServiceImpl qus=new QuestionServiceImpl();
          qus.markSolvedOrUnsoved(username, id,isCheck);
        %>
      }
    </script>
   
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>