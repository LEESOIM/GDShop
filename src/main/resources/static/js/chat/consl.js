var ws;

function wsOpen(rn) {
	//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다
	ws = new WebSocket("ws://" + location.host + "/chating/" + rn);
	wsEvt();
}

function wsEvt() {
	ws.onopen = function (data) {
	}

	ws.onmessage = function (data) {
		//메시지를 받으면 동작
		var msg = data.data;
		if (msg != null && msg.trim() != '') {
			var d = JSON.parse(msg);
			if (d.type == "getId") {
				var si = d.sessionId != null ? d.sessionId : "";
				if (si != '') {
					$("#sessionId").val(si);
				}
			} else if (d.type == "message") {
                console.log(d);
				if (d.sessionId == $("#sessionId").val()) {
					chatMessageSend(d.msg);
				}
				else {
					chatMessageRecive(d.msg);
				}

			} else {
				console.warn("unknown type!")
			}
		}
	}

}
function chatMessageSend(message) {
    $("#communicate").append("<div class='chatMe'>" + message + "</div>");
}

function chatMessageRecive(message) {
    $("#communicate").append("<div class='chatOthers'>" + message + "</div>");
}

function send() {
	var option = {
		type: "message",
		roomNumber: $("#roomNumber").val(),
		sessionId: $("#sessionId").val(),
		msg: $("#chatting").val()
	}
	ws.send(JSON.stringify(option))
	$('#chatting').val("");
}

function createRoom() {
    commonAjax('/createRoom', '', 'post', function (res) {
        $("#roomNumber").val(res[res.length-1].roomNumber)
        wsOpen($("#roomNumber").val());
    });
}



function commonAjax(url, parameter, type, calbak, contentType) {
    $.ajax({
        url: "/chat" + url,
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

