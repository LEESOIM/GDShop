let margin = { top: 20, right: 20, bottom: 30, left: 30 };
let width = $("#svg").width() - margin.left - margin.right;
let height = $("#svg").height() - margin.top - margin.bottom;

$(document).ready(function(){
    console.log("시작")
    $.ajax({
        type:"GET",
        url:"getRevenue",    
        success:function(data){
          setRevenueChart(data);
        }
    })
})


function getDayRevenue(){
    $("#chBox").css("display",'block')
    $("#TOTAL").prop('checked',true)
    $("#ROLE_SELLER").prop('checked',true)
    $("#ROLE_VIP").prop('checked',true)

    $("#year").css("display",'none')
    $("#chartTitle").text(" 일 매출")
    $("#svg").empty()
    $.ajax({
        type:"GET",
        url:"getRevenue",    
        success:function(data){
          setRevenueChart(data);
        }
    })
}

function getMonthRevenue(){
    $("#chBox").css("display",'none')
    $("#year").css("display",'block')
    $("#year").empty()
    var currentYear = (new Date()).getFullYear();
    for (var i = 2022; i <= currentYear; i++) {
        var option = document.createElement("OPTION");
        option.innerHTML = i;
        option.value = i;
        $("#year").append(option);
    }
    $("#chartTitle").text(" 월 매출")
    $("#svg").empty()

    $.ajax({
        type:"GET",
        url:"getMonthRevenue",
        data:{
            year:$("#year option:selected").val().toString()
        },    
        success:function(data){
            console.log(data)
          setMonthChart(data);
        }
    })
}

$("#year").on("change", function(){
    $("#svg").empty()
    
    $("option:selected", this).attr("value");
    $.ajax({
        type:"GET",
        url:"getMonthRevenue", 
        data:{
            year:$(this).val().toString()
        },
        success:function(data){
            console.log(data)
          setMonthChart(data);
        }
    })
});

function check(event){
    let className = $(event).val()
    if(event.checked==true){
        console.log($(event).val())
        $("."+className).animate({opacity: "1"}, 1000).attr("visibility", "visible");;
    }else{
        $("."+className).animate({opacity: "0"}, 1000).attr("visibility", "hidden");;
    }
}


