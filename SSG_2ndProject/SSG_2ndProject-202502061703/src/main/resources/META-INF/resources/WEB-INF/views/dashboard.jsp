<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 대시보드</title>
    <style>
        .alert {
            background-color: #ffcccc;
            color: #cc0000;
            padding: 10px;
            border: 1px solid #cc0000;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h2>관리자 대시보드 name의 재고가 부족합니다! 장바구니에 추가하시겠습니까?</h2>
 
    <%
        List<String> lowStockItems = (List<String>) session.getAttribute("lowStockItems");
        if (lowStockItems != null && !lowStockItems.isEmpty()) {
    %>
        <div class="alert">
            <strong>⚠ 재고 부족 알림</strong><br>
            <ul>
                <% for (String item : lowStockItems) { %>
                    <li><%= item %>의 재고가 부족합니다!</li>
                <% } %>
            </ul>
        </div>
    <%
        }
    %>

    <p>환영합니다, <%= session.getAttribute("user") %> 님!</p>
    <a href="logout.jsp">로그아웃</a>
</body>
</html>