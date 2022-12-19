function basicmessage(){
    $("#communicate").append('<div class="bottop basic mt-3">' +
    '<button type="button" class="btn btn-outline-success botcat" id="qna">자주묻는 질문</button>' +
    '<button type="button" class="btn btn-outline-success botcat" id="guide">구디샵 가이드</button>' +
    '<button type="button" class="btn btn-outline-success botcat" id="precautions">구디샵 주의사항</button>' +
    '<button type="button" class="btn btn-outline-success botcat" id="import">입점문의</button>' +
    '<button type="button" class="btn btn-outline-success botcat" id="info">개인정보</button>' +
    '<button type="button" class="btn btn-outline-success" id="chatbtn">상담사 연결</button>' +
    '<button type="button" class="btn btn-outline-success" id="discon">상담 종료</button>' +
    '</div>')
}

function qnabtn(){
    $("#communicate").append('<div class="botmid qna mt-3">' +
        '<button type="button" class="btn btn-outline-success botbtn" id="qna1">캠페인의 종류가 궁금합니다!</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="qna2">포인트 수령이 안되시나요?</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="qna3">구매 인증을 하지 않아 캠페인이 취소로 진행 되셨나요?</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="qna4">리뷰 인증이 안되시나요? 상품이 품절되었나요?</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="qna5">제시된 구매 금액과 다르게 가격이 변동되었나요?</button>' +
        '<button type="button" class="btn btn-outline-success" id="home">이전단계</button>' +
        '</div>')
}

function guidebtn(){
    $("#communicate").append('<div class="botmid guide mt-3">' +
        '<button type="button" class="btn btn-outline-success botbtn" id="guide1">초보 이용자를 위한 이용방법</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="guide2">구디샵 주의사항이 무엇인가요?</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="guide3">캠페인 미션이 무엇인가요?</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="guide4">캠페인 선정 기준이 어떻게 되나요?</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="guide5">캠페인에 선정되면 어떻게 확인할 수 있나요?</button>' +
        '<button type="button" class="btn btn-outline-success" id="home">이전단계</button>' +
        '</div>')
}

function prebtn(){
    $("#communicate").append('<div class="botmid precautions mt-3">' +
        '<button type="button" class="btn btn-outline-success botbtn" id="precautions1">구매인증 후 일방적인 캠페인 취소</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="precautions2">컨텐츠 유지기간 미준수</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="precautions3">미션 등록 지연</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="precautions5">제공내역 재판매</button>' +
        '<button type="button" class="btn btn-outline-success botbtn" id="precautions6">환불 신청</button>' +
        '<button type="button" class="btn btn-outline-success" id="home">이전단계</button>' +
        '</div>')
}

function importbtn(){
    $("#communicate").append('<div class="botmid info mt-3">' +
    '<button type="button" class="btn btn-outline-success" id="home">이전단계</button>' +
    '</div>')
}

function infobtn(){
    $("#communicate").append('<div class="botmid info mt-3">' +
    '<button type="button" class="btn btn-outline-success botbtn" id="info1">비밀번호를 잊으셨나요?</button>' +
    '<button type="button" class="btn btn-outline-success botbtn" id="info3">회원 탈퇴는 어떻게 하나요?</button>' +
    '<button type="button" class="btn btn-outline-success" id="home">이전단계</button>' +
    '</div>')
}
