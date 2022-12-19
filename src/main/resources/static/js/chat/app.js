
function commonAjax(url, parameter, type, calbak, contentType) {
    $.ajax({
        url: '/chat' + url,
        data: JSON.stringify(parameter),
        type: type,
        contentType: contentType != null ? contentType : 'application/json; charset=UTF-8',
        success: function (res) {
            calbak(res);
        },
        error: function (err) {
            console.log('error');
            calbak(err);
        }
    });
}

function ajaxMessage(message) {
    const messages = message.split(['|']);
    for (let i = 1; i < messages.length; i++) {
        ((x) => {
            setTimeout(() => {
                showMessageRecive(messages[i]); //서버에 메시지 전달 후 리턴받는 메시지
            }, 300 * x);
        })(i);
    }
}


function showMessageSend(message) {
    $("#communicate").append("<p class='me'>" + message + "</p>");
}

function showMessageRecive(message) {
    $("#communicate").append("<p class='others'>" + message + "</p>");
}


$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $("#sendForm").hide();
    $("#send").click(function () { sendMessage(); });
    $("#connect").click(function (e) {
        console.log("버튼 태그 : " + e);
        $("#connect").prop("disabled");
        commonAjax("/sendMessage", '상담 시작', 'POST', function (message) {
            ajaxMessage(message);
        })
        setTimeout(() => {
            basicmessage();
        }, 2000);
    });
});



// 질문 js


$(document).on("click", ".botcat", (e) => {
    showMessageSend($(e.target).text());
    $(e.target).parent().remove();
    commonAjax("/sendMessage", $(e.target).text(), 'POST', function (message) {
        ajaxMessage(message);
    })
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
    showMessageSend($(e.target).text());
    $(e.target).parent().remove();
    commonAjax("/sendMessage", $(e.target).text(), 'POST', function (message) {
        ajaxMessage(message);
    })
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
    showMessageSend($(e.target).text());
    $(e.target).parent().remove();
    commonAjax("/sendMessage", $(e.target).text(), 'POST', function (message) {
        ajaxMessage(message);
    })
    setTimeout(() => {
        $("#communicate").append('<div class="bot chat">' +
            '<button type="button" class="btn btn-outline-success con" id="chatConnect">상담시작</button>' +
            '<button type="button" class="btn btn-outline-success" id="home">이전단계</button>' +
            '</div>')
    }, 1000);
});

$(document).on("click", "#chatConnect", (e) => {
    showMessageSend($(e.target).text());
    $(e.target).parent().remove();
    $("#sendForm").show();
    showMessageRecive("상담사가 입장하고 있습니다. 잠시만 기다려주세요")
    createRoom();
});

$(document).on("click", "#home", (e) => {
    $(e.target).parent().remove();
    basicmessage();
});

$(document).on("click", "#discon", (e) => {
    showMessageSend($(e.target).text());
    $(e.target).parent().remove();
    commonAjax("/sendMessage", $(e.target).text(), 'POST', function (message) {
        ajaxMessage(message);
    })
});
