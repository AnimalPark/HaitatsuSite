<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>안녕하세요</title>
<style type="text/css">
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
a:hover {text-d"WebContent/board/eventboard.jsp"ecoration: underline; color: red;}
body {
        color: #333;
        background: #fafafa;
        font-family: "Patua One", sans-serif;
    }
    .contact-form {
        padding: 20px;
        margin: 15px 0;
    }
    .contact-form h1 {
        color: #6dc97e;
        font-weight: bold;
        margin: 0 0 5px;
    }
    .contact-form .form-control, .contact-form .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .contact-form .form-control:focus {
        border-color: #6dc97e;
    }
    .contact-form .btn-primary {
        color: #fff;
        min-width: 150px;
        font-size: 16px;
        background: #6dc97e;
        border: none;
    }
    .contact-form .btn-primary:hover {
        background: #15a487; 
    }
    .contact-form label {
        opacity: 0.7;
    }
    .contact-form textarea {
        resize: none;
    }
    .hint-text {
        font-size: 15px;
        padding-bottom: 20px;
        opacity: 0.6;
    }
.container input[readonly] {background-color: white !important;}
.container textarea[readonly] {background-color: white !important;}    
</style>
<script type="text/javascript">
function delchk(){
		return confirm("글 삭제시 복구가 불가능합니다.");
}
</script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="index.jsp">
	 <img src="image/Haitatsu.jpg" alt="Haitatsu" style="width:100px;">
	</a>
  <ul class="navbar-nav">
    <li class="nav">
   	 <a class="nav-link" href="ybbs_eventList?reqPage=1">이벤트게시판 </a>
    </li>
    <c:if test="${users == null}">
	    <li class="nav1">
	    	<a class="nav-link" href="login_link">로그인</a>
	    </li>
    </c:if>
    <c:if test="${users != null}">
		<li class="nav1">
	    	<a class="nav-link" href=user_logout>로그아웃</a>
	    </li>
	</c:if>
  </ul>
</nav>
	<c:if test="${ybbs.userid == users.userId || users.authority eq 1}">
	 <div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 m-auto">
            <div class="contact-form">
                    <div class="container">
                    <h1>이벤트 게시글</h1><br/>
                    <form action="ybbs_goTo_update" method="post" style="display:inline;">
                       <input type="hidden" name ="qanumber" value="${ybbs.qanumber}">
                       <div class="form-group">
                                <label for="inputName">작성자</label>
                                <input type="text" class="form-control" id="inputName" name="userid"  value="${ybbs.userid}" readonly  style="width:30%"/>        
                       </div>
                    <div class="form-group">
                        <label for="inputSubject">제목</label>
                        <input type="text" class="form-control" id="inputSubject" name="qasubject" value="${ybbs.qasubject}" readonly  />
                    </div>
                    <div class="form-group">
                        <label for="inputMessage">내용</label>
                        <textarea class="form-control" id="inputMessage" name="qacomment" rows="10" style="width:100%"  readonly>${ybbs.qacomment}</textarea>
                    </div>
                    <button class="btn btn-primary" style="margin:4px">수정하러가기</button>
                    </form>
					<a href="ybbs_delete?qanumber=${ybbs.qanumber}" onclick="return delchk();"><button class="btn btn-primary" style="margin:4px">글 삭제하기</button></a>	
					<a href="ybbs_req_list?reqPage=1"><button class="btn btn-primary" style="margin:4px">뒤로가기</button></a>	
          	       	<c:if test="${users.authority eq 1}">
          	       	<br/>
						<a href="ybbs_reply_form.ad?qanumber=${ybbs.qanumber}"><button class="btn btn-primary" style="margin:4px">답변 작성</button></a>
					</c:if>		
          	       	  </div>
          	       		 </div>
          	      			  </div>
          	      	 			 </div>
          	      			 		 </div>
			  <button type="submit" class="btn btn-primary" style="margin:4px">글 수정</button>
			<a href="ybbs_delete?qanumber=${ybbs.qanumber}" onclick="return delchk();"><button class="btn btn-primary" style="margin:4px">글 삭제</button></a>
			<a href="ybbs_req_list?reqPage=1"><button class="btn btn-primary" style="margin:4px">목록으로</button></a>	
	</c:if>
	<c:if test="${ybbs.userid != users.userId && ybbs_id != users.userId && users.authority != 1}">
			<div>글 작성자만 읽을 수 있습니다</div>
			<a href = "ybbs_req_list?reqPage=1"><button class="btn btn-primary" style="margin:4px">목록으로</button></a>
		</c:if>
	<c:if test="${ybbs_id == users.userId && ybbs.userid != users.userId }">
	 <div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 m-auto">
            <div class="contact-form">
                    <div class="container">
                    <h1>QA 게시글</h1><br/>
                       <div class="form-group">
                                <label for="inputName">작성자</label>
                                <input type="text" class="form-control" id="inputName" name="userId"  value="${ybbs.userid}" readonly  style="width:30%"/>        
                       </div>
                    <div class="form-group">
                        <label for="inputSubject">제목</label>
                        <input type="text" class="form-control" id="inputSubject" name="qasubject" value="${ybbs.qasubject}" readonly  />
                    </div>
                    <div class="form-group">
                        <label for="inputMessage">내용</label>
                        <textarea class="form-control" id="inputMessage" name="qacomment" rows="10" style="width:100%"  readonly>${ybbs.qacomment}</textarea>
                    </div>
                    <a href="ybbs_goTo_update?qanumber=${ybbs.qanumber}"><button class="btn btn-primary" style="margin:4px">수정하러가기</button></a>
					<a href="ybbs_delete?qanumber=${ybbs.qanumber}" onclick="return delchk();"><button class="btn btn-primary" style="margin:4px">글 삭제하기</button></a>	
					<a href="ybbs_req_list?reqPage=1"><button class="btn btn-primary" style="margin:4px">뒤로가기</button></a>	
          	        </div>
          	        </div>
          	        </div>
          	        </div>
          	        </div>
			<a href="ybbs_req_list?reqPage=1"><button class="btn btn-primary" style="margin:4px">목록으로</button></a>
	</c:if>
</body>
</html>