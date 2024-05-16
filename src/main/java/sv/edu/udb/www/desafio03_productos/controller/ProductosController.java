package sv.edu.udb.www.desafio03_productos.controller;

import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import sv.edu.udb.www.desafio03_productos.entities.ProductosEntity;
import sv.edu.udb.www.desafio03_productos.model.ProductosModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sv.edu.udb.www.desafio03_productos.validations.ProductosValidator;

@Controller
@RequestMapping("productos")
public class ProductosController {

    ProductosModel productosModel = new ProductosModel();

    ProductosValidator productosValidator = new ProductosValidator();

    // Listar Productos
    @GetMapping("list")
    public String listarProductos(Model model) {
        model.addAttribute("listaProductos", productosModel.listarProductos());
        return "productos/listar";
    }

    // Mostrar Formulario de Nuevo Producto
    @GetMapping("create")
    public String nuevoProducto(Model model) {
        model.addAttribute("producto", new ProductosEntity());
        return "productos/nuevo";
    }

    // Crear Producto
    @PostMapping("create")
    public String insertarProducto(@Valid @ModelAttribute("producto") ProductosEntity producto, BindingResult result, RedirectAttributes atributos) {
        productosValidator.validate(producto, result);
        if (result.hasErrors()) {
            return "productos/nuevo";
        }
        productosModel.insertarProducto(producto);
        atributos.addFlashAttribute("exito", "Producto registrado exitosamente");
        return "redirect:/productos/list";
    }

    // Obtener Producto
    @GetMapping("edit/{codigo}")
    public String obtenerProducto(@PathVariable("codigo") String codigo, Model model) {
        ProductosEntity producto = productosModel.obtenerProducto(codigo);
        model.addAttribute("producto", producto);
        return "productos/editar";
    }

    // Actualizar Producto
    @PostMapping("edit/{codigo}")
    public String modificarProducto(@Valid @ModelAttribute("producto") ProductosEntity producto, BindingResult result, RedirectAttributes atributos) {
        productosValidator.validate(producto, result);
        if (result.hasErrors()) {
            return "productos/editar";
        }
        productosModel.modificarProducto(producto);
        atributos.addFlashAttribute("exito", "Producto modificado exitosamente");
        return "redirect:/productos/list";
    }

    // Eliminar Producto
    @GetMapping("delete/{codigo}")
    public String eliminarProducto(@PathVariable("codigo") String codigo, RedirectAttributes atributos) {
        productosModel.eliminarProducto(codigo);
        atributos.addFlashAttribute("exito", "Producto eliminado exitosamente");
        return "redirect:/productos/list";
    }

    //Cliente
    @GetMapping("cliente")
    public String listarProductosCliente(Model model) {
        model.addAttribute("listaProductos", productosModel.listarProductos());
        return "productos/cliente";
    }

    //Buscar producto por nombre
    @PostMapping("cliente/buscar")
    public String buscarProductosPorNombreCliente(@RequestParam("nombre") String nombre, Model model) {
        model.addAttribute("listaProductos", productosModel.buscarProductosPorNombre(nombre));
        return "productos/cliente";
    }
}
