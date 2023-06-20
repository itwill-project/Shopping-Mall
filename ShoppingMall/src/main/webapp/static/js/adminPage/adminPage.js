/**
 * 
 */

 document.addEventListener('DOMContentLoaded', function(){
     
     //상품 테이블
     const productlang = `
                <form>
                    <div class="input-group mb-3">
    
                        <div class="form-floating">
                            <input type="text" class="form-control"
                                id="searchProduct"
                                placeholder="searchProduct" /> 
                                <label for="searchProduct">제품이름/카테고리로 검색</label>
                        </div>
    
                        <input type="button" class="btn btn-outline-primary"
                            value="검색" id="btnProductSearch"/>
                            
                        <input type="button" class="btn btn-outline-primary"
                            onclick="location.href='/joo/admin/adminNewProductBasic'"
                            value="제품추가" />
                    </div>                
                </form>
                    <div>
                        <table class="table table-striped border-dark">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">가격</th>
                                    <th scope="col">도수</th>
                                    <th scope="col">지역</th>
                                    <th scope="col">제작시간</th>
                                    <th scope="col">수정시간</th>
                                    <th scope="col">용량</th>
                                    <th scope="col"
                                    id="thPstock">
                                    <u>수량</u>
                                    </th>
                                    
                                    <th scope="col">판매갯수</th>
                                    <th scope="col" COLSPAN="2" class="text-center">수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody id="tableProductBody">
                            
                            </tbody>
                        </table> 
                    </div>
                    `;
    //문의 테이블
    const questionlang = `
                    <div>
                        <table class="table table-striped border-dark">
                            <thead>
                                <tr>
                                    <th scope="col" id="answered">답변여부</th>
                                    <th scope="col">문의유형</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">문의시간</th>
                                    <th scope="col">답변시간</th>
                                    <th scope="col">답변하기</th>
                                </tr>
                            </thead>
                            <tbody id="tableQuestionBody">
                            
                            </tbody>
                        </table>
                    </div> 
    `;
     
     
     // 개발자 화면의 드롭select.option의 value를 확인하고, 표시할 화면 선택
    const menu = document.querySelector('select#menu');       
    
    menu.addEventListener('change', function(){
        
        // 값 읽기
        const selectedMenu = menu.value;
        // 기존 div 초기화
        selectedContens.innerHTML = "";

        if(selectedMenu=="product"){
           // 상품------------------------- 
            selectedContens.innerHTML = productlang;
            resetProductList();
            // 상품검색 버튼 찾기 / 이벤트 처리
            const btnProductSearch = document.querySelector('input#btnProductSearch');
            btnProductSearch.addEventListener('click', searchProduct);
            
            // 상품 정렬(제고수가 없는 순서)
            const thPstock = document.querySelector('th#thPstock');
            thPstock.addEventListener('click', showNoPstock)
            
        }else if(selectedMenu=="user"){
                                    
            selectedContens.innerHTML =  reviewlang;
            
        }else if(selectedMenu=="quseries"){ 
           // 문의-------------------------                          
            selectedContens.innerHTML =   questionlang;
            resetQuestionList();
            
            // 미답변 문의들 정렬(그 다음은 작성시간 기준 오래 된 순서)
            const answered = document.querySelector('th#answered');
            answered.addEventListener('click', showNoAnswered);
            
        }else if(selectedMenu=="review"){
                                    
            selectedContens.innerHTML = "";
            
        }else if(selectedMenu=="post"){
                                    
            selectedContens.innerHTML =  "";
        }
        
    });
     
    //-------------------------------------------- 게시글관리 -----------------------------------------------------------------------
    // id 제목, 시작시간 끝나는시간 남은시간(ex/d-2) 수정버튼/삭제버튼 클릭시 내용 모달(수정까지 가능)
    
    //-------------------------------------------- 리뷰관리 -----------------------------------------------------------------------
    // 문의랑 같음

    //-------------------------------------------- 문의관리 -----------------------------------------------------------------------

     // 미답변 문의리스트 보여주기
     const showNoAnswered = async () => {
        const reqUrl = `/joo/api/AdminQuestion/NoAnswered`;
        
        try{
            const response = await axios.get(reqUrl);
            makeQuestionsElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    };
   
    // 문의 모달 객체 찾기
    const Qmodal = new bootstrap.Modal('div#questionUpdateModal',{backdrop: true});
   
    // 문의 모달 내용 찾기
    const QUMq_id = document.querySelector('input#QUMq_id');
    const QUMqname = document.querySelector('input#QUMqname');
    const QUMqtype = document.querySelector('input#QUMtype');
    const QUMqtitle = document.querySelector('input#QUMqtitle');
    const QUMqcontent = document.querySelector('input#QUMqcontent');
    const QUMis_answered = document.querySelector('input#QUMis_answered');
    
    // 문의 답변 모달 보여주기
     const showAnswereModal = (e) => {
        
        const id = e.target.getAttribute('data-id');
        const url = `/joo/api/AdminQuestion/modify/${id}`;
        
        axios.get(url)
        .then((response) =>{
            
            console.log(`data = ${response.data}`);
            
            // 전달 받은 데이터 각각 넣기 배열은 [] 로 찾고, 값설정 / 리스트는 {} 로 각각의 키값의 이름을 찾아 값 설정
            const { q_id, qcontent, is_answered, u_id, qtype, qtitle } = response.data;
            
            // 모달 인풋에 기존값 넣어주기
            QUMq_id.value = q_id;
            QUMqname.value = u_id;
            QUMqtype.value = qtype;
            QUMqtitle.value = qtitle;
            QUMqcontent.value = qcontent;
            QUMis_answered.value = is_answered;
            
            // 모달 보여주기
            Qmodal.show();
            
        })
        .catch((error)=>{
            console.log(error);
        });

    }
    
    // 문의 답변 버튼처리
    const btnQuestionUpdate = document.querySelector('button#btnQuestionUpdate');
    
    btnQuestionUpdate.addEventListener('click', function(e){
        
        const q_id = QUMq_id.value;
        const is_answered = QUMis_answered.value;
        
        const reqUrl = `/joo/api/AdminQuestion/answere/${q_id}`;
        const data = { q_id, is_answered };
        
        axios.put(reqUrl, data)
        .then((response) => {
            alert(`답변 완료 ${response.data}`);
            resetQuestionList();
        })
        .catch((error) => {
            console.log(error);
        })
        .finally(() => Qmodal.hide());
        
        
    });
    
    // 문의 요소들 꺼내서 정리할 문장 표현 (테이블에 문장을 추가하기 위해 설정하는 값)
    const makeQuestionsElemants = (data) => {
        
        // 문의리스트가 보여질 div
        const questionList = document.querySelector('tbody#tableQuestionBody');

        let questionStr = '';
        
        // 요소체울 반복문
        for(let question of data){
        // 답변여부 체크를 답변의 문장이 있나없나로 체크        
        let answered = question.is_answered;
        let replyTime = question.qreplycreate_time;
        let answeredStr = `
            <td>
                <button id="btnAnswere" data-id="${ question.q_id }" class="btn btn-outline-success">답변 하기</button>
            </td>`;
        
        if(answered==null){
            answered = '<img src="../static/assets/question/answered/no.png" alt="NoImage" width="40" height="40">';
            replyTime = '아직 답변을 하지 않았습니다.';
        }else{
            answered = '<img src="../static/assets/question/answered/yes.png" alt="YesImage" width="40" height="40">';
            answeredStr = `
                <td>
                    <button id="btnAnswere" data-id="${ question.q_id }" class="btn btn-outline-warning">답변 변경</button>
                </td>
            `;
        }
        
            // 상품 1개를 표시할 html 코드
            questionStr += `
                <tr>
                    <td>${ answered }</td>
                    <td>${ question.qtype }</td>
                    <td>${ question.qtitle }</td>
                    <td>${ question.u_id }</td>
                    <td>${ question.qcreated_time }</td>
                    <td>${ replyTime }</td>
                    <!-- 답변 버튼 -->
                    ${answeredStr}
                </tr>
            `;
            questionList.innerHTML = questionStr;
            
                // 답변버튼 찾기
                const btnAnswere = document.querySelectorAll('button#btnAnswere')
                    for(let btn of btnAnswere){
                        btn.addEventListener('click', showAnswereModal);
                }
                
        }
    }// 문의 요소찾기 메서드 끝
        
    // 문의리스트 초기화
    const resetQuestionList = async () => {
        const reqUrl = `/joo/api/AdminQuestion/QuestionList`;
        
        try{
            const response = await axios.get(reqUrl);
            makeQuestionsElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    };
    
    //-------------------------------------------- 상품관리 -----------------------------------------------------------------------
    
    // 상품 정렬(제고수 없는 순서)
    const showNoPstock = async () =>{
        
        const reqUrl = `/joo/api/AdminProduct/pstock`;
        
        try{
            const response = await axios.get(reqUrl);
            makeProductsElemants(response.data);
            console.log(response.data);            
        }catch (error){
            console.log(error);
        }
    }
        
    //상품 검색
    const searchProduct = async () =>{
        //버튼 클릭시 검색어 받아오기
        const search = document.querySelector('input#searchProduct').value;
        console.log(`검색어 = ${search}`);
        const reqUrl = `/joo/api/AdminProduct/search/${search}`;
        
        try{
            const response = await axios.get(reqUrl);
            if(response.data == ""){
                alert('검색결과가 없습니다.');
                return;
            }
            makeProductsElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    }
     
     
    // 상품 삭제
    const deleteproduct = (e) => {
        
        const result = confirm('정말 삭제하시겠습니까?')
        if(result==0){
            return;
        }
        const id = e.target.getAttribute('data-id');
        const url = `/joo/api/AdminProduct/delete/${id}`;
        
        axios.delete(url)
        .then((response) => {
            alert('상품 삭제 성공');
            // 상품리스트 초기화
            resetProductList()
        })
        .catch((error) => {
            console.log(error);            
        });
    }
    
    // 모달 객체 찾기
    const Pmodal = new bootstrap.Modal('div#productUpdateModal',{backdrop: true});
    // 모달 내용 찾기
    const PUMp_id = document.querySelector('input#PUMp_id');
    const PUMpname = document.querySelector('input#PUMpname');
    const PUMpprice = document.querySelector('input#PUMpprice');
    const PUMpdiscound = document.querySelector('input#PUMpdiscound');
    const PUMpstock = document.querySelector('input#PUMpstock');
    
    // 상품 수정 모달 보여주기
     const showUpdateModal = (e) => {
        
        const id = e.target.getAttribute('data-id');
        const url = `/joo/api/AdminProduct/modify/${id}`;
        
        axios.get(url)
        .then((response) =>{
            
            console.log(`data = ${response.data}`);
            
            // 전달 받은 데이터 각각 넣기 배열은 [] 로 찾고, 값설정 / 리스트는 {} 로 각각의 키값의 이름을 찾아 값 설정
            const { pname, pprice, pdiscount, pstock } = response.data;
            
            // 모달 인풋에 기존값 넣어주기
            PUMp_id.value = id;
            PUMpname.value = pname;
            PUMpprice.value = pprice;
            PUMpdiscound.value = pdiscount;
            PUMpstock.value = pstock;
            
            // 모달 보여주기
            Pmodal.show();
            
        })
        .catch((error)=>{
            console.log(error);
        });

    }
    
    // 수정하기 버튼/ 버튼처리
    const btnProductUpdate = document.querySelector('button#btnProductUpdate');
    
    btnProductUpdate.addEventListener('click', function(e){
        
        const p_id = PUMp_id.value;
        const pname = PUMpname.value;
        const pprice = PUMpprice.value;
        const pdiscount = PUMpdiscound.value;
        const pstock = PUMpstock.value;
        
        const reqUrl = `/joo/api/AdminProduct/update/${p_id}`;
        const data = { p_id, pname, pprice, pdiscount, pstock };
        
        axios.put(reqUrl, data)
        .then((response) => {
            alert(`수정 성공 ${response.data}`);
            resetProductList();
        })
        .catch((error) => {
            console.log(error);
        })
        .finally(() => Pmodal.hide());
        
        
    });
    
    // 상품 요소들 꺼내서 정리할 문장 표현 (테이블에 문장을 추가하기 위해 설정하는 값)
    const makeProductsElemants = (data) => {
        
        // 상품리스트가 보여질 div
        const productList = document.querySelector('tbody#tableProductBody');

        let productStr = '';
        
        // 요소체울 반복문
        for(let product of data){
        let ctime = product.pcreated_time;

        //제고수 0 일때 "제고없음 처리"
        let psotck = product.pstock;
        if(psotck==0){
            psotck = `<strong style="color:red;">제고없음</strong>`;
        }
            // 상품 1개를 표시할 html 코드
            productStr += `
                <tr>
                    <td>${ product.p_id }</td>
                    <td>${ product.pname }</td>
                    <td>${ product.pprice }</td>
                    <td>${ product.palc }</td>
                    <td>${ product.pregion }</td>
                    <td>${ ctime }</td>
                    <td>${ product.modified_time }</td>
                    <td>${ product.pvoluem }</td>
                    <td>${ psotck }</td>
                    <td>${ product.psold }</td>
                    <!-- 수정/삭제버튼 -->
                    <td class="text-end">
                        <button id="btnModify" class="btn btn-outline-primary" data-id="${ product.p_id }">수정하기</button>
                    </td>
                    <td>
                        <button id="btnDelete" data-id="${ product.p_id }" class="btn btn-outline-danger delete">삭제하기</button>
                    </td>
                </tr>
            `;
            productList.innerHTML = productStr;
            
                 // 수정버튼 찾기
                const btnModify = document.querySelectorAll('button#btnModify')
                    for(let btn of btnModify){
                        btn.addEventListener('click', showUpdateModal);
                }
                // 삭제버튼 찾기
                const btnDelete = document.querySelectorAll('button#btnDelete')
                    for(let btn of btnDelete){
                        btn.addEventListener('click', deleteproduct);
                }
                
        }
    }// 상품 요소찾기 메서드 끝
    
    
    // 상품리스트 초기화 (order by pmodified_time)
    const resetProductList = async () => {
        const reqUrl = `/joo/api/AdminProduct/productList`;
        
        try{
            const response = await axios.get(reqUrl);
            makeProductsElemants(response.data);
            console.log(response);
        }catch (error){
            console.log(error);
        }
    };
    
 });
 