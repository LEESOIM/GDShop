<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 		<div
     class="mb-5"
     style="
       text-align: center;
       color: rgba(139, 139, 139, 0.737);
       font-size: 14px;
       padding-top: 13px;
     "
   >
      <div class="mb-2 mt-5">해당 회원의 등급이 없습니다.</div>
      <div>
        등급에 따라 캠페인 당첨 확률에 영향을 주지는 않지만,
        결정된 등급에 따라 참여할 수 있는 캠페인이 제한될 수
        있습니다.
      </div>
      <div class="mt-2">
        *멤버십 가입 시 VIP등급으로 올릴 수 있습니다. 등급제에
        관한 자세한 내용은 아래 버튼을 클릭해 주세요.
      </div>
      <button
        type="button"
        class="btn btn-outline-success btn-sm mt-4"
        data-bs-toggle="modal"
        data-bs-target="#exampleModal_membership"
        data-bs-whatever="@mdo"
      >
        멤버십가입 알아보기
      </button>
    </div>