function setRevenueChart(data){
  
    let xValue = []
    let yValue = []
    let xyValue = []

    console.log(data)
    let maxPay=0;
    let maxDay=0
    for(i=0; i<data.length;i++){
        
        if(data[i].amount>=maxPay){
            maxPay=data[i].amount
        }
        data[i].payDate  = new Date(data[i].payDate )
        if(data[i].payDate>=maxDay){
            maxDay=data[i].payDate
            console.log(maxDay)
        }
        
        xValue.push(new Date(data[i].payDate))
        yValue.push(data[i].amount)
        xyValue.push([new Date(data[i].payDate), data[i].amount])        
    }

    let dateStart = data[0].payDate
    let dateLast = data[0].payDate
    let payStart = data[0].amount
    let payLast = maxPay




    let xScale = d3.scaleTime().domain([new Date(dateStart), new Date(maxDay)]).range([45, width]); 
    let yScale = d3.scaleLinear().domain([0, payLast]).range([height, 30]);
        
    const xAxis = d3.axisBottom(xScale).tickSizeOuter(0).ticks(12).tickFormat(d3.timeFormat("%m/%d"));
    const yAxis = d3.axisLeft(yScale).ticks(10);

    // const xAxis = d3Axis.axisBottom(xScale);
    const xAxisSVG = d3.select("#svg").append("g").attr("transform", "translate(0,"+height+ ")")
                    .style("font-size","15px").attr("stroke-width","2")
                    .call(xAxis);
    // const yAxis = d3Axis.axisLeft(yScale);
    const yAxisSVG = d3.select("#svg").append("g")
                    .style("font-size","15px").attr("stroke-width","2")
                    .call(yAxis)
                        .attr("transform", "translate(45,0)")
                    .call(g => g.select(".domain").remove())
                    .call(g => g.selectAll(".tick line").clone()
                        .attr("x2", width)
                        .attr("stroke-opacity", 0.1))
                    .call(g => g.append("text")
                        .attr("x", -30)
                        .attr("y", 15)
                        .attr("fill", "currentColor")
                        .attr("text-anchor", "start")
                        .text("(원)"));

    data = Array.from(d3.group(data,d=>d.payName))
            .map(d => { 
        return {
          key: d[0],
          values: d[1]
        }
      })
    var res = data.map(function(d){ return d.key }) // list of group names
    var color = d3.scaleOrdinal()
                .domain(res)
                .range(['#e41a1c','#377eb8','#556B2F'])

    console.log(data)


    //점을 생성한다.
    d3.select("#svg")
        .selectAll("myDots")
        .data(data)
        .enter()
        .append('g')
        .attr("class", function(d){return d.key})
            .style("fill", function(d){ return color(d.key) })
        .selectAll(".circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
            .attr("class", "circle")
        .data(function (d) {return d.values;})                         // 2.찾은 요소에 데이터를 씌운다.
        .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우..
        .append("circle")                   // 4.circle 을 추가한다.
            .attr("r", 5)                       //  - 반지름 5픽셀
            .attr("cx", function(d){return xScale(new Date(d.payDate))})      //  - x 위치값 설정.
            .attr("cy",function(d){return yScale(d.amount)})     //  - y 위치값 설정. 
         
    d3.select("#svg")
        .selectAll(".line")
        .append("g")
        .attr("class", "line")
        .data(data)
        .enter()
        .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
        .attr("class", function(d){return d.key})
        .attr("d", function(d){
            return d3.line()
                    .curve(d3.curveLinear)
                    .x(d=>xScale(new Date(d.payDate)))
                    .y(d=>yScale(d.amount))
                    (d.values)
        })   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
        .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
        .attr("stroke-width", 2)            // - 굵기
        .attr("stroke", function(d){ return color(d.key) })
        .style("stroke-width", "2px")
        .style("opacity", "0.8");          

    //범례
    var legend = d3.select("#svg")
        .append('g')
        .attr('class', 'legend')
        .selectAll('g')
        .data(data)
        .enter()

    legend.append('rect')
        .attr('x', width - 100)
        .attr('y', function(d, i) {
            return (i * 20) +5;
          })
        .attr('width', 10)
        .attr('height', 10)
        .style('fill', function(d) {
            return color(d.key);
        });

     legend.append('text')
        .attr('x', width - 88)
        .attr('y', function(d, i) {
            return (i * 20) + 15;
          })
        .text(function(d) {
            if(d.key=="ROLE_SELLER"){
                index = "판매자"
            }else if(d.key=="ROLE_VIP"){
                index = "VIP"
            }else{
                index = "종합"
            }
            return index;
        });


    let focus =  d3.select("#svg").append('g')
    .attr('class', 'focus')


    focus.append("path")
        .attr("class", "mouse-line")
        .style("stroke", "black")
        .style("stroke-width", "1px").style('stroke-dasharray', '3 3') 
        .style("opacity", "1");

    //날짜 툴팁
    focus.append('rect').attr('class','tip').style("opacity", "0");
    focus.append('text').attr("x", 9);
    
    //중심선
    var mousePerLine = focus.selectAll('.mouse-per-line')
        .data(data)
        .enter()
        .append("g")
        .attr("class", function(d){return d.key})
        .attr("class", "mouse-per-line");

    mousePerLine.append("circle")
        .attr("r", 7)
        .attr("class", function(d){return d.key})
        .style("stroke", function(d) {
          return color(d.key);
        })
        .style("fill", "none")
        .style("stroke-width", "1px")
        .style("opacity", "0");
    
    mousePerLine.append("text")
    .attr("class", function(d){return d.key})
        .attr("transform", "translate(10,3)");

    
                       
    d3.select("#svg")
    .on('mouseover', function(){
        d3.select(".mouse-line")
            .style("opacity", "1");
        d3.selectAll(".mouse-per-line circle")
            .style("opacity", "1");
        d3.selectAll(".mouse-per-line text")
            .style("opacity", "1");
        d3.selectAll(".focus rect")
            .style("opacity", "0.8");
    })
    .on('mouseout', function(){
        d3.select(".mouse-line")
            .style("opacity", "0");
        d3.selectAll(".mouse-per-line circle")
            .style("opacity", "0");
        d3.selectAll(".mouse-per-line text")
            .style("opacity", "0");
        d3.selectAll(".focus rect")
            .style("opacity", "0");
    })
    .on('mousemove', function(event){
        let x = new Date(xScale.invert(d3.pointer(event)[0]))
        let idx = d3.bisectCenter(xValue, x);

        //날짜 툴팁
        d3.select(".tip").attr("transform", "translate("+ (xScale(xValue[idx])-45)+",300)")
        let date = toStringByFormatting(new Date(xValue[idx]))   
        focus.select("text")
            .attr("transform", "translate("+(xScale(xValue[idx])-50)+",320)")
            .attr("opacity", 1)
            .attr("fill","white")
            .text(date)

        // move the 중앙선
        d3.select(".mouse-line")
          .attr("d", function() {
                var d = "M" + xScale(xValue[idx]) + "," + 300;
                d += " " + xScale(xValue[idx]) + "," + 0;
                return d;
            });

        // position the circle and text
        d3.selectAll(".mouse-per-line")
            .attr("transform", function(d, i) {
                console.log(d)

                let bisectDate = d3.bisector(function(d) {return d.payDate; }).center;
                console.log("d.values, x : ", d.values, xValue[idx])
                index = bisectDate(d.values, xValue[idx])
                console.log("x, index : ",xValue[idx],index)

                d3.select(this).select('text')
                 .text(d.values[index].amount)
                 .style("font-weight", "bold")

                if(isSameDate(xValue[idx],d.values[index].payDate)){
                    console.log("같음")
                    return "translate(" + xScale(xValue[idx]) + "," + yScale(d.values[index].amount)  +")";
                }else{
                    console.log("다ㅡㄻ")
                    return null;
                }
            })                 
    });


}

function setMonthChart(data){
    let xValue = []
    let yValue = []
    let xyValue = []
   
    for(i=0; i<data.length;i++){
        xValue.push(new Date(data[i].m))
        yValue.push(data[i].amount)
        xyValue.push([new Date(data[i].m), data[i].amount])        
    }


    let dateStart = data[0].m
    let dateLast = data[data.length-1].m
    let payStart = data[0].amount
    let payLast = data[data.length-1].amount

    console.log((new Date(dateStart)),toStringByFormatting2(new Date(dateLast)))
    console.log(payStart,payLast)

    let xScale = d3.scaleTime().domain([new Date('2022-01-01'), new Date('2022-12-01')]).range([45, width]); 
    let yScale = d3.scaleLinear().domain([0, 10000]).range([height, 30]);
    
    
    
    const xAxis = d3.axisBottom(xScale).tickSize(10).ticks(12).tickFormat(d3.timeFormat("%y/%m"));
    const yAxis = d3.axisLeft(yScale).ticks(10);

    // const xAxis = d3Axis.axisBottom(xScale);
    const xAxisSVG = d3.select("#svg").append("g").attr("transform", "translate(0,"+height+ ")")
                    .style("font-size","15px")
                    .call(xAxis);
    // const yAxis = d3Axis.axisLeft(yScale);
    const yAxisSVG = d3.select("#svg").append("g")
                    .style("font-size","15px")
                    .call(yAxis)
                        .attr("transform", "translate(50,0)")
                    .call(g => g.select(".domain").remove())
                    .call(g => g.selectAll(".tick line").clone()
                        .attr("x2", width)
                        .attr("stroke-opacity", 0.1))
                    .call(g => g.append("text")
                        .attr("x", -30)
                        .attr("y", 15)
                        .attr("fill", "currentColor")
                        .attr("text-anchor", "start")
                        .text("(원)"));

   
      //점을 생성한다.
    d3.select("#svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
    .data(data)                         // 2.찾은 요소에 데이터를 씌운다.
    .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우..
    .append("circle")                   // 4.circle 을 추가한다.
    .attr("r", 5)                       //  - 반지름 5픽셀
    .attr("cx", d=> xScale(new Date(d.m)))      //  - x 위치값 설정.
    .attr("cy", d=>yScale(d.amount))     //  - y 위치값 설정. 
    .style("fill", "steelblue") 

    let linearGenerator = d3.line()
    .curve( d3.curveLinear)
    .x(d=>xScale(new Date(d.m)))
    .y(d=>yScale(d.amount))
    

    d3.select("#svg")
    .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
    .attr("d", linearGenerator(data))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
    .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
    .attr("stroke-width", 3)            // - 굵기
    .attr("stroke", "steelblue")            // - 검정색



    let focus =  d3.select("#svg").append('g')
    .attr('class', 'focus')
    .style('display', 'none')
    ;

    focus.append('circle').attr('r', 5).attr('fill','blue');
    focus.append('text').attr("x", 9);
    focus.append('line').classed('x', true);
    focus.append('line').classed('y', true);
    focus.append('rect').attr('class','monthtip').attr("x",10)

    d3.select("#svg")
    .on('mouseover', function(){
        focus.style('display', null);
        focus.append("text")
            .attr("x", 10)
            .attr("y", 10)
            .attr("opacity", 1);
    
    })
    .on('mouseout', function(){
        focus.style('display', 'none');
        focus.selectAll("text").remove();
        // focus.selectAll("rect").remove();
    })
    .on('mousemove', function(event){
        
        let x = new Date(xScale.invert(d3.pointer(event)[0]))
        let i = d3.bisectLeft(xValue, x);

        //포커스(circle)위치 이동
        focus.attr('transform', `translate(${xScale(xValue[i])},${yScale(yValue[i])})`);
        //크로스헤어 표시
        focus.select('line.x')
                .attr('x1', width)
                .attr('x2', -xScale(xValue[i]))
                .attr('y1', 0)
                .attr('y2', 0);
        focus.select('line.y')
                .attr('x1', 0)
                .attr('x2', 0)
                .attr('y1', yScale(yValue[i]))
                .attr('y2', -yScale(yValue[i]));
        //정보 텍스트 표시
        focus.select("text")
            .datum(xyValue)
            .attr("x", -30)
            .attr("y", -60)
            .attr("opacity", 1)
            .html((d) => {
                let date = toStringByFormatting2(new Date(d[i][0]))
                return "<tspan  x='-40' dy='1.2em' >" + date+ "</tspan>" 
                + "<tspan x='-40' dy='1.2em'>" + + d[i][1] + '원' + "</tspan>";
            });

        focus.select("rect")
            .datum(xyValue)
            .attr("x", -40)
            .attr("y", -60)                   
    });

    d3.selectAll('.focus line').style('fill', 'none');
    d3.selectAll('.focus line').style('stroke', '#67809f');
    d3.selectAll('.focus line').style('stroke-width', '1.5px');
    d3.selectAll('.focus line').style('stroke-dasharray', '3 3'); 
}

function leftPad(value) {
    if (value >= 10) {
        return value;
    }

    return `0${value}`;
}

function toStringByFormatting(source, delimiter = '-') {
    const year = source.getFullYear();
    const month = leftPad(source.getMonth() + 1);
    const day = leftPad(source.getDate());

    return [year, month, day].join(delimiter);
}


function toStringByFormatting2(source, delimiter = '-') {
    const year = source.getFullYear();
    const month = leftPad(source.getMonth() + 1);
    const day = leftPad(source.getDate());

    return [year, month].join(delimiter);
}

function isSameDate(date1, date2){
    return date1.getFullYear() === date2.getFullYear()
       && date1.getMonth() === date2.getMonth()
       && date1.getDate() === date2.getDate();
  }