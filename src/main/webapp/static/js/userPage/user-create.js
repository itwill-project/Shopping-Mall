/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const form = document.querySelector('form#join-form');
	const joinBtn = document.querySelector('button#joinBtn');
	
	const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	joinBtn.addEventListener('click', () => {
		
		// input values
		const loginId = document.querySelector('input#loginId').value;
		const name = document.querySelector('input#name').value;
		const phone = document.querySelector('input#phone').value;
		const email = document.querySelector('input#email').value;
		const emailConfirm = document.querySelector('input#emailConfirm').value;
		const password = document.querySelector('input#password').value;
		const passwordConfirm = document.querySelector('input#passwordConfirm').value;
		const street = document.querySelector('input#street').value;
		const detailAddress = document.querySelector('input#detailAddress').value;
		const postcode = document.querySelector('input#postcode').value;
		
		// validation check
		const isIdValidated = document.querySelector('input#is-id-validated').value; // 아이디 중복 확인 여부 체크
		const isEmailValidated = document.querySelector('input#is-email-validated').value; // 이메일 인증 여부 체크
				
		if(loginId === '') {
			alert('아이디를 입력해주세요.');
			return;
		}
		if(isIdValidated === 'no') {
			alert('아이디 중복 확인을 해주세요.');
			return;
		}
		if(name === '') {
			alert('이름을 입력해주세요.');
			return;
		}
		if(phone === '') {
			alert('전화번호를 입력해주세요.');
			return;
		}
		if(email === '') {
			alert('이메일을 입력해주세요.');
			return;
		}
		if(!email.match(mailformat)) {
			alert('이메일 형식에 맞게 입력해주세요.');
			return;
		}
		if(emailConfirm === '') {
			alert('이메일 인증번호를 입력해주세요.');
			return;
		}
		if(isEmailValidated === 'no') {
			alert('이메일 인증을 완료해주세요.');
			return;
		}
		if(password === '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}
		if(passwordConfirm === '') {
			alert('비밀번호 확인을 입력해주세요.');
			return;
		}
		if(password !== passwordConfirm) {
			alert('비밀번호가 일치하지 않습니다.');
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
		
		form.action='/joo/user/join';
		form.method='post';
		form.submit();
	});
});