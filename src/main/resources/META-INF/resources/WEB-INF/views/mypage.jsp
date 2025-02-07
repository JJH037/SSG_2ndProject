<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인홈페이지</title>
<style type="text/css">
    .App {
	  text-align: center;
	  font-size: 16px;
	}
	
    label, input, button {
    margin: 10px;
    padding: 5px;
    }

	footer {
	    bottom: 0;
	    position: absolute;
	    width: 90%;
	    height: 40px;
	}
 </style>
<link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css" >
<script src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</head>
<body>
 <div class="App">
	<jsp:include page="common/top.jsp" flush="true" /><br>
     <div class="container">
        <div class="row">
            <!-- 왼쪽 사이드바 (menu.jsp) -->
            <div class="col-md-2"> 
                <jsp:include page="common/menu.jsp" flush="true" />
            </div>
            <!-- 오른쪽 컨텐츠 (goodsList.jsp) -->
            <div class="col-md-9">
                <jsp:include page="member/mypage.jsp" flush="true" />
            </div>
        </div>
    </div>
 </div>
</body>
</html>