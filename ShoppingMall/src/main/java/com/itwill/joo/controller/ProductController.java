package com.itwill.joo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.joo.controller.ProductController;
import com.itwill.joo.domain.Product;
import com.itwill.joo.dto.question.QuestionsListDto;
import com.itwill.joo.service.ProductService;
import com.itwill.joo.service.QuestionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/product") // "/post" 로 시작하는 주소 다처리
@Controller
public class ProductController {

    private final ProductService productService;
    private final QuestionService questionService;
    
    // 상품들을 리스트에 보여줌.
	@GetMapping("/productsList")
	public void productList(Model model) {
	    List<Product> products = productService.getProductList();
	    model.addAttribute("products", products);
	}

	// 상품문의 정보에 product 번호를 받아옴으로써 그 제품의 상세정보를 확인
    @GetMapping("/productDetail")
    public void list(@RequestParam("pid") long pid, Model model) {
        log.info("GET: productQuestionsList()");
        
        // 컨트롤러는 서비스 계층의 메서드를 호출한 후 서비스 기능을 수행
        List<QuestionsListDto> list = questionService.readProductId(pid);
        
        // 뷰에 보여줄 데이터를 모델에 저장
        model.addAttribute("questionsList", list);
        model.addAttribute("productId", pid);
        log.info("questionsList: {}", list);
    }

	@GetMapping("/productsHotList")
	public void productsHotList() {

	}

	@GetMapping("/productsNewList")
	public void productsNewList() {

	}

}