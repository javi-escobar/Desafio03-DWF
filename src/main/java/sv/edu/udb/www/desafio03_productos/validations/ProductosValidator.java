package sv.edu.udb.www.desafio03_productos.validations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import sv.edu.udb.www.desafio03_productos.entities.ProductosEntity;
import sv.edu.udb.www.desafio03_productos.model.ProductosModel;

import java.math.BigDecimal;

@Component
public class ProductosValidator implements Validator {

    private ProductosModel productosModel;

    @Override
    public boolean supports(Class<?> clazz) {
        return ProductosEntity.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ProductosEntity producto = (ProductosEntity) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "codigoProducto", "field.codigoProducto.required", "El código es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombreProducto", "field.nombreProducto.required", "El nombre es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "descripcion", "field.descripcion.required", "La descripción es obligatoria");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "categoria", "field.categoria.required", "La categoría es obligatoria");

        if (producto.getCodigoProducto() != null && !producto.getCodigoProducto().matches("PROD\\d{5}")) {
            errors.rejectValue("codigoProducto", "field.codigoProducto.invalid", "El código del producto debe tener el formato PROD#####.");
        }

        if (producto.getNombreProducto() != null && producto.getNombreProducto().length() < 5) {
            errors.rejectValue("nombreProducto", "field.nombreProducto.invalid", "El nombre del producto debe tener al menos 5 caracteres.");
        }

        if (producto.getDescripcion() != null && producto.getDescripcion().length() < 5) {
            errors.rejectValue("descripcion", "field.descripcion.invalid", "La descripción del producto debe tener al menos 5 caracteres.");
        }

        if (producto.getPrecio() != null && producto.getPrecio().compareTo(BigDecimal.ZERO) < 0) {
            errors.rejectValue("precio", "field.precio.invalid", "El precio del producto debe ser un valor decimal no negativo.");
        }

        if (producto.getExistencias() < 0) {
            errors.rejectValue("existencias", "field.existencias.invalid", "Las existencias del producto deben ser un valor entero no negativo.");
        }

    }
}
