<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
a:hover {text-decoration: underline; color: red;}
p{
	vertical-aline:top; 
	text-aline:left;	
}

</style>
</head>
<body>
<div>
<a href="index.jsp"><img alt="로고" src="image/Haitatsu.jpg"></a>
  <ul class="nav justify-content-end">
    <li class="nav-item">
      <a class="nav-link" href="ybbs_eventList?reqPage=1">이벤트게시판</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">로그인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">로그아웃</a>
    </li>
  </ul>
</div>
<br />
	<table class="table table-hover">
	 <tbody>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회</th>
		</tr>
	</tbody>
		<c:forEach var="ybbsList" items="${ybbsList}">
			<tr>
				<td>${ybbsList.qanumber}</td>
				<c:if test="${ybbsList.qalevel eq 0}">
					<td><a href="ybbs_detail?qanumber=${ybbsList.qanumber}">${ybbsList.qasubject}</a></td>
				</c:if>
				<c:if test="${ybbsList.qalevel eq 1}">
					<td><a href="ybbs_detail?qanumber=${ybbsList.qanumber}">└&nbsp;${ybbsList.qasubject}</a></td>
				</c:if>
				<td>${ybbsList.userid}</td>
				<td>${ybbsList.qadate}</td>
				<td>${ybbsList.qavisited}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="ybbs_go_to_insert">글쓰기러 가기</a>
	
	
<div class="container">
  <ul class="pagination">
    <c:if test="${pageGroupResult.beforePage}">
    	<li class="page-item disabled">
    		<a class="page-link" href="ybbs_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">Previous</a>
    	</li>
    </c:if>
  	<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
		<c:choose>	
			<c:when test="${pageGroupResult.selectPageNumber==index}"> 
   				 <li class="page-item"><a class="page-link" href="ybbs_req_list?reqPage=${index}">${index}</a></li>
    		</c:when>
			<c:otherwise>
				    <li class="page-item"><a class="page-link" href="ybbs_req_list?reqPage=${index}">${index}</a></li>
			</c:otherwise>		 
 		 </c:choose>
		</c:forEach>
	 <c:if test="${pageGroupResult.afterPage}">
	 <li class="page-item"><a class="page-link" href="ybbs_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">Next</a></li>
	</c:if>
	</ul>
</div>
</body>
</html>