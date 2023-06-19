/**
 * 상품 리스트 보여주는 페이지
 */
document.addEventListener('DOMContentLoaded', function(){
    
    // 버튼찾기(네비게이션바)
    const aNewList = document.querySelector('a#aNewList');
    const aHotist = document.querySelector('a#aHotist');
    const aOldList = document.querySelector('a#aOldList');
    const aSojuList = document.querySelector('a#aSojuList');
    const aBearList = document.querySelector('a#aBearList');
    const aAnotherList = document.querySelector('a#aAnotherList');
    
     // 상품 data를 받아 설정
    const makeProductElemants = (data) => {
        
        // 버튼이 변경될 때마다 채워질 div
        const selectedCategory = document.querySelector('div#selectedCategory');
        let ProductCardStr = '';    
        
        if(data==""){
            selectedCategory.innerHTML = `
                <img class="rounded mx-auto d-block" src="../static/assets/porducts/noImage/noList/NoProdutsList.png" alt="NoProdutsList">
            `; 
            return;
        }
        
        // 요소체울 반복문
        for(let product of data){
            let btnColor = 'primary';
            let btnState = 'order now';
            // 제고수에 따라 버튼 상태변경
            if(product.pstock == 0){
                btnColor = 'danger';
                btnState = 'sold out';
                // ptitle 이미지 제고 없음 이미지로 변경
            }
            
            let discount = product.pdiscount;
            // 할인율 0일때 10으로 수정
            if(discount==0){
                discount=10;
            }
            
            // 할인전 가격
            let discountP = product.pprice+(product.pprice*((discount)/100));
            
            ProductCardStr +=`
                        <div class="col">
                            <div class="card my-3 p-3" 
                                style="width: 18rem; cursor: pointer;"
                                OnClick="location.href ='/joo/product/productDetail?p_id=${ product.p_id }'">

                                <img src="${ product.ptitle_image }"
                                    class="card-img-top" alt="oneProduct">
    
                                <div class="card-body">
                                    <h5 class="card-title">${ product.pname }</h5>
                                    <p class="card-text">
                                    
                                        <!-- 랜덤값 넣기 -->
                                        
                                        <del>${discountP}원</del><span> -> ${discount}% 할인!</span> 
                                    </p>
                                    
                                    <p class="card-text">${ product.pprice }원</p>
    
                                    <!-- 제고수에 따라 sold out, order now 구분 -->
                                        <button class="btn btn-outline-${btnColor} col-12 mx-auto">${btnState}</button>
                                </div>
                            </div>
                        </div>
            `;
            
            selectedCategory.innerHTML = ProductCardStr;
        }
    }// 
    
    // 상품목록 30개만 보여주기(최신/인기 제품)
    const makeProductElemantsF = (data) => {
        // 버튼이 변경될 때마다 채워질 div
        const selectedCategory = document.querySelector('div#selectedCategory');
        let ProductCardStr = '';    
        
        if(data==""){
            // TODO 중앙정렬
            selectedCategory.innerHTML = `
                <img class="rounded mx-auto d-block" src="../static/assets/porducts/noImage/noList/NoProdutsList.png" alt="NoProdutsList">
            `; 
            return;
        }
        
        // count
        let count =0;
        // 요소체울 반복문
        for(let product of data){
            // 횟수 
            count++;
            if(count==30){
                return;
            }
            
            let btnColor = 'primary';
            let btnState = 'order now';
            // 제고수에 따라 버튼 상태변경
            if(product.pstock == 0){
                btnColor = 'danger';
                btnState = 'sold out';
                // ptitle 이미지 제고 없음 이미지로 변경
            }
            
            let discount = product.pdiscount;
            // 할인율 0일때 10으로 수정
            if(discount==0){
                discount=10;
            }
            
            // 할인전 가격
            let discountP = product.pprice+(product.pprice*((discount)/100));
            
            ProductCardStr +=`
                        <div class="col">
                            <div class="card my-3 p-3 position-relative"
                                style="width: 18rem; cursor: pointer;"
                                OnClick="location.href ='/joo/product/productDetail?p_id=${ product.p_id }'">
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">hot(${count}위)<span class="visually-hidden">unread messages</span></span>
    
                                <img src="${ product.ptitle_image }"
                                    class="card-img-top" alt="oneProduct">
    
                                <div class="card-body">
                                    <h5 class="card-title">${ product.pname }</h5>
                                    <p class="card-text">
                                    
                                        <!-- 랜덤값 넣기 -->
                                        
                                        <del>${discountP}원</del><span> -> ${discount}% 할인!</span> 
                                    </p>
                                    
                                    <p class="card-text">${ product.pprice }원</p>
    
                                    <!-- 제고수에 따라 sold out, order now 구분 -->
                                        <button class="btn btn-outline-${btnColor} col-12 mx-auto">${btnState}</button>
                                </div>
                            </div>
                        </div>
            `;
            
            selectedCategory.innerHTML = ProductCardStr;
        }
    }// 
    
    const makeProductElemantsN = (data) => {
        // 버튼이 변경될 때마다 채워질 div
        const selectedCategory = document.querySelector('div#selectedCategory');
        let ProductCardStr = '';    
        
        if(data==""){
            selectedCategory.innerHTML = `
                <img class="rounded mx-auto d-block" src="../static/assets/porducts/noImage/noList/NoProdutsList.png" alt="NoProdutsList">
            `; 
            return;
        }
        
        // count
        let count =0;
        // 요소체울 반복문
        for(let product of data){
            // 횟수 
            count++;
            if(count==30){
                return;
            }
            
            let btnColor = 'primary';
            let btnState = 'order now';
            // 제고수에 따라 버튼 상태변경
            if(product.pstock == 0){
                btnColor = 'danger';
                btnState = 'sold out';
                // ptitle 이미지 제고 없음 이미지로 변경
            }
            
            let discount = product.pdiscount;
            // 할인율 0일때 10으로 수정
            if(discount==0){
                discount=10;
            }
            
            // 할인전 가격
            let discountP = product.pprice+(product.pprice*((discount)/100));
            
            ProductCardStr +=`
                        <div class="col">
                            <div class="card my-3 p-3 position-relative"
                                style="width: 18rem; cursor: pointer;"
                                OnClick="location.href ='/joo/product/productDetail?p_id=${ product.p_id }'">
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">new<span class="visually-hidden">unread messages</span></span>
    
                                <img src="${ product.ptitle_image }"
                                    class="card-img-top" alt="oneProduct">
    
                                <div class="card-body">
                                    <h5 class="card-title">${ product.pname }</h5>
                                    <p class="card-text">
                                    
                                        <!-- 랜덤값 넣기 -->
                                        
                                        <del>${discountP}원</del><span> -> ${discount}% 할인!</span> 
                                    </p>
                                    
                                    <p class="card-text">${ product.pprice }원</p>
    
                                    <!-- 제고수에 따라 sold out, order now 구분 -->
                                        <button class="btn btn-outline-${btnColor} col-12 mx-auto">${btnState}</button>
                                </div>
                            </div>
                        </div>
            `;
            
            selectedCategory.innerHTML = ProductCardStr;
        }
    }// 
    // 클래스(클릭상태) 초기화
    const resetAClass =() =>{
        aNewList.classList.remove('active');
        aHotist.classList.remove('active');
        aOldList.classList.remove('active');
        aSojuList.classList.remove('active');
        aBearList.classList.remove('active');
        aAnotherList.classList.remove('active');
    }

    //--신상품리스트------------------------------------------------------------------------------------
    // 신상품 리스트 보여주기 
    const showNewList = async () => {
        // 검색창 표시 안보이기
        document.querySelector('div#divSearchWord').classList.replace('text-center', 'd-none');
        // 버튼 상태 초기화
        resetAClass();
        // 버튼 한곳으로 active 추가
        aNewList.classList.add('active');
        
        // 보내질 주소        
        const reqUrl = `/joo/api/ProductList/showNewList`;
        // 처리
        try{
            const response = await axios.get(reqUrl);
            makeProductElemantsN(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    }
    
    // 맨처음 해당 페이지로 이동했을때 
    showNewList();
    
    //--인기상품리스트------------------------------------------------------------------------------------
    // 인기상품 리스트 보여주기 
    const showHotList = async () => {
        // 검색창 표시 안보이기
        document.querySelector('div#divSearchWord').classList.replace('text-center', 'd-none');
        // 버튼 상태 초기화
        resetAClass();
        // 버튼 한곳으로 active 추가
        aHotist.classList.add('active');
        
        // 보내질 주소        
        const reqUrl = `/joo/api/ProductList/showHotList`;
        // 처리
        try{
            const response = await axios.get(reqUrl);
            makeProductElemantsF(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    }
    //--전통주상품리스트------------------------------------------------------------------------------------
    // 전통주상품 리스트 보여주기 
    const showOldList = async () => {
        // 검색창 표시 안보이기
        document.querySelector('div#divSearchWord').classList.replace('text-center', 'd-none');
        // 버튼 상태 초기화
        resetAClass();
        // 버튼 한곳으로 active 추가
        aOldList.classList.add('active');
        
        // 보내질 주소        
        const reqUrl = `/joo/api/ProductList/showOldList`;
        // 처리
        try{
            const response = await axios.get(reqUrl);
            makeProductElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    }
    //--소주상품리스트------------------------------------------------------------------------------------
    // 소주상품 리스트 보여주기 
    const showSojuList = async () => {
        // 검색창 표시 안보이기
        document.querySelector('div#divSearchWord').classList.replace('text-center', 'd-none');
        // 버튼 상태 초기화
        resetAClass();
        // 버튼 한곳으로 active 추가
        aSojuList.classList.add('active');
        
        // 보내질 주소        
        const reqUrl = `/joo/api/ProductList/showSojuList`;
        // 처리
        try{
            const response = await axios.get(reqUrl);
            makeProductElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    }
    //--맥주상품리스트------------------------------------------------------------------------------------
    // 맥주상품 리스트 보여주기 
    const showBearList = async () => {
        // 검색창 표시 안보이기
        document.querySelector('div#divSearchWord').classList.replace('text-center', 'd-none');
        // 버튼 상태 초기화
        resetAClass();
        // 버튼 한곳으로 active 추가
        aBearList.classList.add('active');
        
        // 보내질 주소        
        const reqUrl = `/joo/api/ProductList/showBearList`;
        // 처리
        try{
            const response = await axios.get(reqUrl);
            makeProductElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    }
    //--기타상품리스트------------------------------------------------------------------------------------
    // 기타상품 리스트 보여주기 
    const showAnotherList = async () => {
        // 검색창 표시 안보이기
        document.querySelector('div#divSearchWord').classList.replace('text-center', 'd-none');
        // 버튼 상태 초기화
        resetAClass();
        // 버튼 한곳으로 active 추가
        aAnotherList.classList.add('active');
        
        // 보내질 주소        
        const reqUrl = `/joo/api/ProductList/showAnotherList`;
        // 처리
        try{
            const response = await axios.get(reqUrl);
            makeProductElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    }
    
    // 리스트 보여주기 
    aNewList.addEventListener('click', showNewList);
    aHotist.addEventListener('click', showHotList);
    aOldList.addEventListener('click', showOldList);
    aSojuList.addEventListener('click', showSojuList);
    aBearList.addEventListener('click', showBearList);
    aAnotherList.addEventListener('click', showAnotherList);
    
    // 상세검색 요소들 찾기 ---------------------------------------------------------
    // 지역(전체지역 체크기 이벤트 핸들러 전체 체크 감지)
    const flexSwitchAllRegion = document.querySelector('input#flexSwitchAllRegion'); 
    const CheckSeoul = document.querySelector('input#CheckSeoul'); 
    const CheckGyeonggi = document.querySelector('input#CheckGyeonggi'); 
    const CheckGangwon = document.querySelector('input#CheckGangwon'); 
    const CheckChungcheong = document.querySelector('input#CheckChungcheong'); 
    const CheckJeolla = document.querySelector('input#CheckJeolla'); 
    const CheckGyeongsang = document.querySelector('input#CheckGyeongsang'); 
    const CheckJejoo = document.querySelector('input#CheckJejoo'); 
    const CheckOther = document.querySelector('input#CheckOther'); 
    
    // 전체지역 체크박스 클릭시
    flexSwitchAllRegion.addEventListener('change', function() {
        // 지역 체크박스 체크되었을때
        if(flexSwitchAllRegion.checked){
            CheckSeoul.checked = true;
            CheckGyeonggi.checked = true;
            CheckGangwon.checked = true;
            CheckChungcheong.checked = true;
            CheckJeolla.checked = true;
            CheckGyeongsang.checked = true;
            CheckJejoo.checked = true;
            CheckOther.checked = true;            
        }else{
            // 전체지역 체크 안 되있을 때,
            CheckSeoul.checked = false;
            CheckGyeonggi.checked = false;
            CheckGangwon.checked = false;
            CheckChungcheong.checked = false;
            CheckJeolla.checked = false;
            CheckGyeongsang.checked = false;
            CheckJejoo.checked = false;
            CheckOther.checked = false;
        }
    });
    
    // 지역 하나라도 미선택일때 전체선택버튼 비활성화
    function checkDetailRegion (){
        if(CheckSeoul.checked&&
        CheckGyeonggi.checked&&
        CheckGangwon.checked&&
        CheckChungcheong.checked&&
        CheckJeolla.checked&&
        CheckGyeongsang.checked&&
        CheckJejoo.checked&&
        CheckOther.checked){
            flexSwitchAllRegion.checked = true;
        }else{
            flexSwitchAllRegion.checked = false;
        }
    }
    
    // 체크박스 변경 확인
    CheckSeoul.addEventListener('change', checkDetailRegion);
    CheckGyeonggi.addEventListener('change', checkDetailRegion);
    CheckGangwon.addEventListener('change', checkDetailRegion);
    CheckChungcheong.addEventListener('change', checkDetailRegion);
    CheckJeolla.addEventListener('change', checkDetailRegion);
    CheckGyeongsang.addEventListener('change', checkDetailRegion);
    CheckJejoo.addEventListener('change', checkDetailRegion);
    CheckOther.addEventListener('change', checkDetailRegion);
    
    // 전달될 값
    let Seoul = '서울';
    let Gyeonggi = '경기';
    let Gangwon = '강원';
    let Chungcheong = '충청';
    let Jeolla = '전라';
    let Gyeongsang = '경상';
    let Jejoo = '제주';
    let ROther = '기타';
    //---
    let Old = '전통주';
    let Sojo = '소주';
    let Bear = '맥주';
    let Wine = '와인';
    let COther = '기타';
    
    function checkBoxRegion(){
        if(flexSwitchAllRegion.checked){
            return
        }
        if(CheckSeoul.checked==false){
            Seoul=" ";
        }
        if(CheckGyeonggi.checked==false){
            Gyeonggi=" ";
        }
        if(CheckGangwon.checked==false){
            Gangwon=" ";
        }
        if(CheckChungcheong.checked==false){
            Chungcheong=" ";
        }
        if(CheckJeolla.checked==false){
            Jeolla=" ";
        }
        if(CheckGyeongsang.checked==false){
            Gyeongsang=" ";
        }
        if(CheckJejoo.checked==false){
            Jejoo=" ";
        }
        if(CheckOther.checked==false){
            ROther=" ";
        }
    }
    function checkBoxCategory(){
        if(categoryOld==false){
            Old=" "
        }
        if(categoryOld==false){
            Sojo=" "
        }
        if(categoryOld==false){
            Bear=" "
        }
        if(categoryOld==false){
            Wine=" "
        }
        if(categoryOld==false){
            COther=" "
        }
    }
    
    // 검색버튼 메서드
    const showSearchList = async () => {
        // 버튼 상태 초기화
        resetAClass();
        // 검색어에 채워진 인풋읽기
        let inputSearchWord = document.querySelector('input#inputSearchWord').value;
        //지역 확인
        checkBoxRegion();
        // 카테고리 확인
        checkBoxCategory();    
        // 도수 범위 확인
        let minPalc = document.querySelector('input#minPalc').value;
        let maxPalc = document.querySelector('input#maxPalc').value;
        
        
        
        // 보내질 주소        
        const reqUrl = `/joo/api/ProductList/showSearchList/${inputSearchWord}`;
        // 처리
        try{
            const response = await axios.get(reqUrl,
                {
                    params: {
                        pregion1: Seoul,
                        pregion2: Gyeonggi,
                        pregion3: Gangwon,
                        pregion4: Chungcheong,
                        pregion5: Jeolla,
                        pregion6: Gyeongsang,
                        pregion7: Jejoo,
                        pregion8: ROther,
                        pcategory1: Old,
                        pcategory2: Sojo,
                        pcategory3: Bear,
                        pcategory4: Wine,
                        pcategory5: COther,
                        palc_min: minPalc,
                        palc_max: maxPalc
                    }
                }
            );
            makeProductElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
        // 검색어 보여주기
        document.querySelector('div#divSearchWord').classList.replace('d-none', 'text-center');
        document.querySelector('span#spanSearchWord').innerHTML = inputSearchWord;
        // 검색어 초기화
        document.querySelector('input#inputSearchWord').value = '';
    }
    
    // 검색버튼 처리
    const btnSearch = document.querySelector('input#btnSearch');
    // 검색한 요소 리스트 보여주기
    btnSearch.addEventListener('click', showSearchList);
});