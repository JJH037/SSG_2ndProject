<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="jakarta.tags.core" %>

<div class="container">
  <div class="row">
  <h1>testtext</h1>
  <c:forEach var="dto" items="${goodsList}">
    
    <div class="col border border-dark m-4 w-80">
    
      <a href="goodsRetrieve?gCode=${dto.gCode}"> 
        <img src="${pageContext.request.contextPath}/images/items/${dto.gImage}.png" width="200">
      </a>
       <div class="mt-4 fs-6">${dto.gName}</div>
       <div class="mt-2 fs-6">${dto.gContent}</div>
       <div class="mt-2 fs-6">${dto.gPrice} 원 </div>

    </div>
  </c:forEach>  

  </div>
</div>
