<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
   
</head>
<body>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">상품번호</th>
                <th scope="col">상품명</th>
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
              <li class="page-item ${request}"  value="${pager.pre}" id="pre">
                <a class="page-link" href="./seller?page=${pager.page-1}" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>

              <c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
                <li class="page-item ${request} ${pager.page==i? 'active':''}">
                  <a class="page-link" href="./seller?page=${i}">${i}</a>
                </li>
              </c:forEach>
              
              <li class="page-item ${request} ${pager.next?'':'disabled'}" id="next">
                <a class="page-link" href="./seller?page=${pager.page+1}" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
    </div>

<script>
    preCheck();
// pagination previous 체크
    function preCheck(){
        if($('#pre').attr("value")=='true'){
            $('#pre').removeClass('disabled')
        }else if($('#pre').attr("value")=='false'){
            $('#pre').addClass('disabled')
        }
    }

    $('.add').click(function(event){
        let page = parseInt(event.target.dataset.page)
        console.log("")
        if(event.target.dataset.dir=='prev'){
            page-=1
        }else if(event.target.dataset.dir=='next'){ 
            page+=1 
        }else{
            page=parseInt(event.target.text)  
        }
        
        $.ajax({
            type:"GET",
            URL:"addRequest",
            data:{
                page:page,
            },
            success:function(data){
                result = data
                $("#add_list").html(result)
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
            URL:"updateRequest",
            data:{
                page:page,
            },
            success:function(data){
                result = data
                $("#update_list").html(result)
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
            URL:"deleteRequest",
            data:{
                page:page,
            },
            success:function(data){
                result = data
                $("#delete_list").html(result)
            }
        })
    })
</script>
</body>