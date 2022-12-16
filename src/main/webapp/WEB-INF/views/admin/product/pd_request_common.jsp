<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
   
</head>
<body>
    <table class="table table-hover" id="pdTable">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col" >상품번호</th>
                <th scope="col" >상품명</th>
                <th scope="col">캠페인</th>
                <th scope="col">아이디</th>
                <th scope="col">기업명</th>
                <th scope="col">등록일</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="add">
                <tr onclick="getDetail(this)">
                    <th scope="row"></th>
                    <td class="itemnum">${add.itemNum}</td>
                    <td>${add.itemName}</td>
                    <td>${add.type}</td>
                    <td>${add.id}</td>
                    <td>${add.sellerVO.company}</td>
                    <td>${add.date}</td>
 
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div id="page">
        <nav aria-label="Page navigation example">
            <ul class="pagination  justify-content-center">
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
    
    preCheck();
    // pagination previous 체크
    function preCheck(){
        if($('#pre').attr("value")=='true'){
            $('#pre').removeClass('disabled')
        }else if($('#pre').attr("value")=='false'){
            $('#pre').addClass('disabled')
        }
    }

    // 상품 리스트
    $('.product').click(function(event){
        let page = parseInt(event.target.dataset.page)
        let kind = $("select[name='kind']").val()
        let search = $("#search").val()
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
                kind:kind,
                search:search
            },
            success:function(data){
                result = data
                $("#product_list").html(result)
            }
        })
    })


    // 상품 요청 리스트
    function getRequest(url,page){
        let kind = $("select[name='kind']").val()
        let search = $("#search").val()
        $.ajax({
            type:"GET",
            url:url,
            data:{
                page:page,
                kind:kind,
                search:search
            },
            success:function(data){
                result = data
                $("#pdList").html(result)
            }
        })
    }

    $('.add').click(function(event){
        let page = parseInt(event.target.dataset.page)

        if(event.target.dataset.dir=='prev'){
            page-=1
        }else if(event.target.dataset.dir=='next'){ 
            page+=1 
        }else{
            page=parseInt(event.target.text)  
        }
        console.log(page)
        getRequest("add_request",page)
        // $.ajax({
        //     type:"GET",
        //     url:"add_request",
        //     data:{
        //         page:page,
        //     },
        //     success:function(data){
        //         result = data
        //         $("#pdList").html(result)
        //     }
        // })
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
        getRequest("update_request",page)
        // $.ajax({
        //     type:"GET",
        //     url:"update_request",
        //     data:{
        //         page:page,
        //     },
        //     success:function(data){
        //         result = data
        //         $("#pdList").html(result)
        //     }
        // })
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
        getRequest("delete_request",page)
        // $.ajax({
        //     type:"GET",
        //     url:"delete_request",
        //     data:{
        //         page:page,
        //     },
        //     success:function(data){
        //         result = data
        //         $("#pdList").html(result)
        //     }
        // })
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
        getRequest("reject_request",page)
        // $.ajax({
        //     type:"GET",
        //     url:"reject_request",
        //     data:{
        //         page:page,
        //     },
        //     success:function(data){
        //         result = data
        //         $("#pdList").html(result)
        //     }
        // })
    })
</script>
</body>