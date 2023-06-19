package com.itwill.joo.controller;




import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.dto.ProductBasicSetting;
import com.itwill.joo.dto.ProductCreateDto;
import com.itwill.joo.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/admin")
@Controller
public class AdminController {

	private Random ra = new Random();
	private final ProductService productService;

	@GetMapping("/adminMain")
	public void AdmainMain() {
		log.info("AdmainMain()");
	}

	@GetMapping("/adminNewProductBasic")
	public void adminNewProductBasic() {
		log.info("새상품등록페이지이동");
	}

	@GetMapping("/adminNewProductImage")
	public void adminNewProductImage(@ModelAttribute("product") ProductBasicSetting productBasicSetting, Model model ) {
				
		model.addAttribute("product", productBasicSetting);
		
	}
	
	@PostMapping("/adminCreateProduct")
	public String adminCreateProduct(ProductCreateDto dto) {
		
		// 할인률이 0일때 랜덤값 처리
		if(dto.getPdiscount()==0) {
			int randomDiscount = ra.nextInt(20)+5;
			dto.setPdiscount(randomDiscount);
		}
		// dto.getName으로 된 파일이름의 폴더가 존재하는지 체크, 
		
		// 있을때 해당 폴더 안 타이틀이미지, 유무 체크후 있다면 해당경로 가져오기
		
		// 가져온 경로를 뒷내용 dto.setPtitleLimage로 설정
		
		log.info("새상품 등록");
		// db에 상품추가(이미지들이 null값일때는, 자동으로 기본값으로 세팅)
		productService.createProductWithOutImage(dto);
		return "redirect:/admin/adminMain";
		
	}
	
}
