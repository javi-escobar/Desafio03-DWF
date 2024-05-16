<%--
  Created by IntelliJ IDEA.
  User: alexi
  Date: 15/5/2024
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Editar Producto</title>
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
    <h2>Editar Producto</h2>
    <div class="row">
        <div class="col-md-7">
            <f:form action="${action}" method="POST" modelAttribute="producto">
                <div class="form-group">
                    <label for="codigoProducto">Código de Producto</label>
                    <f:input path="codigoProducto" id="codigoProducto" cssClass="form-control" readonly="true" />
                </div>
                <div class="form-group">
                    <label for="nombreProducto">Nombre del Producto</label>
                    <f:input path="nombreProducto" id="nombreProducto" cssClass="form-control" required="true" />
                    <f:errors path="nombreProducto" cssClass="alert alert-danger"/>
                </div>
                <div class="form-group">
                    <label for="nombreImagen">Enlace de Imagen</label>
                    <f:input path="nombreImagen" id="nombreImagen" cssClass="form-control" required="true" />
                    <small id="nombreImagenHelp" class="form-text text-muted">Ingrese un enlace de una imagen (jpg, jpeg, png).</small>
                    <f:errors path="nombreImagen" cssClass="alert alert-danger"/>
                    <div id="nombreImagenError" class="alert alert-danger" style="display: none;"></div>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <f:input path="descripcion" id="descripcion" cssClass="form-control" rows="3" required="true" />
                    <f:errors path="descripcion" cssClass="alert alert-danger"/>
                </div>
                <div class="form-group">
                    <label for="categoria">Categoría:</label>
                    <f:select path="categoria" id="categoria" cssClass="form-control" required="true">
                        <f:option value="Textil">Textil</f:option>
                        <f:option value="Promocional">Promocional</f:option>
                    </f:select>
                    <f:errors path="categoria" cssClass="alert alert-danger"/>
                </div>
                <div class="form-group">
                    <label for="precio">Precio</label>
                    <f:input path="precio" id="precio" cssClass="form-control" required="true" min="0.01"/>
                    <f:errors path="precio" cssClass="alert alert-danger"/>
                </div>
                <div class="form-group">
                    <label for="existencias">Existencias</label>
                    <f:input path="existencias" id="existencias" cssClass="form-control" required="true" />
                    <f:errors path="existencias" cssClass="alert alert-danger"/>
                </div>
                <button type="submit" class="btn btn-info">Guardar</button>
                <a class="btn btn-danger" href="<s:url value='/productos/list'/>">Cancelar</a>
            </f:form>
        </div>
    </div>
</div>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("nombreImagen").addEventListener("blur", function() {
            var enlaceImagen = this.value;
            var formatoValido = /\.(jpg|jpeg|png|gif)$/i.test(enlaceImagen);
            if (!formatoValido) {
                document.getElementById("nombreImagenError").textContent = "Ingrese un enlace de imagen válido.";
                document.getElementById("nombreImagenError").style.display = "block";
                this.focus();
            } else {
                document.getElementById("nombreImagenError").style.display = "none";
            }
        });
    });
</script>
</html>
