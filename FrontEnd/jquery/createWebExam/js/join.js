var chk = [false,false,false,false,false,false];
$(function(){
    $(".step img").addClass("img");
    $(".step>div:first>*").addClass("step-sel");
    $("#allagree").click(function(){
        $("input[name^=agree]").prop("checked",$(this).prop("checked"));
    });
    $(".btnbox>input[type=button]").click(function(){
        if($("input[name^=agree]").eq(0).prop("checked") && $("input[name^=agree]").eq(1).prop("checked")){
            $(".content-agree").hide();
            $(".content-info").show();
            $(".step span").parent().children().toggleClass("step-sel");
        }else{
            alert("필수 항목에 모두 동의해주세요.");
        }
    });
    $("#id").focusout(function(){
        $(this).parent().next().html("");
        var reg = /^[a-z][a-z0-9_-]{1,}@[a-z\d\.-]+\.[a-z]{3,6}$/;
        if(reg.test($(this).val())){
            chk[0] = true;
        }else{
            chk[0] = false;
            $(this).parent().next().html("Email 형식으로 입력하세요.");
        }
    });
    $("#pw").focusout(function(){
        $(this).parent().next().html("");
        var reg = /^[a-zA-Z0-9]{8,12}$/;
        if(reg.test($(this).val())){
            chk[1] = true;
        }else{
            chk[1] = false;
            $(this).parent().next().html("영문 대/소문자,숫자 8~12자");
        }
    });
    $("#pwRe").focusout(function(){
        $(this).parent().next().html("");
        if($(this).val() == $("#pw").val()){
            chk[2] = true;
        }else{
            chk[2] = false;
            $(this).parent().next().html("비밀번호가 일치하지 않습니다.");
        }
    });
    $("#name").focusout(function(){
        $(this).parent().next().html("");
        var reg = /^[가-힣]{2,4}$/;
        if(reg.test($(this).val())){
            chk[3] = true;
        }else{
            chk[3] = false;
            $(this).parent().next().html("한글 2~4자로 입력하세요.");
        }
    });
    $("#phone").focusout(function(){
        $(this).parent().next().html("");
        var reg = /^[010]{3}[0-9]{3,4}[0-9]{4}$/;
        if(reg.test($(this).val())){
            chk[4] = true;
        }else{
            chk[4] = false;
            $(this).parent().next().html("숫자만 입력하세요. (01012345678)");
        }
    });
    $("#birth").focusout(function(){
        $(this).parent().next().html("");
        var reg = /^\d{8}$/;
        if(reg.test($(this).val())){
            chk[5] = true;
        }else{
            chk[5] = false;
            $(this).parent().next().html("8자리를 입력하세요.");
        }
    });
});
function chkVal(){
    if(!(chk[0]&&chk[1]&&chk[2]&&chk[3]&&chk[4]&&chk[5])){
        alert("입력 정보를 확인하세요.");
        return false;
    }
}