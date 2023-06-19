package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Product;
import com.itwill.joo.dto.ProductCreateDto;
import com.itwill.joo.dto.ProductListPageDto;
import com.itwill.joo.dto.ProductSearchDto;

public interface ProductRepository {

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
	 * @return 수정된 행의 수 (성공1/실패0)
	 */
	int updateProductWithProduct(Product product);

	/**
	 * (상품검색/관리자)P_ID로 상품 하나를 검색 하기 위한 메서드
	 * @param long id
	 * @return Product객체 
	 */
	Product selectById(long id);
	
	/**
	 * (제품검색/관리자)제품을 검색하기 위한 메서드.
	 * @param String search 검색한 문장 (이름, 카테고리, 지역, )
	 * @return 검색결과의 
	 */
	List<Product> selectBySearch(String search);

	/**
	 * (제품검색/관리자) 제고수가 없는 순서의 제품 리스트를 보기위한 메서드.
	 * @return List<Product>
	 */
	List<Product> selectThatNoPstock();
	
	//----------------------------[유저] 상품 리스트-------------------------------
	
	// 신상품 보기
	List<Product> selectByNew();
	// 인기상품 보기
	List<Product> selectByHot();
	// 전통주상품 보기
	List<Product> selectByOld();
	// 소주상품 보기
	List<Product> selectBySoju();
	// 맥주상품 보기
	List<Product> selectByBear();
	// 기타상품 보기
	List<Product> selectByAnother();
	// 검색상품 보기
	List<Product> selectByUserSearch(ProductSearchDto dto);

}
