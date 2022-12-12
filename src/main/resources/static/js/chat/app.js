//챗봇 연결 js

var stompClient = null;
var cons = false;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#conversation").show();
    $("#msg").html("");
}

function connect() {
    var socket = new SockJS('/ws');
    console.log(socket);
    stompClient = Stomp.over(socket);
    console.log(stompClient)
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/public', function (message) {
            const messages = message.body.split(['|']);
            for(let i=1; i<messages.length; i++){
                ((x) => {
                    setTimeout(() => {
                        showMessage("받은 메시지: " + messages[i]); //서버에 메시지 전달 후 리턴받는 메시지
                    }, 300*x);
                })(i);
                cons = true;
                console.log(cons);
            }
        });
    });

}


function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

// function sendMessage() {
//     let message = $("#msg").val()
//     showMessage("보낸 메시지: " + message);
//     stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); //서버에 보낼 메시지
// }

function showMessage(message) {
    $("#communicate").append("<tr><td>" + message + "</td></tr>");
}



$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $("#sendForm").hide();
    $("#send").click(function () { sendMessage(); });
    $("#connect").click(function () {
        connect();
        basicmessage();
    });
});



// 질문 js


$(document).on("click", ".botcat", (e) => {
    e.stopImmediatePropagation();
    showMessage($(e.target).text());
    $(e.target).parent().remove();
    stompClient.send("/app/sendMessage", {}, JSON.stringify($(e.target).text()));
    cid = e.target.id;
    setTimeout(() => {
        if (cid.includes('qna')) {
            qnabtn();
        } else if (cid.includes('guide')) {
            guidebtn();
        } else if (cid.includes('precautions')) {
            prebtn();
        } else if (cid.includes('import')) {
            importbtn();
        } else if (cid.includes('info')) {
            infobtn();
        }
    }, 2000);
});

$(document).on("click", ".botbtn", (e) => {
    showMessage($(e.target).text());
    $(e.target).parent().remove();
    stompClient.send("/app/sendMessage", {}, JSON.stringify($(e.target).text()));
    bid = e.target.id;
    setTimeout(() => {
        if (bid.includes('qna')) {
            qnabtn();
        } else if (bid.includes('guide')) {
            guidebtn();
        } else if (bid.includes('precautions')) {
            prebtn();
        } else if (bid.includes('import')) {
            importbtn();
        } else if (bid.includes('info')) {
            infobtn();
        }  
    }, 2000);
});

$(document).on("click", "#chatbtn", (e) => {
    showMessage($(e.target).text());
    $(e.target).parent().remove();
    stompClient.send("/app/sendMessage", {}, JSON.stringify($(e.target).text()));
    $("#communicate").append('<div class="bot chat">' +
        '<button type="button" class="btn btn-default con" id="chatConnect">상담시작</button>' +
        '<button type="button" class="btn btn-default" id="home">이전단계</button>' +
        '</div>')
});

$(document).on("click", "#chatConnect", (e) => {
    showMessage($(e.target).text());
    // $(e.target).parent().remove();
    disconnect();
    $("#sendForm").show();
    createRoom();
});

$(document).on("click", "#home", (e) => {
    $(e.target).parent().remove();
    basicmessage();
});
