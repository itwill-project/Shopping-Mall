package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Product;

public interface ProductRepository {
    
    List<Product> selectAllProducts();

    Product selectProductById(long id);

    /**
     * (모든상품/유저)상품리스트 페이지 보여주기 위한 메서드.
     * (모든상품/관리자)상품리스트 페이지 보여주기 위한 메서드.
     * @author 김세엽
     * @return List<ProductListPageDto>
     */
    List<Product> selectOrderByModifiedTime();
    
    /**
     * (신상품/유저)상품리스트 페이지 보여주기 위한 메서드.
     * @author 김세엽
     * @return List<ProductListPageDto>
     */
    List<Product> selectOrderByCreatedTimeDesc();

    /**
     * (인기상품/유저)상품리스트 페이지 보여주기 위한 메서드.
     * @author 김세엽
     * @return List<ProductListPageDto>
     */
    List<Product> selectOrderByPsodDesc();
    
    /**
     * (제품추가/관리자)제품을 추가 하기 위한 메서드(사진제외). 
     * @param Product product (상품 도메인)
     * @return 추가된 행의 수 (성공1/실패0)
     */
    int insertNewProductWithOutImage(Product product);
    
    /**
     * (제품삭제/관리자)제품을 삭제하기 위한 메서드.
     * @param long id (상품의 상품번호)
     * @return 삭제된 행의 수 (성공1/실패0)
     */
    int deleteProductWithId(long id);

    /**
     * (상품수정/관리자)제품을 수정하기 위한 메서드.
     * @param Product product (상품자체)
     * @return
     */
    int updateProductWithProduct(Product product);

    /**
     * (상품검색/관리자)P_ID로 상품 하나를 검색 하기 위한 메서드
     * @param long id
     * @return 객체 
     */
    Product selectById(long id);
    

}
