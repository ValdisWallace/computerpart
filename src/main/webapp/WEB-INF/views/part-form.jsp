<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Компьютерные части</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</head>
<body>
<div class="container">
    <div class="col-md-offset-2 col-md-7">
        <h3 class="text-center">Компьютерные комплектующие</h3>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Добавить деталь</div>
            </div>
            <div class="panel-body">
                <form:form action="savePart" cssClass="form-horizontal"
                           method="post" modelAttribute="part">

                    <!-- need to associate this data with part id -->
                    <form:hidden path="id" />

                    <div class="form-group">
                        <label for="name" class="col-md-3 control-label">Название</label>
                        <div class="col-md-9">
                            <form:input path="name" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="need" class="col-md-3 control-label">Необходимость</label>
                        <div class="col-md-9">
                                <%-- <form:input path="need" cssClass="form-control" /> --%>
                            <form:select path="need">
                                <form:option value="true">Да</form:option>
                                <form:option value="false">Нет</form:option>
                            </form:select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="count" class="col-md-3 control-label">Количество</label>
                        <div class="col-md-9">
                            <form:input path="count" cssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-offset-3 col-md-9">
                            <form:button cssClass="btn btn-primary">Добавить</form:button>
                        </div>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
