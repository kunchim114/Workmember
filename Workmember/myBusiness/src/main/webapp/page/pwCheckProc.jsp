<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
String pwd = request.getParameter("pwd");
String url = "pwCheck.jsp";
String msg = "비밀번호가 일치하지 않습니다.";
boolean result = mMgr.loginMember(id, pwd);
if (result) {
	url = "profile.jsp";
%>
<script>
	location.href="<%=url%>";
	</script>
<%
} else {
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>
	";
</script>
<%
}
%>