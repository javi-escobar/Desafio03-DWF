<%--
  Created by IntelliJ IDEA.
  User: alexi
  Date: 15/5/2024
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>TextilExport - Productos</title>
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
  <h2>TextilExport - Productos</h2>
  <form action="${pageContext.request.contextPath}/productos/cliente/buscar" method="post">
    <div class="form-group row">
      <label for="nombre" class="col-sm-2 col-form-label">Buscar por nombre:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre del producto">
      </div>
      <div class="col-sm-4">
        <button type="submit" class="btn btn-primary">Buscar</button>
      </div>
    </div>
  </form>
  <div class="row mt-4">
    <c:forEach items="${listaProductos}" var="producto">
      <div class="col-md-4 mb-4">
        <div class="card text-bg-light mb-3 border border-success-subtle" style="border: 2px solid #2e6da4; padding: 16px; margin: 8px; border-radius: 5px">
          <div class="card-body">
            <c:if test="${not empty producto.nombreImagen}">
              <img src="${producto.nombreImagen}" alt="Imagen del Producto" class="card-img-top" style="width: 100px; height: 100px">
            </c:if>
            <h3 class="card-title">${producto.nombreProducto}</h3>
            <p class="card-text">${producto.descripcion}</p>
            <ul class="list-group list-group-flush">
              <li class="list-group-item"><strong>Categoría:</strong> ${producto.categoria}</li>
              <li class="list-group-item"><strong>Precio:</strong> ${producto.precio}</li>
              <c:if test="${producto.existencias == 0}">
                <li class="list-group-item"><strong>Existencias:</strong> Producto No Disponible</li>
              </c:if>
              <c:if test="${producto.existencias != 0}">
                <li class="list-group-item"><strong>Existencias:</strong> ${producto.existencias}</li>
              </c:if>
            </ul>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
  <div class="row mt-4">
    <div class="col-md-12">
      <a href="${pageContext.request.contextPath}/productos/cliente" class="btn btn-secondary">Volver</a>
    </div>
  </div>
</div>
</body>
</html>
