<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

	});//end ready
</script>

<form>
	<div class="TodoApp">
		<div class="container">
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th colspan="2">이름</th>
							<th colspan="2">상품수량</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><img src="images/DA-0001.png" width="50" height="50"></td>
							<td>슬라이스 치즈</td>
							<td>20</td>
							<td>
								<button type="button" class="btn btn-light">+</button>
								<button type="button" class="btn btn-light">-</button>
							</td>
							<td><button type="button" class="btn btn-outline-warning">삭제</button></td>
						</tr>
					</tbody>

				</table>
			</div>
			<div class="btn btn-success m-5" id="deleteAll">새 아이템 추가</div>
		</div>
	</div>
</form>
<div>
<h3> 임시 데이터입니다. </h3>
</div>