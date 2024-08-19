package com.jacs.apirest.apirest.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jacs.apirest.apirest.Repositories.IProductoRepository;
import com.jacs.apirest.apirest.Entities.Producto;

@RestController
@RequestMapping("/productos")
public class ProductoController {

    @Autowired
    private IProductoRepository productoRepository;

    // Metodos HTTP

    @GetMapping
    public List<Producto> ObtenerProductos() {
        return productoRepository.findAll();
    }

    @GetMapping("/{id}")
    public Producto obtenerProductoPorId(@PathVariable Long id) {
        return productoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("No se encontro el producto con el ID: " + id));
    }

    @PostMapping
    public Producto crearProducto(@RequestBody Producto producto) {
        return productoRepository.save(producto);
    }

    @PutMapping("/{id}")
    public Producto actualizarProducto(@PathVariable Long id, @RequestBody Producto producto) {
        Producto productoEncontrado = productoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("No se encontro el producto con el ID: " + id));

        productoEncontrado.setNombre(producto.getNombre());
        productoEncontrado.setPrecio(producto.getPrecio());

        return productoRepository.save(productoEncontrado);
    }

    @DeleteMapping("/{id}")
    public String eliminarProducto(@PathVariable Long id){
        Producto productoEncontrado = productoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("No se encontro el producto con el ID: " + id));

        productoRepository.delete(productoEncontrado);
        return "El producto con el ID: " + id + " fue eliminado correctamente";
    }

    

}
