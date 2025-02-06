<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
        $("#stockUp").on("click", function(){
            var stock = Number.parseInt($("#stock").val());
            stock++;
            $("#stock").val(stock);
        });

        $("#stockDown").on("click", function(){
            var stock = Number.parseInt($("#stock").val());
            stock--;
            if (stock < 0) stock = 0;
            $("#stock").val(stock);
        });
	});//end ready
</script>

    <form>
        <div class="TodoApp">
            <div class="container">
                <div>
                    <table class="table align-middle text-center">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>상품명</th>
                                <th>재고 수량</th>
                                <th>삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>
                                    <img src="images/DA-0001.png" width="160" height="160"><br>
                                    슬라이스 치즈
                                </td>
                                <td>
                                    <input type="text" name="stock" id="stock" value="20" style="text-align:right;" size="3">
                                    <br><br>
                                    <button type="button" id="stockUp" class="btn btn-light">+</button>
                                    <button type="button" id="stockDown" class="btn btn-light">-</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-outline-warning">삭제</button>
                                </td>
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