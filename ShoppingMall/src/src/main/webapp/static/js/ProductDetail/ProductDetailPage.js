/**
 * 
 */

 document.addEventListener('DOMContentLoaded', function(){
     
     let count = 0;
     
     // 수량 증가
     function countUp(){
         count++;
         
         if(count>5){
             alert('구매 갯수 제한입니다.(1인당 최대 5병)');
             count--;
             return;
         }
        productCount.innerHTML = count;
        productCount.innerHTML += ' 개';
        finalPrice.innerHTML = (document.querySelector('input#pprice').value*count);
        
     }
     
     // 수량 감소
     function countDown (){
         count--;
        productCount.innerHTML = count;
        productCount.innerHTML += ' 개';
         // 수량 0일때 안보이기
         if(count==0){
         const addProductOption = document.querySelector('div#addProductBasicOption');
         addProductOption.classList.replace('hello', 'd-none');
        finalPrice.innerHTML = (document.querySelector('input#pprice').value*count);
         }
     }
         
     const btnPlus = document.querySelector('button#btnPlus');
     const btnMinus = document.querySelector('button#btnMinus');
    btnPlus.addEventListener('click', countUp);
    btnMinus.addEventListener('click', countDown);

     const selctProductOption = document.querySelector('select#selctProductOption');
     selctProductOption.addEventListener('change', function(){
         
         const addProductOption = document.querySelector('div#addProductBasicOption');
         addProductOption.classList.replace('d-none', 'hello');
         
         let productCount = document.querySelector('span#productCount');
         let finalPrice = document.querySelector('span#finalPrice');
         count++;
          if(count>5){
             alert('구매 갯수 제한입니다.(1인당 최대 5병)');
             count--;
             selctProductOption.selectedIndex  = 0;
             return;
         }
         productCount.innerHTML = count;
        productCount.innerHTML += ' 개';
         finalPrice.innerHTML = document.querySelector('input#pprice').value;
         // select값 다시 값 초기화
         selctProductOption.selectedIndex  = 0;
     });
     
     // 금액용량
     const pvolume = document.querySelector('input#pvolume');
     const pprice = document.querySelector('input#pprice');
  
     
     
     // 수량은 count로 상품아이디는 쿼리스트링 p_id로 가져가시면 됩니다.
     // 페이지 이동
     const btnOrder = document.querySelector('button#btnOrder');
     const btnBasket = document.querySelector('button#btnOrder');
     
     function goOrderPage (){} 
     function goBasketPage (){} 
     
     btnOrder.addEventListener('click', goOrderPage);
     btnBasket.addEventListener('click', goBasketPage);
     
     
     // ---------------------------- 스크롤 처리 --------------------------------
    window.addEventListener('scroll', function() {
    
        let scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
        const review = document.querySelector('div#review'); 
        const question = document.querySelector('div#question'); 
        
        
        // 특정 지점과 비교하여 동작 수행
        if (scrollPosition > 600 && scrollPosition <= 4500) {
            // 스크롤 위치가 600보다 큰 경우 동작 수행
            let productNav = document.querySelector('nav#productNav');
            let viewProductDetail = document.querySelector('a#viewProductDetail');
            let viewProductReiview = document.querySelector('a#viewProductReiview');
            let viewProductQuestion = document.querySelector('a#viewProductQuestion');
            // 기존 nav창 이 위로고정
            productNav.classList.add('fixed-top');
            console.log(scrollPosition);
            
        } else if(scrollPosition > 4500 && scrollPosition <= 5470){
            productNav.classList.add('fixed-top');
            
        }else if(scrollPosition > 5470){
            productNav.classList.add('fixed-top');
        
        }else{
            // 스크롤 위치가 600보다 작거나 같은 경우 동작 수행
            productNav.classList.remove('fixed-top');

        }
    });

     
     
     
 });