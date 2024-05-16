<%--
  Created by IntelliJ IDEA.
  User: alexi
  Date: 15/5/2024
  Time: 09:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listar Productos</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/alertify.core.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/alertify.default.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/alertify.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<nav class="navbar navbar-default" style="background-color: #000000; border: none;">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/productos/cliente" style="color: white; font-weight: bold;">TextilExport</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/productos/list" style="color: white;">Listar Productos</a></li>
                <li><a href="${pageContext.request.contextPath}/productos/create" style="color: white;">Nuevo Producto</a></li>
                <li><a href="${pageContext.request.contextPath}/productos/cliente" style="color: white;">Productos Cliente</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="col-12">
        <h2>Listado de Productos</h2>
        <c:if test="${not empty exito}">
            <div class="alert alert-success" role="alert">
                    ${exito}
            </div>
        </c:if>
        <c:if test="${not empty fracaso}">
            <div class="alert alert-danger" role="alert">
                    ${fracaso}
            </div>
        </c:if>
        <a class="btn btn-primary btn-md" href="<s:url value="/productos/create"/>">Nuevo Producto</a>
        <table id="tablaProductos" class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Imagen</th>
                <th>Categoría</th>
                <th>Precio</th>
                <th>Existencias</th>
                <th>Opciones</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listaProductos}" var="producto">
                <tr>
                    <td>${producto.codigoProducto}</td>
                    <td>${producto.nombreProducto}</td>
                    <td>${producto.descripcion}</td>
                    <td>
                        <c:if test="${not empty producto.nombreImagen}">
                            <img src="${producto.nombreImagen}" alt="Imagen del Producto"  style="width: 100px; height: 100px">
                        </c:if>
                        <c:if test="${empty producto.nombreImagen}">
                            Sin Imagen
                        </c:if>
                    </td>
                    <td>${producto.categoria}</td>
                    <td>${producto.precio}</td>
                    <td>${producto.existencias}</td>
                    <td>
                        <button class="btn btn-danger" onclick="eliminar('${producto.codigoProducto}')">
                            <span class="glyphicon glyphicon-trash"></span> Eliminar
                        </button>
                        <a class="btn btn-primary" href="<c:url value='/productos/edit/${producto.codigoProducto}'/>">
                            <span class="glyphicon glyphicon-edit"></span> Editar
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#tablaProductos').DataTable();
    });
    function eliminar(id){
        alertify.confirm("¿Realmente desea eliminar este producto?", function (e){
            if(e){
                window.location.href = 'delete/' + id;
            }
        });
    }
</script>
</body>
</html>
