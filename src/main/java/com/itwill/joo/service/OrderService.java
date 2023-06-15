package com.itwill.joo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.dto.order.OrderHistoryDto;
import com.itwill.joo.dto.order.OrderedProductDto;
import com.itwill.joo.dto.order.OrdererInfoDto;
import com.itwill.joo.repository.OrderRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {

	private final OrderRepository orderRepository;

	public OrderedProductDto selectOrderedProduct(long id) {
		return orderRepository.selectOrderedProduct(id);
	}

	public OrdererInfoDto selectOrdererInfo(long id) {
		return orderRepository.selectOrdererInfo(id);
	}

	public List<OrderHistoryDto> selectOrderHistory(long id) {
		return orderRepository.selectOrderHistory(id);
	}

	public int deleteByOrderId(long id) {
		int resultSum = 0;

		resultSum += orderRepository.deleteOrder(id);
		resultSum += orderRepository.deleteOrderProduct(id);
		resultSum += orderRepository.deleteDelivery(id);
		return resultSum;
	}

	public int updateToBuyComple(long id) {
		return orderRepository.updateBuyComple(id);
	}

}