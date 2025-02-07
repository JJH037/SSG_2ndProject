<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
>>.${cDTO}<br>
>>.${mDTO}<br>
<form name="myForm" >
	 <div class="container">
	       <div class="row mb-3">
		    <label class="col-sm-2 col-form-label fs-4">주문 상품 확인</label>
		  </div> 
		  <hr>
            <div>
                <table class="table">
                    <thead>
                            <tr>
                                <th>번호</th>
                                <th>상품이미지</th>
                                <th>상품정보</th>
                                <th>상품가격</th>
                                <th>상품수량</th>
                                <th>합계</th>
                                <th>날짜</th>
                            </tr>
                    </thead>
                    <tbody>
						 <tr>
					                <td>${cDTO.num}</td> 
                                    <td><img src="images/items/${cDTO.goodsList[0].gImage}.png" width="50" height="50" ></td>
                                    <td>${cDTO.gCode}&nbsp;/&nbsp;${cDTO.gSize}&nbsp;/&nbsp;${cDTO.gColor}</td>
                                    <td>${cDTO.goodsList[0].gPrice}</td>
                                    <td>${cDTO.gAmount}</td>
                                    <td>${cDTO.gAmount * cDTO.goodsList[0].gPrice }</td>
                                    <td>${cDTO.gCartDate}</td>
						</tr>
                    </tbody>
                  </table>
         </div>
          <div class="mb-10">
          </div>
          <div class="row mb-3">
		    <label class="col-sm-2 col-form-label fs-4">고객 정보</label>
		  </div> 
		  <hr>
		  <div class="row mb-3">
		    <label for="username" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="username" id="mname" value="${mDTO.username}">
		    </div>
		  </div>

		  <div class="row mb-3">
			    <label for="sample4_postcode" class="col-sm-2 col-form-label">우편번호</label>
		      <div class="col-auto">
			    <input type="text" name="post" class="form-control" value="${mDTO.post}" id="mpost" placeholder="우편번호">
			  </div>
		  </div>
		   <div class="row mb-3">
			    <label for="sample4_roadAddress" class="col-sm-2 col-form-label">주소</label>
		      <div class="col-sm-5">
			    <input type="text"  name="addr1" class="form-control" value="${mDTO.addr1}" id="maddress1" placeholder="도로명주소">
			  </div>
		  </div>
		  <div class="row mb-3">
		    <label for="sample4_jibunAddress" class="col-sm-2 col-form-label"></label>
		    <div class="col-sm-5">
		      <input type="text" name="addr2" class="form-control" value="${mDTO.addr2}" id="maddress2" placeholder="지번주소">
		      <span id="guide" style="color:#999"></span>
		    </div>
		  </div>
	
		  <div class="row mb-3">
		      <label for="phone1" class="col-sm-2 col-form-label">전화번호</label>
		     <div class="col-auto">
		    	  <input type="text" name="phone" class="form-control" id="mphone" value="${mDTO.phone1}${mDTO.phone2}${mDTO.phone3}">
			 </div>	
        </div>
      </div> 
       <hr>
       <div class="mt-20">
          
       </div> 
        <!--  배송지 정보 -->
       <div class="container">
          <div class="row mb-3">
            <div class="col-auto">
		      <input type="checkbox" name="same_address" id="same_address"> 배송지가 동일할 경우 선택하세요.
		    </div>
          </div>
          <div class="row mb-3">
		    <label class="col-sm-2 col-form-label fs-4">배송지 정보</label>
		  </div> 
		  <div class="row mb-3">
		    <label for="username" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="username" id="orderName">
		    </div>
		  </div>
		  <hr>
		  <div class="row mb-3">
		      <div class="col-auto">
			    <label for="sample4_postcode" class="visually-hidden">post</label>
			    <input type="text" name="post" class="form-control" id="sample4_postcode" placeholder="우편번호">
			  </div>
			  <div class="col-auto">
			    <button type="button" class="btn btn-primary mb-3" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
  			  </div>
		  </div>
		   <div class="row mb-3">
		      <div class="col-sm-5">
			    <label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
			    <input type="text"  name="addr1" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
			  </div>
			 <div class="col-sm-5">
			    <label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
			    <input type="text" name="addr2" class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
			    <span id="guide" style="color:#999"></span>
			  </div>
		  </div>
		  <hr>
		   <div class="row mb-3">
		      <label for="phone1" class="col-sm-2 col-form-label">전화번호</label>
		     <div class="col-auto">
		    	  <input type="text" name="phone" class="form-control" id="phone" >
			 </div>	
          </div>
          <div class="col-12">
		    <button type="submit" class="btn btn-primary">결제</button>
		    <button type="reset" class="btn btn-primary">취소</button>
		  </div>
      </div>
</form>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<!-- 다음주소 끝 -->