<%@page contentType="application; charset=UTF-8"%>
<jsp:useBean id="bMgr" class="member.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>