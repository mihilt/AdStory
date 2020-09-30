<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String memberId = (String)request.getParameter("memberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기 - 패스워드변경</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<script>
$(function(){
    $("#password_chk").blur(passwordValidate);
});

function passwordValidate(){
    var pwd_new = $("#password_new").val().trim();
    var pwd_chk = $("#password_chk").val().trim();
    
    if(pwd_new!=pwd_chk){
        alert("입력한 비밀번호가 일치하지 않습니다.");
        $("#password_new").select();
        return false;
    }
    
    return true;    
}
</script>


<link rel="icon"
    href="<%=request.getContextPath() %>/images/favicon.ico"
    type="image/x-icon">
<link rel="shortcut icon"
    href="<%=request.getContextPath() %>/images/favicon.ico"
    type="image/x-icon">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
    rel="stylesheet">
<link rel="stylesheet"
    href="<%=request.getContextPath() %>/css/main_style.css" />

</head>
<body>
    <div id="updatePassword-container">
        <form name="updatePwdFrm" action="<%=request.getContextPath()%>/member/changePassword" method="post" >
            <table class = "m-auto my-10">
                <tr>
                    <th class = "text-right px-2">변경할 비밀번호</th>
                    <td>
                        <input class = "border-2"  type="password" name="password_new" id="password_new" required>
                    </td>
                </tr>
                <tr>
                    <th class = "text-right px-2">비밀번호 확인</th>
                    <td>    
                        <input class = "border-2"  type="password" id="password_chk" required><br>
                    </td>
                </tr>
                <tr>
                    <td class = "py-10 text-center" colspan="2">
                        <input class = "text-xs bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 px-6 py-3" type="submit"  value="변경" />&nbsp;
                        <input class = "text-xs bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 px-6 py-3" type="button" onclick="self.close();" value="닫기" />                        
                    </td>
                </tr>
            </table>
            <input type="hidden" name="memberId" value="<%=memberId %>" />
        </form>
    </div>


</body>
</html>