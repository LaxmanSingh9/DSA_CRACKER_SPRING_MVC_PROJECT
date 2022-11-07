<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by CryptoSingh1337 on 6/1/2021
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/stylesheet/styles.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/images/favicon.png" rel="icon">
</head>
<body>
    <div id="addForm">
        <div class="bg-secondary bg-gradient">
            <div class="text-center">
                <h1 class="pt-3 pb-3">Save Question</h1>
            </div>
        </div>
        <form:form class="form-container" action="/dsaCracker/save" method="POST" modelAttribute="customer">
            <form:hidden path="id"/>
            <div class="input-group mb-3 me-5">
                <span class="input-group-text" id="basic-addon1">Question Name</span>
                <form:input type="text" cssClass="form-control" name="firstName" path="name"/>
                <form:errors cssClass="error ps-5" path="name"/>
            </div>
            <div class="input-group mb-3 me-5">
                <span class="input-group-text" id="basic-addon2">Diffculty</span>
                <form:input type="text" cssClass="form-control" name="lastName" path="diff"/>
                <form:errors cssClass="error ps-5" path="diff"/>
            </div>
            <div class="input-group mb-3 me-5">
                <span class="input-group-text" id="basic-addon3">Tags</span>
                <form:input type="email" cssClass="form-control" name="tag" path="tag"/>
                <form:errors cssClass="error ps-5" path="email"/>
            </div>
            <div class="input-group mb-3 me-5">
                <span class="input-group-text" id="basic-addon3">LeetCode Link</span>
                <form:input type="email" cssClass="form-control" name="LeetCode Link" path="link1"/>
                <form:errors cssClass="error ps-5" path="link1"/>
            </div>
            <div class="input-group mb-3 me-5">
                <span class="input-group-text" id="basic-addon3">GFG Link</span>
                <form:input type="email" cssClass="form-control" name="GFG Link" path="link2"/>
                <form:errors cssClass="error ps-5" path="link2"/>
            </div>
            <input type="submit" class="btn btn-primary" value="Save">
            <a class="ms-5" href="list">Back to list</a>
        </form:form>
    </div>
</body>
</html>