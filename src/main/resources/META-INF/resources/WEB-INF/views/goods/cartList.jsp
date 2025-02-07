<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		$("#allCheck").on("click", function() {

			var allCheck = this.checked;

			$(".check").each(function(idx, ele) {
				console.log(idx, ele);
				this.checked = allCheck;
			});
		});

		//전체삭제 버튼 이벤트
		$("#deleteAll").on("click", function() {
			//event.preventDefault();

			var f = $("form")[0];
			f.action = "cartDeleteAll";
			f.method = "GET";
			f.submit(); // 서브밋 실행  <inpu type="button">는 명시적으로 submit() 호출
			// <button> 와 <input type="submit">는 자동으로 submit 됨.
		});

	});//end ready
</script>

<form>
	<div class="TodoApp">
		<div class="container">
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>전체삭제 &nbsp; <input type="checkbox" name="allCheck"
								id="allCheck"></th>
							<th>번호</th>
							<th>상품이미지</th>
							<th>상품정보</th>
							<th>상품가격</th>
							<th>상품수량</th>
							<th>합계</th>
							<th>날짜</th>
							<th>Delete</th>
							<th>주문</th>
						</tr>
					</thead>
					<tbody>
						<!--  반복시작 -->
						<c:set var="sum" value="0" />
						<c:forEach var="cartDTO" items="${cartList}">
							<c:set var="sum"
								value="${cartDTO.goodsList[0].gPrice * cartDTO.gAmount + sum}" />
							<tr>
								<td><input type="checkbox" name="check" class="check"
									value="${cartDTO.num}"></td>
								<td>${cartDTO.num}</td>
								<td><img
									src="images/items/${cartDTO.goodsList[0].gImage}.png"
									width="50" height="50"></td>
								<td>${cartDTO.gCode}&nbsp;&nbsp;${cartDTO.gSize}&nbsp;/&nbsp;${cartDTO.gColor}</td>
								<td>${cartDTO.goodsList[0].gPrice}</td>
								<td>${cartDTO.gAmount}</td>
								<td>${cartDTO.goodsList[0].gPrice * cartDTO.gAmount    }</td>
								<td>${cartDTO.gCartDate}</td>
								<td><a href="cartDelete?num=${cartDTO.num}"
									class="btn btn-warning">Delete</a></td>
								<td><a href="orderConfirm?num=${cartDTO.num}"
									class="btn btn-success">주문</a></td>
							</tr>
						</c:forEach>
						<!--  반복끝 -->
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td colspan="3">총합: &nbsp; ${sum}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn btn-success m-5" id="deleteAll">전체삭제</div>
		</div>
	</div>
</form>