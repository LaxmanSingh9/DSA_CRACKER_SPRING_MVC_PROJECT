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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/stylesheet/styles.css" rel="stylesheet">
    <link href="${pageCaontext.request.contextPath}/assets/images/favicon.png" rel="icon">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light" style="
    position: fixed;
    z-index: 3;
    width: 100%;
    background:#fff!important;
    border-bottom: 5px solid #fff;
    height: 100px; 
    padding-bottom: 4px;
    /* background: #eeeeee; */
    /* -webkit-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12); */
    -moz-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);
    /* box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12); */
">
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="width: 417px;">
        <li class="nav-item li-cls">
          <button id="btnHome" class="btn btn-outline-success" type="submit">Home</button>
        </li>
        <li class="nav-item li-cls">
          <button id="btnSolve" class="btn btn-outline-success" type="submit">Solve</button>
        </li>
         <li class="nav-item dropdown li-cls">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Sheets
           </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="topicwise?sheet=love babber" id="sheet1">Love babber</a>
            <a class="dropdown-item" href="#" id="sheet2" onclick="topicwise_sheet();">Striver</a>
            <a class="dropdown-item" href="#"  id="sheet3" onclick="topicwise_sheet();">Fraz</a>
          </div>
        </li>
        <li class="nav-item li-cls">
          <button id="importBtn" class="btn btn-outline-success" type="submit">Import</button>
        </li>
      </ul>
      <form class="d-flex-1" action="dsaCracker/search" method="GET">
        <input type="text"class="form-control me-22" name="search" placeholder="search by problem name" value="${search}" required>
        <input type="submit" class="btn btn-success" value="Search">
      </form>
      <div>
        <button id="logoutBtn" class="btn btn-primary">Log out</button>
      </div>
    </div>
  </div>
</nav>
<script type="text/javascript">
   document.getElementById("btnHome").onclick=function(){
    location.href = "topicwise";
   };
   document.getElementById("btnSolve").onclick=function(){
	   location.href = "list";
   }
   document.getElementById("importBtn").onclick = function(){
      location.href = "add";
   };
   document.getElementById("logoutBtn").onclick = function(){
	      location.href = "${pageContext.request.contextPath}/process_log_out";
   };
   function  topicwise_sheet(){
	   alert("This sheet is not avaibale yet , will update it soon");
   }
</script>
</body>
