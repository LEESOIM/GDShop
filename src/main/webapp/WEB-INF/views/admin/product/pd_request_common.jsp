<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
   
</head>
<body>
    <table class="table table-striped" id="pdTable">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col" onclick="sortTable(1)">상품번호</th>
                <th scope="col" onclick="sortTable(2)">상품명</th>
                <th scope="col">캠페인</th>
                <th scope="col">아이디</th>
                <th scope="col">기업명</th>
                <th scope="col">등록일</th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="add">
                <tr>
                    <th scope="row"></th>
                    <td>${add.itemNum}</td>
                    <td>${add.itemName}</td>
                    <td>${add.type}</td>
                    <td>${add.id}</td>
                    <td>${add.sellerVO.company}</td>
                    <td>${add.date}</td>
                    <td><a href="#">O</a></td>
                    <td><a href="#">X</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div id="page">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item ${request} pre"  value="${pager.pre}" id="pre">
                <a class="page-link" aria-label="Previous">
                  <span aria-hidden="true"  data-dir="prev"  data-page="${pager.page}">previous</span>
                </a>
              </li>

              <c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
                <li class="page-item ${request} ${pager.page==i? 'active':''}">
                  <a class="page-link">${i}</a>
                </li>
              </c:forEach>
              
              <li class="page-item ${request} ${pager.next?'':'disabled'} next">
                <a class="page-link" aria-label="Next">
                  <span aria-hidden="true" data-dir="next"  data-page="${pager.page}">next</span>
                </a>
              </li>
            </ul>
          </nav>
    </div>


<script>
    // function sortTable(n){
    //     let table, rows, switching, i, x,y, shouldSwitch, dir, switchCount = 0;
    //     table = document.getElementById("pdTable");
    //     switching = true;
    //     dir = "asc";
    //     console.log(table.rows)

    //     while (switching){
    //         switching = false;
    //         rows = table.rows;
    //         for(i=1; i<(rows.length-1); i++){
    //             shouldSwitch=false;
    //             x=rows[i].getElementsByTagName("TD")[n];
    //             y=rows[i+1].getElementsByTagName("TD")[n];
    //             console.log("x",x)
    //             console.log("y",y)

    //             if(dir=="asc"){
    //                 if(x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()){
    //                     shouldSwitch = true;
    //                     break;
    //                 }
    //             } else if(dir="desc"){
    //                 if(x.innerHTML.toLowerCase()<y.innerHTML.toLowerCase()){
    //                     shouldSwitch=true;
    //                     break;
    //                 }
    //             }
    //         }
    //         if(shouldSwitch){
    //             rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
    //             switching = true;
    //             switchcount ++;
    //         } else {        
    //             if (switchcount == 0 && dir == "asc") {
    //                 dir = "desc";
    //                 switching = true;
    //             }
    //         }
    //     }
    // }
    preCheck();
    // pagination previous 체크
    function preCheck(){
        if($('#pre').attr("value")=='true'){
            $('#pre').removeClass('disabled')
        }else if($('#pre').attr("value")=='false'){
            $('#pre').addClass('disabled')
        }
    }

    $('.product').click(function(event){
        let page = parseInt(event.target.dataset.page)
        if(event.target.dataset.dir=='prev'){
            page-=1
        }else if(event.target.dataset.dir=='next'){ 
            page+=1 
        }else{
            page=parseInt(event.target.text)  
        }
        $.ajax({
            type:"GET",
            url:"getPdList",
            data:{
                page:page,
            },
            success:function(data){
                result = data
                $("#product_list").html(result)
            }
        })
    })

    $('.add').click(function(event){
        let page = parseInt(event.target.dataset.page)
        if(event.target.dataset.dir=='prev'){
            page-=1
        }else if(event.target.dataset.dir=='next'){ 
            page+=1 
        }else{
            page=parseInt(event.target.text)  
        }
        $.ajax({
            type:"GET",
            url:"add_request",
            data:{
                page:page,
            },
            success:function(data){
                result = data
                $("#pdList").html(result)
            }
        })
    })

    $('.update').click(function(event){
        let page = parseInt(event.target.dataset.page)
        if(event.target.dataset.dir=='prev'){            
            page-=1           
        }else if(event.target.dataset.dir=='next'){            
            page+=1            
        }else{
            page=parseInt(event.target.text)            
        }

        $.ajax({
            type:"GET",
            url:"update_request",
            data:{
                page:page,
            },
            success:function(data){
                result = data
                $("#pdList").html(result)
            }
        })
    })

    $('.delete').click(function(event){
        let page = parseInt(event.target.dataset.page)
        if(event.target.dataset.dir=='prev'){            
            page-=1           
        }else if(event.target.dataset.dir=='next'){            
            page+=1            
        }else{
            page=parseInt(event.target.text)            
        }

        $.ajax({
            type:"GET",
            url:"delete_request",
            data:{
                page:page,
            },
            success:function(data){
                result = data
                $("#pdList").html(result)
            }
        })
    })

    $('.reject').click(function(event){
        let page = parseInt(event.target.dataset.page)
        if(event.target.dataset.dir=='prev'){            
            page-=1           
        }else if(event.target.dataset.dir=='next'){            
            page+=1            
        }else{
            page=parseInt(event.target.text)            
        }

        $.ajax({
            type:"GET",
            url:"reject_request",
            data:{
                page:page,
            },
            success:function(data){
                result = data
                $("#pdList").html(result)
            }
        })
    })
</script>
</body>