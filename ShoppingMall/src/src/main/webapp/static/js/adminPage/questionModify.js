/**
 * 제품 읽기/수정/삭제 처리
 */

 document.addEventListener('DOMContentLoaded', function(){
     
    
     
     
     // 개발자 화면의 드롭select.option의 value를 확인하고, 표시할 화면 선택
    const menu = document.querySelector('#menu');       
    
    menu.addEventListener('change', function(){
        
        // 값 읽기
        const selectedMenu = menu.value;
        // 기존 div 초기화
        selectedContens.innerHTML = "";

        if(selectedMenu=="question"){
                        
            selectedContens.innerHTML = "";
            
        }else if(selectedMenu=="user"){
                                    
            selectedContens.innerHTML = 
            
        }else if(selectedMenu=="quseries"){ 
                                    
            selectedContens.innerHTML =  "";
            
        }else if(selectedMenu=="review"){
                                    
            selectedContens.innerHTML = "";
            
        }else if(selectedMenu=="post"){
                                    
            selectedContens.innerHTML =  "";
        }
        
    });
    
 });
 