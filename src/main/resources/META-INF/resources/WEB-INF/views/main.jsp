<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.exam.dto.GoodsDTO" %>

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

    .alert {
        background-color: #ffcccc;
        color: #cc0000;
        padding: 10px;
        border: 1px solid #cc0000;
        margin-bottom: 10px;
    }

    /* 벨 아이콘 스타일 */
    .notification-icon {
        position: fixed;
        top: 20px;
        right: 20px;
        font-size: 30px;
        cursor: pointer;
    }

    .notification-popup {
        display: none;
        position: fixed;
        top: 60px;
        right: 20px;
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
        padding: 15px;
        width: 250px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .notification-popup ul {
        padding-left: 20px;
    }

    .notification-popup ul li {
        margin-bottom: 5px;
    }

    /* 재고가 부족한 상품 강조 */
    .low-stock {
        color: red;
        font-weight: bold;
    }
</style>
<link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
<script src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome (벨 아이콘) -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<script>
    // 벨 아이콘 클릭 시 알림 표시
    function toggleNotification() {
        var popup = document.getElementById("notificationPopup");
        if (popup.style.display === "none" || popup.style.display === "") {
            popup.style.display = "block";
        } else {
            popup.style.display = "none";
        }
    }
</script>
</head>
<body>
 <div class="App">
	<jsp:include page="common/top.jsp" flush="true" /><br>
	
    <!-- 벨 아이콘 -->
    <div class="notification-icon" onclick="toggleNotification()">
        <i class="fas fa-bell"></i> <!-- Font Awesome 벨 아이콘 -->
    </div>

    <!-- 알림 팝업 -->
    <div id="notificationPopup" class="notification-popup">
        <strong>⚠ 재고 부족 알림</strong><br>
        <ul>
            <% 
            // goodsList를 받아와서 알림 표시
            List<GoodsDTO> allItems = (List<GoodsDTO>) request.getAttribute("goodsList");

            if (allItems == null || allItems.isEmpty()) {
            %>
                <li>현재 상품이 없습니다!</li>
            <% 
            } else {
                // 모든 상품을 표시
                for (GoodsDTO goods : allItems) {
                    String lowStockClass = (goods.getStock() <= 10) ? "low-stock" : ""; // 재고가 10개 이하인 경우 강조
            %>
                <li class="<%= lowStockClass %>">
                    <%= goods.getgName() %> (재고: <%= goods.getStock() %>개)
                </li>
            <% 
                }
            }
            %>
        </ul>
    </div>
     <div class="container">
        <div class="row">
            <!-- 왼쪽 사이드바 (menu.jsp) -->
            <div class="col-md-2"> 
                <jsp:include page="common/menu.jsp" flush="true" />
            </div>
            <!-- 오른쪽 컨텐츠 (goodsList.jsp) -->
            <div class="col-md-9">
                <jsp:include page="goods/goodsList.jsp" flush="true" />
            </div>
        </div>
    </div>
 </div>

</body>
</html>
