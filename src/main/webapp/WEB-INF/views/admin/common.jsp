<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
   
</head>
<body>
    <table class="table table-hover">
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>Email</th>
            <th>포인트</th>
            <th>등급</th>
            <th>미션</th> 
            <th>가입승인</th>
        </tr>
        <c:forEach items="${list}" var="memberVO">
            <tr class="memberRow" onclick="memberDetail(this)" data-member="${memberVO.id}" data-bs-toggle="modal" data-bs-target="#memberInfoModal">
                <td>${memberVO.id}</td>
                <td>${memberVO.name}</td>
                <td>${memberVO.email}</td>
                <td>${memberVO.point}</td>
                <td onclick="roleDetail(this)" data-bs-toggle="modal" data-bs-target="#roleModal">
                    <div>
                        <c:if test="${memberVO.cnt==1}">
                            <c:forEach items="${memberVO.roleVOs}" var="roleVO">
                                <div data-rolenum="${roleVO.roleNum}">${fn:split(roleVO.roleName,'_')[1]}</div>
                            </c:forEach>  
                        </c:if>
                        <c:if test="${memberVO.cnt==2}">
                            <c:forEach items="${memberVO.roleVOs}" var="roleVO">
                                <div data-rolenum="${roleVO.roleNum}">${fn:split(roleVO.roleName,'_')[1]}</div>
                            </c:forEach> 
                                <div data-rolenum="4">MEMBER</div> 
                        </c:if>
                        <c:if test="${memberVO.cnt==3}">
                            <c:if test="${memberVO.sum==7}">
                                <c:forEach items="${memberVO.roleVOs}" var="roleVO">
                                    <div data-rolenum="${roleVO.roleNum}">${fn:split(roleVO.roleName,'_')[1]}</div>
                                </c:forEach>
                                <div data-rolenum="2">SELLER</div>
                                <div data-rolenum="4">MEMBER</div>    
                            </c:if>
                            <c:if test="${memberVO.sum gt 7 && memberVO.sum lt 10}">
                                <c:forEach items="${memberVO.roleVOs}" var="roleVO">
                                    <div data-rolenum="${roleVO.roleNum}">${fn:split(roleVO.roleName,'_')[1]}</div>
                                </c:forEach>
                                <div data-rolenum="3">VIP</div>
                                <div data-rolenum="4">MEMBER</div>    
                            </c:if>
                        </c:if>
                        <c:if test="${memberVO.cnt==4}">
                            <c:forEach items="${memberVO.roleVOs}" var="roleVO">
                                <div data-rolenum="${roleVO.roleNum}">${fn:split(roleVO.roleName,'_')[1]}</div>
                                <div data-rolenum="2">SELLER</div>
                                <div data-rolenum="3">VIP</div>
                                <div data-rolenum="4">MEMBER</div>      
                            </c:forEach>  
                        </c:if>
                    </div>
                </td>
                <td><button data-bs-toggle="modal" data-bs-target="#missionModal">미션</button></td>
                <td>${memberVO.status}</td>
            </tr>
        </c:forEach>
    </table>
    
    <div id="page">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item"  value="${pager.pre}" id="pre">
                    <a class="page-link"  aria-label="Previous"> 
                        <span aria-hidden="true" data-dir="prev"  data-page="${pager.page}">previous</span>
                    </a>
                </li>
    
                <c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
                    <li class="page-item ${pager.page==i? 'active':''}">
                        <a class="page-link">${i}</a>
                    </li>
                </c:forEach>
            
                <li class="page-item ${pager.next?'':'disabled'}" id="next">
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

    $('.page-item').click(function(event){

        let page = parseInt(event.target.dataset.page)
        if(event.target.dataset.dir=='prev'){
            
            page-=1
            
        }else if(event.target.dataset.dir=='next'){
            
            page+=1
            
        }else{
            page=parseInt(event.target.text)
            
        }
        
        $.ajax({
            type:"POST",
            URL:"member",
            data:{
                roleName:$("input[name='roleName']:checked").val(),
                page:page,
                kind:$("select[name='kind']").val(),
                search:$("#search").val()
            },
            success:function(data){
                result = data
                $("#member_list").html(result)
            }
        })
    })
</script>
</body>