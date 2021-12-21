<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<meta charset="UTF-8">
<title>JoinFrm</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <div class="container" style="margin-top: 60px; margin-bottom: 50px;">
    <div class="joinwrap"> 
      <form action="/join.do" method="post">
        <fieldset>
          <div id="join-l">
            <img src="/resources/img/logo/Develomint_logo.png" id="joinlogo">
          </div>
          <div class="form-group">
            <label class="col-form-label mt-4" for="memberId">아이디</label>
            <div class="idwrap">
              <input type="text" class="form-control" placeholder="아이디 입력(5~12자)" name="memberId" id="memberId">
              <button type="button" class="btn btn-primary" id="memberIdChk">중복체크</button>
            </div>
            <span class="expResult"></span>
          </div>
          <div class="form-group">
            <label for="memberPw" class="form-label mt-4">비밀번호</label>
            <input type="password" class="form-control" name="memberPw" id="memberPw" placeholder="비밀번호(숫자,영문 최소8자)">
            <span class="expResult"></span>
          </div>
          <div class="form-group">
            <label for="memberPwRe" class="form-label mt-4">비밀번호 확인</label>
            <input type="password" class="form-control " name="memberPwRe" id="memberPwRe" placeholder="비밀번호(숫자,영문 최소8자)">
            <span class="expResult"></span>
          </div>
          <div class="form-group">
            <label class="col-form-label mt-4" for="memberName">이름</label>
            <input type="text" class="form-control" placeholder="이름입력" id="memberName" name="memberName">
            <span class="expResult"></span>
          </div>
          <div class="form-group">
            <label class="col-form-label mt-4" for="phone">전화번호</label>
            <input type="text" class="form-control" placeholder="ex) 010-1234-1234" id="phone" name="phone">
            <span class="expResult"></span>
          </div>
          <div class="form-group">
            <label class="col-form-label mt-4" for="email">이메일</label>
            <div class="emailWrap">
              <input type="email" class="form-control" placeholder="이메일을 입력하세요" name="email" id="email">
              <button type="button" class="btn btn-primary" id="emailChk">인증번호 받기</button>
            </div>
            <span class="expResult"></span>
          </div>
          <br>
          <div class="input-group mb-3 auth" style="width: 300px; display:none">
      		<input type="text" class="form-control" id="authCode" placeholder="인증번호 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
      		<button class="btn btn-primary authBtn" type="button" id="button-addon2">인증하기</button>
      		<p id="timeZone" class="text-info" style="line-height: 38px; padding-left:10px; margin:0;"></p>
    	</div>
      	<p id="authMsg"></p>
        </fieldset>
        <fieldset class="form-group">
          <legend class="mt-4">약관동의</legend>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="checkAll">
            <label class="form-check-label" for="checkAll">
             	 전체 동의 하기
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input agreement required" type="checkbox" id="memberAgree">
            <label class="form-check-label" for="memberAgree">
             	 회원가입약관(필수)
            </label>
            <!-- 회원가입 약관 모달 -->
            <button type="button" class="badge bg-info" data-bs-toggle="modal" data-bs-target="#Modal1" style="border: none;">
              	보기
            </button>
          </div>
          <div class="form-check">
          <input class="form-check-input agreement required" type="checkbox" id="memberData">
            <label class="form-check-label" for="memberData">
              	개인정보취급방침(필수)
            </label>
            <button type="button" class="badge bg-info" data-bs-toggle="modal" data-bs-target="#Modal2" style="border: none;">
             	 보기
            </button>
          </div>
          <div class="form-check">
            <input class="form-check-input agreement" type="checkbox" value="" id="marketings">
            <label class="form-check-label" for="marketings">
              	마케팅동의(선택)
            </label>
            <button type="button" class="badge bg-info" data-bs-toggle="modal" data-bs-target="#Modal3" style="border: none;">
             	 보기
            </button>
          </div>
        </fieldset>
        <div class="g-recaptcha" data-sitekey=6LdUebcdAAAAAJsK4CE4Ih7C_d3zdDX_IOXzfeo1 style="width: 100%; margin-top: 30px; margin-left: 70px;"></div>
        <button type="button" class="btn btn-primary" id="joinBtn">회원가입</button>
      </form>
    </div><!--joinwrap끝나는지점-->

    <!-- Modal 회원가입약관 -->
    <div class="modal fade" id="Modal1" tabindex="-1" aria-labelledby="ModalLable1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title text-primary" id="ModalLable1" style="font-weight: bold;">회원가입약관</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>공정거래위원회 표준약관 제10023호</p><p>(2014. 9. 19. 개정)</p><p>제1조(목적) 이 약관은 주식회사 KH가 운영하는  개발자 커뮤니티(이하 “Develomints”라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 Develomints 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</p><p>&nbsp; ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p><br/>
            <p>제1조(정의)</p><br/>
            <p>&nbsp; ① “Develomints”란 주식회사 KH이  재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 Develomints를 운영하는 사업자의 의미로도 사용합니다.</p><br/>
            <p>&nbsp; ② “이용자”란 “Develomints”에 접속하여 이 약관에 따라 “Develomints”가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</p><br/>
            <p>&nbsp; ③ ‘회원’이라 함은 “Develomints”에 회원등록을 한 자로서, 계속적으로 “Develomints”가 제공하는 서비스를 이용할 수 있는 자를 말합니다.</p><br/>
            <p>&nbsp; ④ ‘비회원’이라 함은 회원에 가입하지 않고 “Develomints”가 제공하는 서비스를 이용하는 자를 말합니다.</p><br/>
            <p>제2조 (약관 등의 명시와 설명 및 개정)&nbsp;</p><br/>
            <p>&nbsp; ① “Develomints”는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 Develomints의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</p><br/>
            <p>&nbsp; ② “Develomints”는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p><br/>
            <p>&nbsp; ④ “Develomints”가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 Develomints의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "Develomints“는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.&nbsp;</p><br/>
            <p>&nbsp; ⑤ “Develomints”가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “Develomints”에 송신하여 “Develomints”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</p><br/>
            <p>&nbsp; ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.&nbsp;</p><br/>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div><!--회원가입약관 modal 끝나는지점-->
    <!-- Modal 개인정보취급방침 -->
    <div class="modal fade" id="Modal2" tabindex="-1" aria-labelledby="ModalLable2" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title text-primary" id="ModalLable2" style="font-weight: bold;">개인정보 취급방침</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>&lt;주식회사 KH&gt;('http://www.Develomints.kr'이하 'Develomints')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p><br/>
            <p>&lt;주식회사 KH&gt;('Develomints') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p><br/>
            <p>○ 본 방침은부터 2015년 1월 1일부터 시행됩니다.</p><br/>
            <p>1. 개인정보의 처리 목적 &lt;주식회사 KH&gt;('http://www.Develomints.kr'이하 'Develomints')은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</p><br/>
            <p>가. 홈페이지 회원가입 및 관리</p><p>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.</p><br/>
            <p>나. 민원사무 처리</p><p>민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.</p><br/>
            <p>다. 재화 또는 서비스 제공</p><p>서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.</p><br/>
            <p>라. 마케팅 및 광고에의 활용</p><p>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.</p><br/>
            <br/>
            <br/>
            <p>2. 개인정보 파일 현황</p><br/>
            <p>1. 개인정보 파일명 : Develomints_privacy</p><p>- 개인정보 항목 : 비밀번호, 로그인ID, 이름, 이메일, 접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그</p><p>- 수집방법 : 홈페이지</p><p>- 보유근거 : 개인정보처리방침</p><p>- 보유기간 : 3년</p><p>- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년, 계약 또는 청약철회 등에 관한 기록 : 5년, 표시/광고에 관한 기록 : 6개월</p><br/>
            <br/>
            <br/>
            <p>3. 개인정보의 처리 및 보유 기간</p><br/>
            <p>① &lt;주식회사 KH&gt;('Develomints')은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.</p><br/>
            <p>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p><br/>
            <p>1.&lt;홈페이지 회원가입 및 관리&gt;</p><p>&lt;홈페이지 회원가입 및 관리&gt;와 관련한 개인정보는 수집.이용에 관한 동의일로부터&lt;3년&gt;까지 위 이용목적을 위하여 보유.이용됩니다.</p><p>-보유근거 : 개인정보처리방침</p><p>-관련법령 : 1)소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</p><p>2) 대금결제 및 재화 등의 공급에 관한 기록 : 5년</p><p>3) 표시/광고에 관한 기록 : 6개월</p><br/>
            <br/>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div><!--개인정보 취급방침 modal 끝나는 지점-->
    <!-- Modal 마케팅동의 -->
    <div class="modal fade" id="Modal3" tabindex="-1" aria-labelledby="ModalLable3" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title text-primary" id="ModalLable3" style="font-weight: bold;">마케팅 동의(선택)</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            귀하는 개인(신용)정보의 선택적인 수집∙이용, 제공에 대한 동의를 거부할 수 있습니다. 다만, 동의하지 않을 경우 관련 편의제공(이벤트 안내, 공지사항, 할인행사)안내 등 이용 목적에 따른
            혜택에 제한이 있을 수 있습니다.<br>그 밖에 계약과 관련된 불이익은 없습니다. 동의한 경우에도 귀하는 동의를 철회하거나 마케팅 목적으로 귀하에게
            연락하는 것을 중지하도록 요청할 수 있습니다.<br><br>1. 수집 및 이용목적<br>
            <span style="font-weight:bold; font-size:16px;">고객에 대한 편의제공, 귀사 및 제휴업체의 상품·서비스 안내 및 이용권유, 사은·판촉행사 등의 마케팅 활동, 시장조사 및 상품·서비스 개발연구 등을 목적으로 수집·이용</span><br><br>
            2. 수집 및 이용항목<br>- 개인식별정보: 성명, 성별, 나이,휴대전화번호,
            e-mail 등<br>- 고객 ID, 접속 일시, IP주소 등<br><br>
            3. 보유기간<br><span style="font-weight:bold; font-size:16px;">동의일로부터 회원 탈퇴 혹은 마케팅 동의 해제 시까지 보유·이용</span><br>
            ※ 더 자세한 내용에 대해서는 <a href="/member/v1/join/agreement/privacy-policy" style="text-decoration: underline">개인정보처리방침</a>을
            참고하시기 바랍니다.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div><!--개인정보 취급방침 modal 끝나는 지점-->
  </div><!--container끝나는 지점-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 <script type="text/javascript" src="/resources/js/member/join.js"></script>
 <script type="text/javascript">
 $("#joinBtn").click(function(){
	 var required = $(".required:checked").length;
	 if(idChk==true&&pwChk==true&&pwreChk==true&&nameChk==true&&phoneChk==true&&emailChk==true&&emailCodeChk==true&&required==2){
		//리캡차 체크
		$.ajax({
            url: '/VerifyRecaptcha.do',
            type: 'post',
            data: {
                recaptcha: $("#g-recaptcha-response").val()
            },
            success: function(data) {
                switch (data) {
                    case 0:
                        console.log("자동 가입 방지 봇 통과");
                        captcha = 0;
                		break;
                    case 1:
	               		 swal({
	          			   title: "자동가입 방지봇을 체크해주세요!",
	          			   icon: "warning", //"info,success,warning,error" 중 택1
	          			   button: "돌아가기",
	          			});
                        break;
                    default:
                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                   		break;
                }
            }
        });
		 swal({
			   title: "가입성공!",
			   text: "Devlomints에 가입하신걸 환영합니다.",
			   icon: "success", //"info,success,warning,error" 중 택1
			   button: "둘러보기",
			})
		 .then((value) => {
		 	$("form").submit();			 
		 });
	 }else{
		 swal({
			   title: "가입실패",
			   text: "입력값을  다시 확인해주세요.",
			   icon: "warning", //"info,success,warning,error" 중 택1
			   button: "돌아가기",
			})
		 return false;
	 }
  });
 </script>
</body>
</html>