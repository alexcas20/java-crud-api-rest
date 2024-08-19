package com.jacs.apirest.apirest.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jacs.apirest.apirest.Entities.Producto;

public interface IProductoRepository extends JpaRepository<Producto, Long> {
    

}
