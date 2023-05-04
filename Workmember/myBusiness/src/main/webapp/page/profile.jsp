<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.MemberBean, member.MemberMgr"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");

MemberMgr memberMgr = new MemberMgr();
MemberBean member = memberMgr.getMember(id); // 로그인한 회원의 정보를 가져옴
String jobname = memberMgr.getJobname(member.getJobcode());
String gender = null;
%>
<html>
<head>
<title>회원정보</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffcc">
	<div align="center">
		<br /> <br />
		<%
		if (member != null) {
		%>
		<b><%=member.getId()%></b>님 환영합니다.
		<p>제한된 기능을 사용할 수 있습니다.</p>
		<table border="1" align="center">
			<tr>
				<td>아이디</td>
				<td><%=member.getId()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<%
				String pw = member.getPwd();
				String mpw = "";
				for (int i = 0; i < 10; i++) {
					mpw += "*";
				}
				%>
				<td><%=mpw%></td>

			</tr>
			<tr>
				<td>닉네임</td>
				<td><%=member.getName()%></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><%=member.getBirthday()%></td>
			</tr>
			<tr>
				<td>성별</td>
				<%
				if (member.getGender().equals("1")) {
					gender = "남자";
				} else
					gender = "여자";
				%>
				<td><%=gender%></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><%=jobname%></td>
			</tr>
			<tr>
				<td>취미</td>
				<%
				String[] hobbyList = { "인터넷", "여행", "게임", "영화", "운동" };
				String[] hobbies = member.getHobby();
				String[] hobby = new String[hobbies.length];
				for (int i = 0; i < hobbies.length; i++) {
					if (hobbies[i] != null && hobbies[i].equals("1")) {
						hobby[i] = hobbyList[i];
					} else {
						hobby[i] = "";
					}
				}
				%>
				<td><%=String.join(" ", hobby)%></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><%=member.getZipcode()%></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=member.getAddress()%></td>
			</tr>
			<tr>
				<td>국적</td>
				<td><%=member.getNational()%></td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td align="center"><a href="logout.jsp">로그아웃</a></td>
				<td align="center"><a href="수정">수정</a></td>
			</tr>
		</table>
		<%
		}
		%>