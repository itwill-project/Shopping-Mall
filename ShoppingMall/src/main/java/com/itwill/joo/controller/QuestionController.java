package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.joo.dto.question.QuestionDetailDto;
import com.itwill.joo.dto.question.QuestionUpdateDto;
import com.itwill.joo.domain.Product;
import com.itwill.joo.dto.question.QuestionCreateDto;
import com.itwill.joo.dto.question.QuestionsListDto;
import com.itwill.joo.service.ProductService;
import com.itwill.joo.service.QuestionService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/question") // "/questions" 로 시작하는 주소 다처리
@Controller
public class QuestionController {

    private final ProductService productService;
    private final UserService userService;
    private final QuestionService questionService;

    //상품 디테일 페이지에서 해당 상품의 문의사항을 확인
    @GetMapping("/questionDetail")
    public void questionDetail(@RequestParam("pid") long pid, Model model) {
        log.info("detail(id={})", pid);
        
        QuestionDetailDto dto = questionService.read(pid);
        
        model.addAttribute("question", dto);
        
        
    }
    
    @GetMapping("/questionsList")
    public void list( Model model, long p_id) {
        log.info("GET: productQuestionsList()");

        // 컨트롤러는 서비스 계층의 메서드를 호출한 후 서비스 기능을 수행
        List<QuestionsListDto> list = questionService.readProductId(p_id);
        
        // 뷰에 보여줄 데이터를 모델에 저장
        model.addAttribute("questionsList", list);

        
        log.info("questionsList: {}", list);
    }

    @GetMapping("/questionCreate")
    public void create(@RequestParam(name="pid", required=false ) long pid, Principal principal, Model model) {
        log.info("GET: questionCreate()");
            
        long userId = userService.select(principal.getName()).getId();
        Product product = productService.getProduct(pid);
        model.addAttribute("userid", userId);
        model.addAttribute("product", product);
        model.addAttribute("login_id", principal.getName());
    
   
    }
    

    @PostMapping("/questionCreate") 
	public String create(QuestionCreateDto dto) {
        log.info("POST: questionCreate() - {}", dto);

        int result = questionService.create(dto);
        log.info("Question 등록 결과={}", result);

        return "redirect:/question/questionsList?p_id=" + dto.getP_id();
    }
    
    // GET매핑으로 수정하
    @GetMapping("/questionModify")
    public void modify(long id, Model model) {
        log.info("questionModify(id={}", id);
        
        QuestionDetailDto dto = questionService.read(id);
        model.addAttribute("question", dto);
    }
    
    @PostMapping("/questionDelete")
    public String delete( long id) {
        log.info("questionDelete(id={}", id);
        
        int result =questionService.delete(id);
        log.info("문의 삭제 결과={}", result);
        
        return "redirect:/question/questionsList";
       
    }
    
    @PostMapping("/questionUpdate")
    public String update(QuestionUpdateDto dto) {
        log.info("questionUpdate(dto={}", dto);
        
        int result = questionService.update(dto);
        log.info("업데이트 결과={}", result);
        
        return "redirect:/question/questionDetail?id=" + dto.getId();
    }
    
    
    
    
    @GetMapping("/myQuestionsList")
    public String myQuestionList( Principal principal, Model model) {
        String loginId = principal.getName();
        long u_id = userService.getUserInfo(loginId).getId();
        
        log.info("GET: MyQuestionsList()", u_id);

        // 컨트롤러는 서비스 계층의 메서드를 호출한 후 서비스 기능을 수행
        List<QuestionsListDto> list = questionService.readAllByUserId(u_id);
        
        // 뷰에 보여줄 데이터를 모델에 저장
        // 모델에 설정해준 myQusestionsList 이름을 jsp 에서 불러올때 똑같이 해줘야함
        model.addAttribute("myQusestionsList", list);

        
        log.info("myQuestionsList: {}", list);
        
        return "question/questionsMyList";
    }
    
    
    
    
    
    
    
    
    
    
    // 아래부터는 QNA 컨트롤러
    
    // QNA 목록
    @GetMapping("/questionQnaList")
    public void questionsQnaList(Model model) {
        log.info("questionQnaList()");
        
        List<QuestionsListDto> list = questionService.readQna();
        
        model.addAttribute("questionQnaList",list);
    }
    
    // QNA 상세보기 
    @GetMapping("/questionQnaDetail")
    public void questionQnaDetail(@RequestParam("id") long id, Model model) {
        log.info("detail(id={})", id);
        
        QuestionDetailDto dto = questionService.readQna(id);
        
        model.addAttribute("question", dto);
        
        
    }
    
    
    //QNA 작성 get mapping
    @GetMapping("/questionQnaCreate")
    public void createQna(Principal principal, Model model) {
        log.info("GET: quesitonCreate()");
        
        long userId = userService.select(principal.getName()).getId();
        model.addAttribute("userId", userId);
    }
    
  
    
    // craete Post 작성 보내기
    @PostMapping("/questionQnaCreate")
    public String createQna(QuestionCreateDto dto) {
        log.info("POST: create({})", dto);
        
        int result = questionService.createQna(dto);
        log.info("문의사항 작성결과 = {}", result);
        
        return "redirect:/question/questionQnaList";
    }
    
    // QNA GET매핑으로 수정하기
    @GetMapping("/questionQnaModify")
    public void modifyQna(long id, Model model) {
        log.info("questionModify(id={}", id);
        
        QuestionDetailDto dto = questionService.readQna(id);
        model.addAttribute("question", dto);
    }
    
    @PostMapping("/questionQnaDelete")
    public String deleteQna( long id) {
        log.info("questionDelete(id={}", id);
        
        int result =questionService.deleteQna(id);
        log.info("문의 삭제 결과={}", result);
        
        return "redirect:/question/questionQnaList";
       
    }
    
    @PostMapping("/questionQnaUpdate")
    public String updateQna(QuestionUpdateDto dto) {
        log.info("questionUpdate(dto={}", dto);
        
        int result = questionService.updateQna(dto);
        log.info("업데이트 결과={}", result);
        
        return "redirect:/question/questionQnaDetail?id=" + dto.getId();
    }
    

}