//고객부담금 설정에 따른 name속성 부여
$("#point1").click(function () {
  $("#point2_3").attr("name", "");
  $("#pointOff").hide();
  $("#point1_3").attr("name", "point");
  $("#pointOn").show();

})

$("#point2").click(function () {
  $("#point1_3").attr("name", "");
  $("#pointOn").hide();
  $("#point2_3").attr("name", "point");
  $("#pointOff").show();
})



//고객부담금 계산
$("#price").change(function () {
  $("#point1_1").val($("#price").val());
  $("#point1_2").val("");
  $("#point1_3").val("");
  $("#point1Text").text("");

  $("#point2_1").val($("#price").val());
  $("#point2_3").val($("#price").val());
  let price = $("#price").val();
  let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  $("#point2Text").text(result);
})

$("#point1_2").change(function () {
  let price = $("#price").val() - $("#point1_2").val();

  if (price < 0) {
    alert("고객부담금은 판매금액보다 클 수 없습니다.");
    $("#point1_2").val("");
    $("#point1_3").val("");
    $("#point1Text").text("");
  } else {
    $("#point1_3").val(price);
    let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    $("#point1Text").text(result);
  }
})


//파일 등록
let count = 0;
$("#fileAdd").click(function () {
  if (count < 3) {
    //<div id="file0">
    //  <input type="file" name="files" id="files0">
    //  <i class="del fa-solid fa-xmark"></i>
    //</div>

    let input = '<div id="file'+count+'">';
    input = input + '<input type="file" name="files" id="files'+count+'" accept="image/*" onchange="setThumbnail(event);" style="display:none;">';
    input = input + '</div>';
    $("#fileBox").append(input);
    $("#fileAdd").attr("for", "files"+count);

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
    i.setAttribute("style", "position: absolute; right:0");
    div.append(i);

    count++;
    $("#count").text(count);
    console.log(count);

    if (3 <= count) {
      $("#fileAdd").attr("style", "display:none");
    }
  };
}


//파일 삭제
//$("부모선택자").on("이벤트명", "자식선택자", callback function) -이벤트 위임
$("#fileBox").on("click", ".del", function () {
  $(this).parent().parent().remove(); //선택자 포함, 하위 자식들 까지 모두 삭제
  count--;
  $("#count").text(count);
  
  if (count < 3) {
    $("#fileAdd").attr("style", "width: 130px; height: 130px; color: green; text-align: center;");
  }
})
