// 출력 될 div
const info = document.getElementById("info");
// 마이페이지 리스트
const myinfo = document.getElementById("myinfo");
const mypoint = document.getElementById("mypoint");
const mygrade = document.getElementById("mygrade");

myinfo.addEventListener("click", function () {
  getMyInfo();
});
mypoint.addEventListener("click", function () {
  getMyPoint();
});
mygrade.addEventListener("click", function () {
  getMyGrade();
});

// 내 정보
function getMyInfo() {
  const xhttp = new XMLHttpRequest();
  xhttp.open("GET", "info");
  xhttp.send();

  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      info.innerHTML = xhttp.responseText;
    }
  };
}
// 내 포인트
function getMyPoint() {
  const xhttp = new XMLHttpRequest();
  xhttp.open("GET", "point");
  xhttp.send();

  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      info.innerHTML = xhttp.responseText;
    }
  };
}
//내등급
function getMyGrade() {
  const xhttp = new XMLHttpRequest();
  xhttp.open("GET", "grade");
  xhttp.send();

  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      info.innerHTML = xhttp.responseText;
    }
  };
}
