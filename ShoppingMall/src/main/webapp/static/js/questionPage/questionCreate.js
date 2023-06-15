/**
 * questionCreate.js
 */

 document.addEventListener('DOMContentLoaded', () => {
     
      // 문의 작성 버튼 클릭 이벤트 처리
    var questionBtn = document.getElementById('questionBtn');
    questionBtn.addEventListener('click', () => {
        var principal = '<%= request.getUserPrincipal() %>';
        if (!principal || principal === 'null') {
            var con = confirm("로그인을 하셔야 문의를 남길 수 있습니다");
            if (con) {
                location.href = "/joo/user/sign"; // 로그인 페이지로 이동하도록 수정할 수 있습니다.
            }
        } else { 
            location.href = "/joo/question/questionCreate?pid=${productId}";
        }
    });
     
 });