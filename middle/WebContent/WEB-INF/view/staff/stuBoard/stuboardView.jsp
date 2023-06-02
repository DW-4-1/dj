<%@page import="kr.or.dw.vo.ReplyVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.dw.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>    
<%
	BoardVO boardVo = (BoardVO) request.getAttribute("boardVo");
	ReplyVO reVo = (ReplyVO) request.getAttribute("reVo");
	DateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");

%>

<script>
	$(function(){
		
		
		$('#contentDelBtn').on('click', function(){
			if(confirm("정말 삭제하시겠습니까?") == true){
				location.href = "<%=request.getContextPath()%>/board/deleteStuContent.do?bd_no=<%=boardVo.getBd_no()%>";
				};
		});
		
	});
</script>


	<div class="card-header">
		<h3><%=boardVo.getBd_title()%></h3>
	</div>

	<div class="card-body p-0">
		<div class="mailbox-read-info">
				<%=boardVo.getStu_name() %>
			<h6>
				<span class="mailbox-read-time float-right"><%=fomatter.format(boardVo.getBd_wdt())%></span>
			</h6>
		</div>

		<div class="mailbox-read-message">
			<p><%=boardVo.getBd_content()%></p>
		</div>
		<div>
			<span><%=reVo.getStaff_name() %></span><input type="text" style="width:60%;">
		</div>
	</div>

	<div class="card-footer">
		<div class="float-right">
			<a type="button"
				href="<%=request.getContextPath()%>/board/stuBoardList.do">목록
			</a>
		</div>
		<hr>

	
	</div>
				
					
<%@ include file="../footer.jsp"%>