
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Spring Boot + JSP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../Layout/menu.jsp"/>
<form:form action="/danhmucs/${DanhMuc1.id}" method="post" modelAttribute="DanhMuc1">
    <div>
        <label>ID</label>
        <form:input path="id" cssClass="form-control" readonly="true"/>
    </div>
    <div>
        <label>Mã Danh Mục</label>
        <form:input path="maDanhMuc" cssClass="form-control"/>
    </div>
    <div>
        <label>Tên Danh Mục</label>
        <form:input path="tenDanhMuc" cssClass="form-control"/>
    </div>
    <div>
        <label>Trạng Thái</label> <hr>
        <form:radiobutton path="trangThai" value="Active"/> Active
        <form:radiobutton path="trangThai" value="InActive"/> InActive
    </div>
    <button type="submit" class="btn btn-primary">Update</button>
</form:form>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>