function getTimer() {
    $(".date").each(function (index, value) {
        //캠페인회차
        let count = $(".count")[index].value;
        //시작날짜(상품등록날짜)
        let start = new Date($(value).val());
    
        //종료날짜(상품등록날짜+캠페인회차)
        let end = new Date(start.getFullYear(), start.getMonth(), start.getDate(), start.getHours(), start.getMinutes(), start.getSeconds());
        end.setDate(start.getDate() + parseInt(count))
        
        //현재날짜
        let now = new Date(); 

        let endTime = end.getTime(); //종료날짜 ms
        let nowTime = now.getTime(); //현재날짜 ms

        console.log('시작시간', start)
        console.log('종료시간', end)

        if (now < endTime) {
            let sec = parseInt(endTime - now) / 1000;
            let day = parseInt(sec / 60 / 60 / 24);
            sec = (sec - (day * 60 * 60 * 24));
            let hour = parseInt(sec / 60 / 60);
            sec = (sec - (hour * 60 * 60));
            let min = parseInt(sec / 60);
            sec = parseInt(sec - (min * 60));

            if (hour < 10) { hour = "0" + hour; }
            if (min < 10) { min = "0" + min; }
            if (sec < 10) { sec = "0" + sec; }

            console.log('****', hour, min, sec);

            // $(".hours")[index].innerHTML = hour;
            // $(".minutes")[index].innerHTML = min;
            // $(".seconds")[index].innerHTML = sec;

            let h = document.getElementsByClassName("hours");
            let m = document.getElementsByClassName("minutes");;
            let s = document.getElementsByClassName("seconds");
            h[index].innerHTML = hour+":";
            m[index].innerHTML = min+":";
            s[index].innerHTML = sec;

        } else{
            $(".time")[index].innerHTML = "지원마감";
        }
    })
}

setInterval(getTimer, 1000); //1초마다 검사를 해주면 실시간으로 시간을 알 수 있다. 


