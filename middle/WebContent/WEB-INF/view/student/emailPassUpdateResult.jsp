<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
<%
	int success = (int)request.getAttribute("passSuccess");
	String pass = (String)request.getAttribute("stuPass");
	if(success == 1) {
%>
		alert("비밀번호가 변경되었습니다.");
		location.href = "<%=request.getContextPath()%>/student/passwordUpdate.do?pwd=<%=pass%>";
<%
	}else {
%>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
<%
	}
%>
</script>