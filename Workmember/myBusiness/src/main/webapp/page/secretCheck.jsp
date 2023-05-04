<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bMgr" class="member.BoardMgr" />

<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
int nowPage = Integer.parseInt(request.getParameter("nowPage"));
System.out.println(nowPage);
String secret = bMgr.getSecret(num);
String input = request.getParameter("InputSecret");
if (secret != null && secret.equals(input)) {
	response.sendRedirect("read.jsp?num=" + num + "&nowPage=" + nowPage);
	
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀글 암호체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<form name="checkFrm" method="post" action="secretCheck.jsp?num=<%=num%>&secret=<%=secret%>">
			<table>
				<tr>
					<td>비밀글 암호 : <input type="password" name="InputSecret"
						autofocus> <input type="submit" value="확인"></td>
				</tr>
				<tr>
					<td align="center"><br /> <a href="list.jsp">돌아가기</a></td>
					<td><input type="hidden" name="nowPage" value="<%=nowPage %>"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
