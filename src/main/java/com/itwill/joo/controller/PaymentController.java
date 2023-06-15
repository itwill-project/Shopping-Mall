package com.itwill.joo.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	private final IamportClient iamportClient;
	
	public PaymentController() {
		this.iamportClient = new IamportClient("2600328773634706", 
				"XgywrlDXHt3KLbPRKnwi2GtCc6XPh7bR93NfYdIdELYErDIYezTzGyPj8HsOo1C3Y0e6zcIgR3OvddJX");
	}
	
	@RequestMapping("/verify/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid) 
			throws IamportResponseException, IOException {
		return iamportClient.paymentByImpUid(imp_uid);
	}

}
