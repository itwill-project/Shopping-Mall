/**
 * admin.jsp 화면 설정 adminPage
 */

 
document.addEventListener('DOMContentLoaded', function(){
	
	// 개발자 화면의 드롭select.option의 value를 확인하고, 표시할 화면 선택
	
	const modiDelForm = document.querySelector('#modiDelForm');
	
	const btnDelete = document.querySelector('#btnDelete');
	
	btnDelete.addEventListener('click', function() {
		const check = confirm('정말 삭제 하나요??');
		
		if (check) {
			modiDelForm.action = './delete';
			modiDelForm.method = 'post';
			modiDelForm.submit();
		}
	});
	
	
	const btnUpdate = document.querySelector('#btnUpdate');
	btnUpdate.addEventListener('click', () => {
		
		const title = document.querySelector('input#btitle').value;
		console.log(title);
		const content = document.querySelector('textarea#bcontent').value;
		console.log(content);
		const type = document.querySelector('input#btype').value;
		console.log(type);
		
		if (title === '' || content === '' || type === '') {
            alert('제목과 내용은 반드시 입력하세요.');
            return; // 함수 종료
        }
        
        const check = confirm('변경 내용을 저장할까요?');
        if (check) {
            modiDelForm.action = './update'; // 폼 요청 주소
            modiDelForm.method = 'post'; // 폼 요청 방식
            modiDelForm.submit();
        }
		
		
	});
	
		
	
	
	
	
});




