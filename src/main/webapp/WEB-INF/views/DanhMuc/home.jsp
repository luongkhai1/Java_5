
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Spring Boot + JSP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="../Layout/menu.jsp"/>
<form:form action="/danhmucs/" method="post" modelAttribute="DanhMuc">
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
    <button type="submit" class="btn btn-primary">Thêm</button>
</form:form>
<table class="table">
    <thead>
    <tr>
        <td>ID</td>
        <td>Mã Danh Mục</td>
        <td>Tên Danh Mục</td>
        <td>Trạng Thái</td>
        <td>Ngày Tạo</td>
        <td>Ngày Sửa</td>
        <td>Chức Năng</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listDanhMuc}" var="dm">
        <tr>
            <td>${dm.id}</td>
            <td>${dm.maDanhMuc}</td>
            <td>${dm.tenDanhMuc}</td>
            <td>${dm.trangThai}</td>
            <td>${dm.ngayTao}</td>
            <td>${dm.ngaySua}</td>
            <td>
                <a class="btn btn-warning" href="/danhmucs/${dm.id}">Edit</a>
                <a class="btn btn-danger" href="#" onclick="document.getElementById('delete-form-${dm.id}').submit(); return false">Xóa</a>
                <form id="delete-form-${dm.id}" action="/danhmucs/${dm.id}" method="post" style="display: none;">
                    <input type="hidden" name="_method" value="delete">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="../Layout/footer.jsp"/>
</body>
</html>