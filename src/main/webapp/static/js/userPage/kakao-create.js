/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const form = document.querySelector('form#join-form');
	const joinBtn = document.querySelector('button#joinBtn');
	
	joinBtn.addEventListener('click', () => {
		
		// input values
		const phone = document.querySelector('input#phone').value;
		const street = document.querySelector('input#street').value;
		const detailAddress = document.querySelector('input#detailAddress').value;
		const postcode = document.querySelector('input#postcode').value;
				
		if(phone === '') {
			alert('전화번호를 입력해주세요.');
			return;
		}
		if(street === '') {
			alert('도로명 주소를 입력해주세요.');
			return;
		}
		if(detailAddress === '') {
			alert('상세 주소를 입력해주세요.');
			return;
		}
		if(postcode === '') {
			alert('우편번호를 입력해주세요.');
			return;
		}
		
		form.action='/joo/kakao/join';
		form.method='post';
		form.submit();
	});
});