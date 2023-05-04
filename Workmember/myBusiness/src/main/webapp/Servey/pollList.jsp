<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="Survey.*, java.util.*, java.time.LocalDate" %>

<jsp:useBean id="pMgr" class="Survey.PollMgr" />

<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<h2>투표프로그램</h2>
		<hr width="600" />
		<b>설문폼</b>
		<jsp:include page="pollForm.jsp" />
		<hr width="600" />
		<b>설문리스트</b>
		<table>
			<tr>
				<td>
					<table width="500" border="1">
						<tr>
							<td align="center"><b>번호</b></td>
							<td><b>제목</b></td>
							<td><b>시작일~종료일</b></td>
						</tr>
						<%
						LocalDate today = LocalDate.now();
						Vector<PollListBean> vlist = pMgr.getAllList();
						List<PollListBean> list = new ArrayList<PollListBean>(vlist); // Vector를 List로 변환
						Collections.sort(list); // List를 정렬

						int count = list.size();
						for (int i = 0; i < list.size(); i++) {
							PollListBean plBean = list.get(i);
							int num = plBean.getNum();
							String question = plBean.getQuestion();
							String sdate = plBean.getSdate();
							String edate = plBean.getEdate();

							out.println("<tr><td align='center'>" + count + "</td>");
							LocalDate endDate = LocalDate.parse(edate);
							if (today.isBefore(endDate)) {
								out.println("<td>[진행 중]<a href='pollList.jsp?num=" + num + "'>" + question + "</a></td>");
							} else {
								out.println("<td>[종료]" + question + "</td>");
							}
							out.println("<td>" + sdate + " ~ " + edate + "</td></tr>");
							count = count - 1;
						}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="pollInsert.jsp">설문 작성하기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>