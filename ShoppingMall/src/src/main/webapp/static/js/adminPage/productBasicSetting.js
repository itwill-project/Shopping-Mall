/**
 * 제품생성 페이지(adminNewProduct.jsp)에서 요청할 js파일
 */

document.addEventListener('DOMContentLoaded', function() {

    // 등록/ 취소버튼
    const btnNext = document.querySelector('input#btnNext');
    const btnPrevious = document.querySelector('input#btnPrevious');
    
    const formCreatNewProduct = document.querySelector('#formCreatNewProduct');
    
    //새 상품등록시에 input 내용들과 파일 처리하기
    const nextPage = (e) => {
        e.preventDefault();
        
        // input,select 전부 가져오기
        const pname = document.querySelector('input#pname').value;
        const pcategory = document.querySelector('select#pcategory').value;
        const pprice = document.querySelector('input#pprice').value;
        const palc = document.querySelector('input#palc').value;
        const pregion = document.querySelector('select#pregion').value;
        const pstock = document.querySelector('input#pstock').value;
        const pvolume = document.querySelector('input#pvolume').value;
        const pdiscount = document.querySelector('input#pdiscount').value;
        
        // 체킹
        if(pname==''||pcategory==''||pprice==''||palc==''||pregion==''||pstock==''||pvolume==''||pdiscount==''){
            alert('비어있는 값을 확인하세요')
            return;
        }
        
        // 체크
        const check = confirm('제대로 설정하셨나요(제품이름/용량/제고수)?');
        if(!check){
            return;
        }
        
        formCreatNewProduct.submit();
    }
    
    const previousPage = (e) => {
        
        // 이전페이지로 이동
        history.back();
        
    };

    btnNext.addEventListener('click', nextPage);
    btnPrevious.addEventListener('click', previousPage);

});