package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Product;

public interface ProductRepository {
    
    List<Product> selectAllProducts();

    Product selectProductById(long id);

}
