/**
 * payment.js
 * orderPage.jsp에서 사용됨.
 */

/*$(document).ready(function() {
    $("#paymentButton").click(function(e) {
        e.preventDefault(); // 폼 기본 동작을 중지시킵니다.

        // AJAX 요청을 보냅니다.
        $.ajax({
        url: "/",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
        userId: "${user.uid}",
        initialPrice: "${product.pprice * product.pstock}",
        discountPrice: "${user.ucurrent_point >= 10000 ? user.ucurrent_point : 0}",
        finalPrice: "${product.pprice * product.pstock + 3000 - (user.ucurrent_point >= 10000 ? user.ucurrent_point : 0)}",
        point: $("#pointInput").val()
                    },
        success: function(response) {
            // AJAX 요청이 성공하면 처리할 코드를 작성합니다.
            console.log(response); // 응답 데이터를 출력합니다.
            // 여기서 필요한 추가 작업을 수행합니다.
        },
        error: function(xhr, status, error) {
            // AJAX 요청이 실패하면 처리할 코드를 작성합니다.
            console.error(error); // 에러 메시지를 출력합니다.
            // 여기서 필요한 추가 작업을 수행합니다.
        }
            });
        });
    });*/
    
     const myModal = document.getElementById("myModal"); // 포인트 모달창 요소를 가져옴.
     const closeBtn = document.getElementsByClassName("close")[0]; // 포인트 모달 창을 닫는 요소를 가져옴.
      
     const myModalStock = document.getElementById("myModalStock"); // 포인트 모달창 요소를 가져옴.
     const closeBtnStock = document.getElementsByClassName("closeStock")[0]; // 포인트 모달 창을 닫는 요소를 가져옴.
      
     const paymentButton = document.getElementById("paymentButton"); // 결제하기 버튼 요소를 가져옴.
    
    var orderId = 0;
    $(document).ready(function() {
    // 결제완료 버튼 클릭 시 이벤트 핸들러 등록
    $("#paymentButton").click(function() {
        
        console.log('결제하기 버튼 클릭');
        const inputPoint = parseInt(document.getElementById("currentPoint").value);
        // const currentPoint = parseInt("<%= user.ucurrent_point %>");
        // 포인트 유효성 검사
        if (inputPoint != 0) {
            if (isNaN(inputPoint) || inputPoint < 10000 || inputPoint > currentPoint || inputPoint > productPrice) { // 숫자가 아니거나 10000포인트 미만이거나 현재 포인트보다 클 때
              console.log(inputPoint);
              console.log(currentPoint);
              console.log('포인트 잘못 입력');
              
              myModal.style.display = "block";
            } else {
              // 결제 처리 코드를 작성.
              // 포인트가 유효한 경우 결제 로직을 수행.
              console.log('포인트 정상 입력');
              
              const selectedMethod = $('input[name=paymentMethod]:checked', '#recipientInfo').val();
              
              if(selectedMethod === 'card') {
				  requestCardPay();
			  } else {
				  requestKakaoPay();
			  }
            } 
        }        
  });
});

	let data = null;

	// 결제
	var IMP = window.IMP;
  	IMP.init("imp84048403");
  	function requestCardPay() {
		  const email = $('#email').val();
	      const dStreet = $("#addr2").val();
	      const dDetailAddress = $("#detailAddr2").val();
	      const dPostcode = $("#postCode2").val();
	      const rName = $("#name2").val();
	      const rPhone = $("#phone2").val();
	      const oFinalPrice = productShipPrice - $("#currentPoint").val();
		  
	    IMP.request_pay({
	      pg: "html5_inicis.INIpayTest",
	      pay_method: "card",
	      merchant_uid: 'merchant_' + new Date().getTime(),
	      name: "노르웨이 회전 의자",
	      amount: oFinalPrice, // 실제 결제 금액
	      buyer_email: email,
	      buyer_name: rName,
	      buyer_tel: rPhone,
	      buyer_addr: dStreet + ", " + dDetailAddress,
	      buyer_postcode: dPostcode
	    }, function (rsp) { // callback	
	    	console.log(rsp);
	    	data = {
				"imp_uid": rsp.imp_uid,
				"merchant_uid": rsp.merchant_uid,
				"reason": "test",
				"cancel_amount": rsp.paid_amount
			};
	    	if(rsp.success) {
				$.ajax({
					  method: 'POST',
					  url: '/joo/payment/verify/' + rsp.imp_uid,
				  }).done(function(data) {
					  if(rsp.paid_amount === data.response.amount) {
						 alert('결제 성공: ' + rsp.paid_amount);
						 
						 // 결제 성공한 경우에만 주문 정보 저장
						 submitOrder();
		             } else {
						 alert('결제에 실패하였습니다. 에러 내용: ' + rsp.error_msg);
					 }
				  });
			} else {
				alert('결제에 실패하였습니다. 에러 내용: ' + rsp.error_msg);
			}
	    });
	  }
  	
	  function requestKakaoPay() {
		  const email = $('#email').val();
	      const dStreet = $("#addr2").val();
	      const dDetailAddress = $("#detailAddr2").val();
	      const dPostcode = $("#postCode2").val();
	      const rName = $("#name2").val();
	      const rPhone = $("#phone2").val();
	      const oFinalPrice = productShipPrice - $("#currentPoint").val();
		  
	    IMP.request_pay({
	      pg: "kakaopay.TC0ONETIME",
	      pay_method: "card",
	      merchant_uid: 'merchant_' + new Date().getTime(),
	      name: "노르웨이 회전 의자",
	      // amount: paymentPrice, // 실제 결제 금액
	      amount: oFinalPrice,
	      buyer_email: email,
	      buyer_name: rName,
	      buyer_tel: rPhone,
	      buyer_addr: dStreet + ", " + dDetailAddress,
	      buyer_postcode: dPostcode
	    }, function (rsp) { // callback	
	    	console.log(rsp);
	    	data = {
				"imp_uid": rsp.imp_uid,
				"merchant_uid": rsp.merchant_uid,
				"pay_method": rsp.pay_method,
				"amount": rsp.paid_amount
			};
	    	if(rsp.success) {
				$.ajax({
					  method: 'POST',
					  url: '/joo/payment/verify/' + rsp.imp_uid,
				  }).done(function(data) {
					  if(rsp.paid_amount === data.response.amount) {
						 alert('결제 성공: ' + rsp.paid_amount);
						 
						 // 결제 성공한 경우에만 주문 정보 저장
						 submitOrder();
		             } else {
						 alert('결제에 실패하였습니다. 에러 내용: ' + rsp.error_msg);
					 }
				  });
			} else {
				alert('결제에 실패하였습니다. 에러 내용: ' + rsp.error_msg);
			}
	    });
	  }
    
    function submitOrder() {
      // var uId = uId;
      // var oInitialPrice = productPrice;  
      var oDiscountPrice = $("#currentPoint").val();
      var oFinalPrice = productShipPrice - $("#currentPoint").val();
      // var oPoint = $("#mAllMileageSum").val();
      var oStatus = "결제완료"
      
      $.ajax({
        url: "/joo/api/order/order", // 컨트롤러의 URL을 적절히 수정해야 합니다.
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          u_id: uId,
          oinitial_price: productPrice,
          odiscount_price: oDiscountPrice,
          ofinal_price: oFinalPrice,
          opoint: point,
          ostatus: oStatus
          
        }),
        success: function(response) {
          // 성공적으로 데이터를 전송한 경우에 실행할 동작을 여기에 작성
          orderId = response;
          
          console.log(response);
          console.log("Order data inserted successfully.");
          
          submitPayment();
          submitOrderProduct(); // 주문 상품 정보 저장
          submitDelivery(); // 배송 정보 저장
          
          updateStockAndSold();
          updateCurrentPointWhenBuy();
          
        },
        error: function(error) {
          // 데이터 전송 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error inserting order data:", error);
        }
      });
    }
    
    function submitPayment() {
		data['o_id'] = orderId;
		
		$.ajax({
			method: 'POST',
			url: '/joo/api/payment/save',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: function(res) {
				console.log('Payment data inserted successfully.');
			}, error: function(error) {
				console.log(error);
			}
		});
	}
    
    function submitOrderProduct() { 
      // var pId 
      var oId = orderId // order의 o_id 리턴 받은 값으로 초기화
      console.log('주문상품 oid 테스트' + oId);
      var pCount = 10 // 수량 입력받아서 초기화
      // var pPrice
      
      $.ajax({
        url: "/joo/api/order/orderProduct", // 컨트롤러의 URL을 적절히 수정해야 합니다.
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          p_id: pId,
          o_id: oId,
          pcount: pCount,
          pprice: price
          
        }),
        success: function() {
          // 성공적으로 데이터를 전송한 경우에 실행할 동작을 여기에 작성
          console.log("OrderProduct data inserted successfully.");
          
        },
        error: function(error) {
          // 데이터 전송 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error inserting OrderProduct data:", error);
        }
      });
    }
    
    function submitDelivery() {
      var oId = orderId; 
      console.log('배송 oid 테스트' + oId);
      var dCode = "1234567890"; // 10자리 송장으로 변경
      var dStreet = $("#addr2").val();
      var dDetailAddress = $("#detailAddr2").val();
      var dPostcode = $("#postCode2").val();
      var rName = $("#name2").val();
      var rPhone = $("#phone2").val();
      var dMessage = $("#message").val();
      var dStatus = "결제완료"; 
      var dType = 1; 
      
      $.ajax({
        url: "/joo/api/order/delivery", // 컨트롤러의 URL을 적절히 수정
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          o_id: oId,
          dcode: dCode,
          dstreet: dStreet,
          ddetail_address: dDetailAddress,
          dpostcode: dPostcode,
          rname: rName,
          rphone: rPhone,
          dmessage: dMessage,
          dstatus: dStatus,
          dtype: dType
        }),
        success: function() {
          // 성공적으로 데이터를 전송한 경우에 실행할 동작을 여기에 작성
          console.log("Delivery data inserted successfully.");
          
        },
        error: function(error) {
          // 데이터 전송 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error inserting delivery data:", error);
        }
      });
    }
    
    function updateCurrentPointWhenBuy() {
      var oDiscountPrice = $("#currentPoint").val();
      console.log("차감될 포인트 금액 : " + oDiscountPrice);
      console.log("유저 아이디 : " + uId);  
        
      $.ajax({
        url: "/joo/api/order/currentPointWhenBuy", 
        method: "POST", // PUT 대신 POST 사용
        contentType: "application/json",
        data: JSON.stringify({
          odiscount_price: oDiscountPrice,
          u_id: uId
     
        }),
        success: function(response) {
          // 업데이트가 성공적으로 처리된 후에 실행할 동작을 여기에 작성
          console.log("결제완료 -> 현재 포인트가 차감되었습니다.", response);
        },
        error: function(error) {
          // 업데이트 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error updating currentPointWhenBuy:", error);
        }
      });
    }
    
    function updateStockAndSold() {
      var pCount = 10 // 수량 입력받아서 초기화  
        
      $.ajax({
        url: "/joo/api/order/stockAndSoldWhenBuy", // 
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          p_id: pId,
          pcount: pCount
        }),
        success: function(response) {
          // 업데이트가 성공적으로 처리된 후에 실행할 동작을 여기에 작성
          console.log("Stock and sold updated successfully:", response);
        },
        error: function(error) {
          // 업데이트 중에 에러가 발생한 경우에 실행할 동작을 여기에 작성
          console.error("Error updating stock and sold:", error);
        }
      });
    }




