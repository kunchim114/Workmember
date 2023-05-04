<%@ page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="pMgr" class="Survey.PollMgr"/>
<jsp:useBean id="plBean" class="Survey.PollListBean"/>
<jsp:setProperty property="*" name="plBean"/>
<jsp:useBean id="piBean" class="Survey.PollItemBean"/>
<jsp:setProperty property="*" name="piBean"/>
<%
		String sdate = request.getParameter("sdateA");
		String edate = request.getParameter("edateA");
		plBean.setSdate(sdate);
		plBean.setEdate(edate);
		boolean flag = pMgr.insertPoll(plBean,piBean);
		String msg = "설문 추가에 실패 하였습니다.";
		String url = "pollInsert.jsp";
		if(flag){
			msg = "설문이 추가 되었습니다.";
			url = "pollList.jsp";
		}
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>