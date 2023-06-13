package com.itwill.joo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Product;
import com.itwill.joo.repository.ProductRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ProductService {
    
    private final ProductRepository productRepository;
    
    public List<Product> getProductList() {
        log.info("getProductList()");
        return productRepository.selectAllProducts();
    }
    
    public Product getProduct(long id) {
        log.info("getProduct({})", id);
        return productRepository.selectProductById(id);
    }

}
