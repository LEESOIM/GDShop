
let xScale = '';
let yScale = '';

let margin = { top: 20, right: 20, bottom: 30, left: 30 };
let width = $("#svg").width() - margin.left - margin.right;
let height = $("#svg").height() - margin.top - margin.bottom;
console.log($("#svg").width(),$("#svg").height())

$(document).ready(function(){
    console.log("시작")
    $.ajax({
        type:"GET",
        url:"getRevenue",
    
        success:function(data){
            console.log(data)
            let xValue = []
            let yValue = []
            let xyValue = []
            let map = new Map()
            for(i=0; i<data.length;i++){
                console.log(new Date(data[i].payDate))
                xValue.push(new Date(data[i].payDate))
                yValue.push(data[i].amount)
                xyValue.push([new Date(data[i].payDate), data[i].amount])        
            }


            console.log(xyValue)
            let dateStart = data[0].payDate
            let dateLast = data[data.length-1].payDate
            let payStart = data[0].amount
            let payLast = data[data.length-1].amount

            console.log(dateStart,dateLast)
            console.log(payStart,payLast)

            xScale = d3.scaleTime().domain([new Date(dateStart), new Date(dateLast)]).range([45, width]); 
            yScale = d3.scaleLinear().domain([0, 1000]).range([height, 30]);
            
            
            
            const xAxis = d3.axisBottom(xScale).tickSizeOuter(0).ticks(15).tickFormat(d3.timeFormat("%m/%d"));
            const yAxis = d3.axisLeft(yScale).ticks(10);

            // const xAxis = d3Axis.axisBottom(xScale);
            const xAxisSVG = d3.select("#svg").append("g").attr("transform", "translate(0,"+height+ ")")
                            .style("font-size","15px")
                            .call(xAxis);
            // const yAxis = d3Axis.axisLeft(yScale);
            const yAxisSVG = d3.select("#svg").append("g")
                            .style("font-size","15px")
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

           
              //점을 생성한다.
            d3.select("#svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
            .data(data)                         // 2.찾은 요소에 데이터를 씌운다.
            .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우..
            .append("circle")                   // 4.circle 을 추가한다.
            .attr("r", 5)                       //  - 반지름 5픽셀
            .attr("cx", d=> xScale(new Date(d.payDate)))      //  - x 위치값 설정.
            .attr("cy", d=>yScale(d.amount))     //  - y 위치값 설정. 
            .style("fill", "steelblue") 

            let linearGenerator = d3.line()
            .curve( d3.curveLinear)
            .x(d=>xScale(new Date(d.payDate)))
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
           
            focus.append('rect').attr('class','tip').attr("x",10).attr('fill','steelblue')
                                .attr('height',50)
            

       
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
                let i = d3.bisectRight(xValue, x);
              
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
                        let date = toStringByFormatting(new Date(d[i][0]))
                        return "<tspan  x='-40' dy='1.2em' >" + date+ "</tspan>" 
                        + "<tspan x='-40' dy='1.2em'>" + + d[i][1] + '원' + "</tspan>";
                    });

                focus.select("rect")
                    .datum(xyValue)
                    .attr("x", -40)
                    .attr("y", -60)
                    .html((d) => {
                        console.log(toStringByFormatting(new Date(d[i][0])))
                        let date = toStringByFormatting(new Date(d[i][0]))
                        return '날짜: ' + date
                    + '매출: ' + d[i][1] 
                });

            

                

                   
            });

            d3.select('.overlay').style('fill', 'none');
            d3.select('.overlay').style('pointer-events', 'all');
            d3.selectAll('.focus line').style('fill', 'none');
            d3.selectAll('.focus line').style('stroke', '#67809f');
            d3.selectAll('.focus line').style('stroke-width', '1.5px');
            d3.selectAll('.focus line').style('stroke-dasharray', '3 3'); 

            d3.select('.tip')
            .attr("class", "tip")
            .style("background-color", "white")
            .style("border", "solid")
            .style("border-width", "1px")
            .style("border-radius", "5px")
            .style("padding", "10px")


           
        }
    })
})


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