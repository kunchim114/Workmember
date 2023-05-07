<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.BoardBean"%>
<%@ page import="member.BoardMgr"%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<%
	request.setCharacterEncoding("UTF-8");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardBean bean = (BoardBean) session.getAttribute("bean");

	if (bean.getSecret().isEmpty()) {
		BoardMgr bMgr = new BoardMgr();
		bMgr.deleteData(num);
		response.sendRedirect("list.jsp?nowPage=" + nowPage);
	} else {
		String inSecret = request.getParameter("secret");

		if (inSecret != null && inSecret.equals(bean.getSecret())) {
			BoardMgr bMgr = new BoardMgr();
			bMgr.deleteData(num);
			response.sendRedirect("list.jsp?nowPage=" + nowPage);
		} else {
	%>
	<div align="center">
		<br /> <br />
		<table width="600" cellpadding="3">
			<tr>
				<td bgcolor=#dddddd height="21" align="center">삭제하면 되돌릴 수 없습니다.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="delete.jsp">
			<table width="600" cellpadding="2">
				<tr>
					<td align="center">
						<table>
							<tr>
								<td align="center"><input type="password" name="secret"
									size="17" maxlength="15"></td>
							</tr>
							<tr>
								<td><hr size="1" color="#eeeeee" /></td>
							</tr>
							<tr>
								<td align="center"><input type="button" value="삭제"
									onClick="document.delFrm.submit();"> <input
									type="button" value="뒤로" onClick="history.go(-1)"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
				type="hidden" name="num" value="<%=num%>"> 
		</form>
	</div>
	<%
	}
	}

	// Close the JSP page
	%>
</body>
</html>
