## 상품 데이터
---
[상세설명](https://www.notion.so/191ca1bab44880aa945fd5df39f7fa27)

db1_refrigerator.sql
- 냉장고에 들어 있는 식재료를 저장한 테이블
- code, category, name, stock

db2_goods.sql
- 쇼핑몰에서 판매하고 있는 상품들이 저장된 테이블
- code, category, name, content, price, image

db3_member.sql
- 쇼핑몰 이용자 정보가 저장된 테이블
- userid, passwd, username, post, addr1, addr2, phone1, phone2, phone3, email1, email2

db4_cart.sql
- 쇼핑몰 이용자가 장바구니에 담은 상품을 저장한 테이블
- num, userid, code, amount, cartDate
