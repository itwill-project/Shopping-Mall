package com.itwill.joo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.service.OrderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/order")
public class OrderRestController {
    
    private final OrderService orderService;
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Integer> deleteOrder(@PathVariable long id) {
        log.info("deleteOrder(id={})", id);
        
        int result = orderService.deleteByOrderId(id);
        
        return ResponseEntity.ok(result);
    }
    
    // -> 취소완료
    @PutMapping("/cancel/{id}")
    public ResponseEntity<Integer> updateToCancelComple(@PathVariable long id) {
        log.info("updateToCancelComple(id={})", id);
        
        int result = orderService.updateToCancelComple(id);
        
        return ResponseEntity.ok(result);
    }
    
    // -> 구매확정
    @PutMapping("/buy/{id}")
    public ResponseEntity<Integer> updateToBuyComple(@PathVariable long id) {
        log.info("updateToBuyComple(id={})", id);
        
        int result = orderService.updateToBuyComple(id);
        
        return ResponseEntity.ok(result);
    }
    
    
    

}