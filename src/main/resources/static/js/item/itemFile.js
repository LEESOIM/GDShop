//파일 등록
let num = 0;
let flag = true;

$("#fileAdd").click(function () {
    if (flag) {
        let size = $("#fileBox").attr("data-file-size");
        if (size == undefined) {
            size = 0;
        }
        num = size;
        $("#num").text(num);
        flag = false;
    }

    if (num < 3) {
        //<div id="file0">
        //  <input type="file" name="files" id="files0">
        //  <i class="del fa-solid fa-xmark"></i>
        //</div>

        let input = '<div id="file' + num + '">';
        input = input + '<input type="file" name="files" id="files' + num + '" accept="image/*" onchange="setThumbnail(event);" style="display:none;">';
        input = input + '</div>';
        $("#fileBox").append(input);
        $("#fileAdd").attr("for", "files" + num);

    } else {
        alert("이미지는 3개까지만 등록 가능합니다")
        $("#fileAdd").attr("for", "");
    }
})


//이미지 썸네일
function setThumbnail(event) {
    let reader = new FileReader();
    reader.readAsDataURL(event.target.files[0]);

    reader.onload = function (event) {
        let div = document.createElement("div");
        div.setAttribute("style", "position : relative; margin-right: 20px;");

        let img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("style", "width:135px; height:135px;");
        div.append(img);
        $("#fileBox div:last").append(div);

        //<i class="del fa-solid fa-xmark"></i>
        let i = document.createElement("i");
        i.setAttribute("class", "del fa-solid fa-xmark");
        i.setAttribute("style", "position: absolute; right:0; color:limegreen");
        div.append(i);

        num++;
        $("#num").text(num);

        if (3 <= num) {
            $("#fileAdd").attr("style", "display:none");
        }
    };
}


//파일 삭제
//$("부모선택자").on("이벤트명", "자식선택자", callback function) 
$("#fileBox").on("click", ".del", function () {
    $(this).parent().parent().remove(); //선택자 포함, 하위 자식들 까지 모두 삭제
    num--;
    $("#num").text(num);

    if (num < 3) {
        $("#fileAdd").attr("style", "width: 130px; height: 130px; color: green; text-align: center;");
    }
})


//글수정시 파일 삭제
$(".deleteFile").click(function () {
    let check = confirm("삭제한 이미지는 되돌릴 수 없습니다. 삭제하시겠습니까?")
    if (flag) {
        let size = $("#fileBox").attr("data-file-size");
        num = size;
        $("#num").text(num);
        flag = false;
    }

    if (check) {
        const btn = $(this);
        let fileNum = $(this).attr("data-file-num");

        $.ajax({
            type:"POST",
            url:"fileDelete",
            data:{
                fileNum: fileNum
            },
            success:function(result){
                console.log("Result : ", result)
                btn.parent().remove();
                num--;
            },
            error:function(){
                console.log("Error 발생");
            }
        })
    }
})
