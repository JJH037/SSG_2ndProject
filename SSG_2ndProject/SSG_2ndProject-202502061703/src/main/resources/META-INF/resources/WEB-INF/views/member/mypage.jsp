<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="jakarta.tags.core" %>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<div class="container">
    <form class="row g-3 m-4">
		  <div class="row mb-3">
		    <label for="userid" class="col-sm-2 col-form-label">	아이디</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" id="userid" name="userid" 
		       value="${login.userid}"
		       disabled="disabled">
		    </div>
		  </div>
		
		  <div class="row mb-3">
		    <label for="username" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="username" 
		      id="username"
		       value="${login.username}"
		       disabled="disabled">
		    </div>
		  </div>
		  <hr>
		  <div class="row mb-3">
		      <div class="col-auto">
			    <label for="sample4_postcode" class="visually-hidden">post</label>
			    <input type="text" name="post" 
			           value="${login.post}"
			           class="form-control" id="sample4_postcode" placeholder="우편번호">
			  </div>
			  <div class="col-auto">
			    <button type="button" class="btn btn-primary mb-3" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
  			  </div>
		  </div>
		   <div class="row mb-3">
		      <div class="col-sm-5">
			    <label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
			    <input type="text"  name="addr1"
			           value="${login.addr1}" 
			     class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
			  </div>
			 <div class="col-sm-5">
			    <label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
			    <input type="text" name="addr2" 
			           value="${login.addr2}"
			    class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
			    <span id="guide" style="color:#999"></span>
			  </div>
		  </div>
		  <hr>
		  <div class="row mb-3">
		      <label for="phone1" class="col-sm-2 col-form-label">전화번호</label>
		     <div class="col-auto">
		      <select name="phone1" class="form-control" id="phone1">
			      <option value="010" 
			         
			         <c:if test="${login.phone1 == '010'}">
			            selected
			         </c:if>
			        
			      >010</option>
	             <option value="011" 
	              
	                 <c:if test="${login.phone1 == '011'}">
			            selected
			         </c:if>
	             
	              >011</option>
			 </select>
			   </div>	
			<div class="col-auto">
			  <label for="phone2" class="visually-hidden">전화번호2</label>
			  <input type="text" name="phone2" 
			         value="${login.phone2}"
			  class="form-control" id="phone2">
			</div>
			<div class="col-auto">
			  <label for="phone3" class="visually-hidden">전화번호3</label> 
			  <input type="text" name="phone3" 
			         value="${login.phone3}"
			  class="form-control" id="phone3">
			</div>
		  </div>
		  <div class="row mb-3">
			  <label for="email1" class="col-sm-2 col-form-label">이메일:</label>
		    <div class="col-auto">
			  <input type="text" name="email1" 
			         value="${login.email1}"
			  class="form-control" id="email1">
			</div>
			<div class="col-auto">
			  <label for="xxx" class="visually-hidden">@</label>
			  <span>@</span>
			</div>
			<div class="col-auto">
			  <label for="email2" class="visually-hidden">이메일2</label>
			  <input type="text" name="email2" 
			         value="${login.email2}"
			   class="form-control" id="email2" placeholder="직접입력">
			</div>
		  </div>
		  <div class="col-12">
		    <button type="submit" class="btn btn-primary">update</button>
		    <button type="reset" class="btn btn-primary">cancel</button>
		  </div>
 </form>
	
</div>


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