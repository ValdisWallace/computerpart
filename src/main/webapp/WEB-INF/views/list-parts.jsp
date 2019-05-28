<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Компьютерные комплектующие</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <%@ page isELIgnored="false"%>
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
<div class="container">
    <div class="col-md-offset-1 col-md-10">
        <h3 class="text-center">Компьютерные комплектующие</h3>
        <hr />

        <input type="button" value="Добавить комплект"
               onclick="window.location.href='showForm'; return false;"
               class="btn btn-primary" /> <br />
        <br />
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Список комплектующих</div>
            </div>
            <div class="panel-body">
                <div>
                    <div align="left">
                        <select name="forma" onchange="location = this.value">
                            <option>Сортировка</option>
                            <option value="../part/list">Все детали</option>
                            <option value="../part/list?filter=1">Детали для сборки</option>
                            <option value="../part/list?filter=2">Опциональные детали</option>
                        </select>
                    </div>
                    <div align="right">
                        <form action = "../part/search" method = "GET">
                            Поиск: <input type = "text" name = "name">
                            <input type = "submit" value = "Найти" />
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>Наименование</th>
                        <th>Необходимость</th>
                        <th>Количество</th>
                        <th>Изменения</th>
                    </tr>

                    <!-- loop over and print our parts -->
                    <c:forEach var="tempPart" items="${parts}">

                        <!-- construct an "update" link with parts id -->
                        <c:url var="updateLink" value="/part/updateForm">
                            <c:param name="id" value="${tempPart.id}" />
                        </c:url>

                        <!-- construct an "delete" link with part id -->
                        <c:url var="deleteLink" value="/part/delete">
                            <c:param name="id" value="${tempPart.id}" />
                        </c:url>

                        <tr>
                            <td>${tempPart.name}</td>
                            <td>${tempPart.need ? "Да" : "Нет"}</td>
                            <td>${tempPart.count}</td>

                            <td>
                                <!-- display the update link --> <a href="${updateLink}">Обновить</a>
                                | <a href="${deleteLink}"
                                     onclick="if (!(confirm('Вы уверены что хотите удалить деталь?'))) return false">Удалить</a>
                            </td>

                        </tr>

                    </c:forEach>

                    <br />
                    <br />

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Можно собрать</td>
                        <td>${countTruePart}</td>
                        <td>компьютеров</td>
                    </tr>

                </table>

            </div>
        </div>
        <div>
            <!-- Pagination links in spring mvc. -->
            <ul class="pagination pagination-sm">

                <c:forEach begin="1" end="${pages.totalPages}" var="p">
                    <li class="page-item"><a class="page-link" href="../part/list?page=${p}&filter=${filter}">${p}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>

</div>
</body>

</html>
