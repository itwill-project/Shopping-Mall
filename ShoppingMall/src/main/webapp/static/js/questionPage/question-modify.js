/**
 *  question-modify.js
 *  /question/questionModify.jsp 에서 사용
 */

document.addEventListener('DOMContentLoaded', () =>{
    
    const modifyForm = document.querySelector('#modifyForm');
      
    
   // 삭제버튼을 찾아서 이벤트 리스너 등록
    const btnDelete = document.querySelector('#btnDelete');
    btnDelete.addEventListener('click', () => {
       const check = confirm('문의 내용이 있습니다. 정말 삭제할까요?')
            if(check) {
                modifyForm.action ='./questionDelete'; // 폼 요청 주소
                modifyForm.method ='post'; // 폼 요청 방식
                modifyForm.submit(); // 폼 제출 -> 요청을 서버로 보냄
            }
        
        
        
    });
    
    // 수정버튼을 찾아서 이벤트 리스너 등록
   const btnUpdate = document.querySelector('#btnUpdate');
   btnUpdate.addEventListener('click', () => {
        // 제목과 내용이 입력되어 있는지 체크.
        const qtitle = document.querySelector('input#qtitle').value;
        const qcontent = document.querySelector('textarea#qcontent').value;
        
        if(qtitle === '' || qcontent === '') {
            alert('제목과 내용은 반드시 입력하세요.');
            return; // 함수 종료
        }
        
        const check =  confirm('변경내용을 저장할까요?');
        if(check) {
        modifyForm.action = './questionUpdate'; // 폼 요청 주소
        modifyForm.method = 'post'; // 폼 요청 방식
        modifyForm.submit();
      }
        
    });
    
});