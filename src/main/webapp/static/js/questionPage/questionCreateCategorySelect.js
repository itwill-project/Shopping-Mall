/**
 * questionCreateCategorySelect
*  문의사항 작성시 문의유형, 문의옵션 선택
 * /questions/questionCreate에 포함
 */

document.addEventListener('DOMContentLoaded', function() {
    // 문의유형 - 상품 문의 라디오버튼
    const productQuestionRadio = document.getElementById('productQuestion');
    // 문의유형 - 기타 문의 라디오버튼 
    const otherQuestionRadio = document.getElementById('otherQuestion');
    // 상품 이름
    const productNameInput = document.getElementById('productName');
    // 상품 가격
    const productPriceInput = document.getElementById('productPrice');
    // 문의 옵션 종류
    const questionOptions = document.getElementById('questionOptions');
    // 문의 옵션 선택
    const questionOptionSelect = document.getElementById('questionOptionSelect');
    // 문의 제목
    const questionTitleInput = document.getElementById('questionTitle');


    // 문의하기 작성 들어갈때 라디오버튼 체크 활성화
    productQuestionRadio.checked = true;
    // 문의하기 작성 들어갈때 기본 작성 값
    productNameInput.value = '선택한 상품 이름 사진정보 ';
    productPriceInput.value = '선택한 상품 가격';
    questionTitleInput.value = productNameInput.value;
    // 문의하기 작성 들어갈때 문의옵션 보이기
    questionOptions.style.display = 'block';
    productQuestionOptions();

    productQuestionRadio.addEventListener('change', function() {
        if (productQuestionRadio.checked) {
            productNameInput.value = '선택한 상품 이름 사진정보 ';
            productPriceInput.value = '선택한 상품 가격';
            questionTitleInput.value = productNameInput.value;
            questionOptions.style.display = 'block';
            productQuestionOptions();
        }
    });

    otherQuestionRadio.addEventListener('change', function() {
        if (otherQuestionRadio.checked) {
            questionTitleInput.value = '';
            questionOptions.style.display = 'block';
            otherQuestionOptions();
        }
    });



    function productQuestionOptions() {
        questionOptionSelect.innerHTML = `
      <option value="">선택하세요</option>
      <option value="배송">배송</option>
      <option value="재입고">재입고</option>
      <option value="기타">기타</option>
    `;
    }

    function otherQuestionOptions() {
        questionOptionSelect.innerHTML = `
      <option value="">선택하세요</option>
      <option value="취소관련">취소관련</option>
      <option value="주문관련">주문관련</option>
      <option value="회원정보">회원정보</option>
      <option value="서비스">서비스</option>
      <option value="기타">기타</option>
    `;
    }
});