/**
 * 상품등록 이미지설정 js 페이지
 */

document.addEventListener('DOMContentLoaded', function() {

    // 파일인풋 찾기
    const title_image = document.querySelector('input#title_image');
    const detail_image = document.querySelector('input#detail_image');

    // 버튼
    const btnCreate = document.querySelector('input#btnCreate');
    const btnPrevious = document.querySelector('input#btnPrevious');
    const btnSkip = document.querySelector('input#btnSkip');

    // 폼
    const formSettingImage = document.querySelector('form#formSettingImage');

    // 완료버튼
   btnCreate.addEventListener('click', function() {

        //빈값 확인(둘중 하나라도 차있으면 넘어갈 수 있도록 한다.)
        if (title_image.value == "" && detail_image.value == "") {
            alert('값이 비어있습니다.')
            return;
        }
        
            alert('아직 미구현')
    });

   
    
    // 이전버튼
    btnPrevious.addEventListener('click', function() {

        history.back();

    });

    // 스킵버튼 (상품의 이미지기본값인 이미지준비중입니다. 사진을 보여준다.)
    btnSkip.addEventListener('click', function() {

        formSettingImage.submit();

    });




//---------------------------------------------------------------------------------------------


    // 파일인풋값이 변화할때, (해당 파일값을 다른 컨트롤러로 전송한다.)
    title_image.addEventListener('change', function() {

        // 파일이 추가되었을때, 이벤트 처리

    });
    detail_image.addEventListener('change', function() {

        // 파일이 추가되었을때, 이벤트 처리

    });


}); 