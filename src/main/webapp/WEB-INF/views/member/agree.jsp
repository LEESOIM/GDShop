<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    
    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/agree.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
  </head>
  <body>
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 65%">
      <div>
        <div class="p-3 mt-3" style="color: rgb(34, 62, 33)">
          <h3><b>회원가입</b></h3>
        </div>
        <div
          class="d-flex mb-3"
          style="border-bottom: solid 1px rgba(201, 199, 199, 0.716)"
        >
          <div id="order1" class="orders">01 약관동의</div>
          <div
            id="order2"
            class="orders"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal_order"
          >
            02 개인정보입력
          </div>
          <div
            id="order3"
            class="orders"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal_order"
          >
            03 가입완료
          </div>
        </div>
        <div class="d-flex justify-content-center mt-4">
          <!-- 약관동의 -->
          <div style="width: 60%; margin-bottom: 50px">
            <div
              class="p-2 mt-1"
              style="
                color: rgb(34, 62, 33);
                font-size: 22px;
                margin-bottom: -8px;
              "
            >
              <b>약관동의</b>
            </div>
            <!-- 약관동의 체크 -->
            <div class="p-2">
              <div class="form-check">
                <input
                  class="form-check-input"
                  type="checkbox"
                  value=""
                  id="all_check"
                />
                <label
                  class="form-check-label"
                  for="all_check"
                  style="
                    font-size: 20px;
                    font-weight: bold;
                    color: rgb(16, 176, 40);
                  "
                >
                  전체동의
                </label>
              </div>
              <hr />
              <div class="d-flex form-check justify-content-between">
                <div>
                  <input
                    class="req agree_check form-check-input"
                    type="checkbox"
                    value=""
                    id="check1"
                  />
                  <label class="form-check-label" for="flexCheckChecked">
                    <b>(필수)</b>구디샵 이용약관 동의
                  </label>
                </div>
                <div
                  class="data"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal_ag1"
                  data-bs-whatever="@mdo"
                >
                  보기
                </div>
              </div>
              <div class="d-flex form-check justify-content-between">
                <div>
                  <input
                    class="req agree_check form-check-input"
                    type="checkbox"
                    value=""
                    id="check2"
                  />
                  <label class="form-check-label" for="flexCheckChecked">
                    <b>(필수)</b>개인정보 수집 및 이용 동의
                  </label>
                </div>
                <div
                  class="data"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal_ag2"
                  data-bs-whatever="@mdo"
                >
                  보기
                </div>
              </div>
              <div class="d-flex form-check justify-content-between">
                <div style="width: 85%;">
                  <input
                    class="agree_check form-check-input"
                    type="checkbox"
                    value=""
                    id="check3"
                  />
                  <label class="form-check-label" for="flexCheckChecked">
                    <b>(선택)</b>서비스·이벤트 정보 제공을 위한 개인정보 수집 및
                    이용 동의
                  </label>
                </div>
                <div
                  class="data"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal_ag3"
                  data-bs-whatever="@mdo"
                >
                  보기
                </div>
              </div>
              <div class="d-flex form-check justify-content-between">
                <div style="width: 85%;">
                  <input
                    class="agree_check form-check-input"
                    type="checkbox"
                    value=""
                    id="check4"
                  />
                  <label class="form-check-label" for="flexCheckChecked">
                    <b>(선택)</b>광고성 정보
                    수신동의(앱알림, 이메일, 카카오알림톡, SMS/MMS)
                  </label>
                </div>
                <div
                  class="data"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal_ag4"
                  data-bs-whatever="@mdo"
                >
                  보기
                </div>
              </div>
              <div class="mt-5 d-flex justify-content-end">
                <form action="join" method="get" id="frm">
                  <button
                    class="btn btn-outline-success pe-4 ps-4 me-2"
                    type="button"
                    id="agree_btn"
                  >
                    확인
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
      <c:import url="../template/footer.jsp"></c:import>

    <!-- 순서모달창 -->
    <div
      class="modal fade"
      id="exampleModal_order"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-body">
            <div class="d-flex pt-4">
              <div
                class="ps-4 pe-3"
                style="font-size: 28px; color: rgba(255, 166, 0, 0.827)"
              >
                <i class="fa-solid fa-circle-exclamation"></i>
              </div>
              <div
                class="pt-2"
                style="
                  color: rgba(113, 109, 109, 0.838);
                  font-size: 17px;
                  line-height: 28px;
                "
              >
                <b>순서에 따라 진행해주세요.</b>
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end pb-4 ps-4 pe-4">
            <button
              type="button"
              class="btn btn-success"
              style="border-radius: 18px; padding: 6px 18px"
              data-bs-dismiss="modal"
            >
              확인
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- 약관보기1 -->
    <div
      class="modal fade"
      id="exampleModal_ag1"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div
            class="modal-header"
            style="background-color: rgb(90, 192, 34); height: 50px"
          >
            <h3
              class="modal-title fs-5"
              id="exampleModalLabel"
              style="color: white; font-size: small"
            >
              구디샵 이용약관
            </h3>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body mt-4">
            <h1 style="text-align: center">
              <b>구디샵 이용약관</b>
            </h1>
            <div
              class="d-flex justify-content-center"
              style="color: gray; margin-top: 15px; margin-bottom: 15px"
            >
              시행일자:2022.11.01
            </div>
            <h3><b>1. 목적</b></h3>
            <div class="mt-3 mb-4">
              이 약관은 (주)스토어링크(이하 “회사”)가 제공하는 구디샵 및 구디샵
              관련 제반 서비스(이하 “서비스”)에 가입한 회원이 서비스를 이용함에
              있어 회원 및 회사 간의 제반 권리 의무와 관련 절차 등을 규정하는 데
              그 목적이 있습니다.
            </div>
            <h3><b>2. 용어의 정의</b></h3>
            <div class="mt-3 mb-4">
              <div class="mb-3">
                (1) “아이디(ID)”란 회원이 서비스에 가입할 때 회사가 회원을
                식별하기 위해 승인하는 문자와 숫자의 조합을 말합니다.
              </div>
              <div class="mb-3">
                (2) “회원”이란 서비스를 이용하기 위해 이 약관에 따라 회사와
                이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 고객을
                말합니다.
              </div>
              <div class="mb-3">
                (3) “광고주”란 제품, 서비스, 매장, 콘텐츠 등을 홍보하기 위해
                가입한 회원을 말합니다.
              </div>
              <div class="mb-3">
                (4) “체험단”이란 광고주의 제품, 서비스, 매장, 콘텐츠를 체험하는
                대가로 체험 후기 등의 콘텐츠를 제공하는 회원을 말합니다.
              </div>
              <div class="mb-3">
                (5) “콘텐츠”란 “광고주” 제품의 홍보 및 판매를 목적으로
                “광고주”가 제공하거나 회사에서 제작한 문장, 이미지, 동영상 등과
                회원이 광고주의 제품, 서비스, 매장, 콘텐츠를 체험하고 구디샵 및
                외부 사이트에 게시하는 문장, 리뷰, 이미지, 동영상 등을 말합니다.
              </div>
              <div class="mb-3">
                (6) “캠페인”이란 광고주가 제품, 서비스, 매장, 콘텐츠 등을
                홍보하기 위해 필수정보(이미지, 제목, 구매채널, 가이드 라인,
                미션, 캠페인 일정, 체험단 모집방법과 모집수 등), 추가정보(혜택,
                유의사항 등)를 입력한 게시글을 말합니다.
              </div>
              <div class="mb-3">
                (7) “미션”이란 회원이 포인트를 받기 위해 수행해야 하는 인증
                행위를 말합니다. 캠페인 지원 시 “미션수행카드”에 회원이 수행해야
                하는 미션이 제시됩니다.
              </div>
              <div class="mb-3">
                (8) “내 포인트”란 캠페인 참여 및 미션 완료를 통해 적립된 적립
                예정 포인트 중 3일이 지나 출금이 가능한 포인트를 말합니다.
              </div>
            </div>
            <h3><b>3.회사정보 등의 제공</b></h3>
            <div class="mt-3 mb-4">
              회사는 다음 각 호의 사항을 회원이 알아보기 쉽도록 애플리케이션 등
              내에 표시합니다. 다만, 개인정보처리방침과 약관은 회원이 연결화면을
              통하여 볼 수 있도록 할 수 있습니다.
              <div class="mb-3 mt-3">(1) 상호 및 대표자의 성명</div>
              <div class="mb-3">
                (2) 영업소 소재지 주소(회원의 불만을 처리할 수 있는 곳의 주소를
                포함한다)
              </div>
              <div class="mb-3">(3) 전화번호, 전자우편주소</div>
              <div class="mb-3">(4) 사업자 등록번호</div>
              <div class="mb-3">(5) 통신판매업 신고번호</div>
              <div class="mb-3">(6) 개인정보처리방침</div>
              <div class="mb-3">(7) 이용약관</div>
            </div>
            <h3><b>4.약관의 명시, 효력 및 개정</b></h3>
            <div class="mt-3 mb-4">
              <div class="mb-3">
                (1) 이 약관은 서비스에 게시하여, 회원에게 공지함으로써 효력이
                발생합니다.
              </div>
              <div class="mb-3">
                (2) 회사는 「전자상거래 등에서의 소비자보호에 관한 법률」,
                「약관의 규제에 관한 법률」, 「정보통신망이용촉진 및 정보보호
                등에 관한 법률」, 「콘텐츠산업진흥법」 등 관련 법령에 위배하지
                않는 범위에서 이 약관을 개정할 수 있습니다.
              </div>
              <div class="mb-3">
                (3) 회사가 이 약관을 개정할 경우에는 적용일자 및 개정사유를
                명시하여 현행약관과 함께 서비스 내에 그 적용일자 7일전부터
                적용일자 전일까지 공지 또는 통지합니다. 다만, 회원에게 불리하게
                약관 내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을
                두고 공지 또는 통지합니다
              </div>
              <div class="mb-3">
                (4) 회사는 개정 약관의 안내를 서비스 내 공지, 이메일 발송, SMS
                발송 중 1가지 이상의 방법으로 명확하게 공지합니다.
              </div>
              <div class="mb-3">
                (5) 회사가 제3항에 따라 개정약관을 공지 또는 통지하면서, 약관
                변경 적용일까지 거부의사를 표시하지 아니할 경우 약관의 변경에
                동의한 것으로 간주한다는 내용을 회원에게 명확하게 공지 또는
                통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 않은
                경우 회원이 개정약관에 동의한 것으로 간주합니다.
              </div>
              <div class="mb-3">
                (6) 회원이 개정약관의 적용에 동의하지 않는 경우 회사는
                개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을
                해지할 수 있습니다. 다만, 회사가 개정약관에 부동의한 회원에게
                기존 약관을 적용할 수 없는 경우, 회사는 해당 회원과의 이용계약을
                해지할 수 있습니다.
              </div>
              <div class="mb-3">
                (7) 회원은 항상 이 약관의 내용에 변경이 있는지 여부를 확인하여야
                합니다.
              </div>
              <div class="mb-3">
                (8) 회사는 필요한 경우 특정 서비스에 관하여 적용될 사항을 위해
                개별약관이나 이용정책을 정하여 운영할 수 있으며, 해당 내용은
                모바일 기기를 통해 공지할 수 있습니다. 이 약관에 규정되지 않은
                사항에 대해서는 관련법령 또는 개별약관, 이용정책에서 정한 바에
                따릅니다.
              </div>
              <div class="mb-3">
                (9) 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는
                「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에
                관한 법률」, 「정보통신망이용촉진 및 정보보호 등에 관한 법률」,
                「콘텐츠산업진흥법」 등 관련 법령 또는 상관례에 따릅니다.
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end p-3">
            <button
              type="button"
              class="btn btn-outline-success ps-4 pe-4"
              data-bs-dismiss="modal"
              style="border-radius: 20px"
            >
              확인
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- 약관보기2 -->
    <div
      class="modal fade"
      id="exampleModal_ag2"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div
            class="modal-header"
            style="background-color: rgb(90, 192, 34); height: 50px"
          >
            <h3
              class="modal-title fs-5"
              id="exampleModalLabel"
              style="color: white; font-size: small"
            >
              구디샵 이용약관
            </h3>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body mt-4">
            <h1 style="text-align: center">
              <b>개인정보 수집·이용 동의서(필수)</b>
            </h1>
            <div class="mt-3 mb-4">
              주식회사 스토어링크(이하 “회사”)는 회사가 구디샵 홈페이지를 통하여
              제공하는 서비스 (이하 “서비스”)의 원활한 제공을 위하여 아래와 같이
              개인정보를 수집·이용하고자 합니다. 내용을 자세히 읽으신 후 동의
              여부를 결정하여 주십시오.
            </div>
            <h3><b>□ 개인정보 수집·이용 내역 (필수 항목)</b></h3>
            <div class="mt-3 mb-4">
              <div class="mb-3">
                <img
                  src="../images/화면 캡처 2022-11-12 122121.png"
                  style="width: 100%"
                />
              </div>
              <div class="mb-3">
                ※ 위와 같이 개인정보를 처리하는데 동의를 거부할 권리가 있습니다.
                그러나 동의를 거부할 경우, 회원가입 및 회사가 제공하는 서비스를
                이용할 수 없습니다.
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end p-3">
            <button
              type="button"
              class="btn btn-outline-success ps-4 pe-4"
              data-bs-dismiss="modal"
              style="border-radius: 20px"
            >
              확인
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- 약관보기3 -->
    <div
      class="modal fade"
      id="exampleModal_ag3"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div
            class="modal-header"
            style="background-color: rgb(90, 192, 34); height: 50px"
          >
            <h3
              class="modal-title fs-5"
              id="exampleModalLabel"
              style="color: white; font-size: small"
            >
              구디샵 이용약관
            </h3>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body mt-4">
            <h1 style="text-align: center">
              <b>개인정보 수집·이용 동의서(선택)</b>
            </h1>
            <div class="mt-3 mb-4">
              주식회사 스토어링크(이하 “회사”)는 회사가 구디샵 홈페이지를 통하여
              제공하는 서비스 (이하 “서비스”)의 원활한 제공을 위하여 아래와 같이
              개인정보를 수집·이용하고자 합니다. 내용을 자세히 읽으신 후 동의
              여부를 결정하여 주십시오.
            </div>
            <h3><b>□ 개인정보 수집·이용 내역 (필수 항목)</b></h3>
            <div class="mt-3 mb-4">
              <div class="mb-3">
                <img
                  src="../images/화면2 캡처 2022-11-12 122601.png"
                  style="width: 100%"
                />
              </div>
              <div
                class="mb-3"
                style="color: red; font-size: 14px; font-weight: bold"
              >
                ※ 위와 같이 개인정보를 처리하는데 동의를 거부할 권리가 있습니다.
                그러나 동의를 거부할 경우, 일부 서비스가 제한될 수 있습니다.
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end p-3">
            <button
              type="button"
              class="btn btn-outline-success ps-4 pe-4"
              data-bs-dismiss="modal"
              style="border-radius: 20px"
            >
              확인
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- 약관보기4 -->
    <div
      class="modal fade"
      id="exampleModal_ag4"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div
            class="modal-header"
            style="background-color: rgb(90, 192, 34); height: 50px"
          >
            <h3
              class="modal-title fs-5"
              id="exampleModalLabel"
              style="color: white; font-size: small"
            >
              구디샵 이용약관
            </h3>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body mt-4">
            <h1 style="text-align: center"><b>프로모션 정보 수신 동의서</b></h1>
            <h3 style="margin-top: 30px">
              <b>□ 프로모션 정보 수신 동의 (선택 항목)</b>
            </h3>
            <div class="mt-3 mb-4">
              <div class="mb-3">
                회사에서 제공하는 신규 콘텐츠 출시, 새로운 기능의 안내, 이벤트
                및 이용자 맞춤형 콘텐츠 추천 등의
                <b style="font-size: 18px; color: rgb(67, 67, 67)"
                  >다양한 광고성 정보를 휴대전화(앱 알림, SMS/MMS 문자,
                  이메일)</b
                >로 받아 보실 수 있습니다. 결제안내 등 의무적으로 안내되어야
                하는 정보성 내용은 수신 동의 여부와 무관하게 제공합니다.
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end p-3">
            <button
              type="button"
              class="btn btn-outline-success ps-4 pe-4"
              data-bs-dismiss="modal"
              style="border-radius: 20px"
            >
              확인
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- 필수 약관동의 안내 버튼 -->
    <button
      type="button"
      id="agreex"
      data-bs-toggle="modal"
      data-bs-target="#exampleModal_agreex"
      data-bs-whatever="@mdo"
      style="display: none"
    >
      필수 약관동의 모달버튼
    </button>

    <!-- 필수 약관동의 안내 모달창 -->
    <div
      class="modal fade"
      id="exampleModal_agreex"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-body">
            <div class="d-flex pt-4">
              <div class="ps-4 pe-3" style="font-size: 28px; color: red">
                <i class="fa-solid fa-triangle-exclamation"></i>
              </div>
              <div
                class="pt-2"
                style="color: red; font-size: 17px; line-height: 28px"
              >
                <b>필수 이용약관에 대한 동의해주세요.</b>
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end pb-4 ps-4 pe-4">
            <button
              type="button"
              class="btn btn-success"
              style="border-radius: 18px; padding: 6px 18px"
              data-bs-dismiss="modal"
            >
              확인
            </button>
          </div>
        </div>
      </div>
    </div>

    <script src="/js/agree.js"></script>
  </body>
</html>
