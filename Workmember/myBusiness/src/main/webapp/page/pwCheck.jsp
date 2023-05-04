<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.MemberBean, member.MemberMgr, member.SHA256"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>비밀번호확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<form name="checkFrm" method="post" action="pwCheckProc.jsp">
			<table>
				<tr>
					<td>비밀번호 확인 : <input type="password" name="pwd" autofocus> <input
						type="submit" value="확인"></td>
				</tr>
				<tr>
					<td align="center"><br /> <a href="#" onClick="self.close()">닫기</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
