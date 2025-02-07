use team5;

create table goods (
  gCode varchar(20) not null,
  gCategory varchar(20) not null,
  gName varchar(20) not null,
  gContent varchar(4000),
  gPrice int not null,
  gImage varchar(20) not null,
  stock int default(99) not null,
  primary key (gCode)
);

insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("SI-0001", "Side dish", "김치", "새벽팜 묵은지 2kg 3kg 5kg 10kg 국내산 100% 전라도김치 참매실 새벽김치", 14500, "SI-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("SI-0002", "Side dish", "찜닭", "[냉장][강화肉식] 간장 찜닭 700g (350g*2ea)", 14500, "SI-0002");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("SC-0001", "Sauce & condiment", "굴소스", "노브랜드 굴소스 490g", 3580, "SC-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("SC-0002", "Sauce & condiment", "다진마늘", "냉동 다진마늘 400g", 7900, "SC-0002");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("VG-0001", "Vegetable", "양배추", "한끼에 하나씩 양배추 (통)", 3490, "VG-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("VG-0002", "Vegetable", "콩나물", "CJ제일제당 행복한콩 깨끗한콩나물 380g", 1880, "VG-0002");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("FR-0001", "Fruit", "귤", "[당도선별] 하우스감귤 1kg (팩), 국내산", 13900, "FR-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("FR-0002", "Fruit", "토마토", "친환경 토마토(900g/팩)", 7800, "FR-0002");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("MT-0001", "Meat", "닭가슴살", "노브랜드 [냉동] 닭가슴살 (1,000g)", 7980, "MT-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("MT-0002", "Meat", "돼지고기 앞다리살", "[더느림+] 무항생제 앞다리 (100g)", 1880, "MT-0002");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("FS-0001", "Fish & Seafood", "고등어", "노브랜드 [냉동][노르웨이] 손질 고등어 (800g)", 10980, "FS-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("FS-0002", "Fish & Seafood", "낙지", "[냉동][태국] 먹기좋게 손질된 낙지 (500g)", 9980, "FS-0002");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("DA-0001", "Dairy", "슬라이스 치즈", "에이클래스 체다 슬라이스치즈 210g (30g x 7)", 3980, "DA-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("DA-0002", "Dairy", "달걀", "[당일산란/당일발송] 가농 금계란 1+등급 골드 비타민특란 40구(무항생제)", 17800, "DA-0002");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("SN-0001", "Snack", "크림빵", "삼립 정통크림빵 3입 240g", 4180, "SN-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("SN-0002", "Snack", "감자칩", "노브랜드 감자칩 사워크림&어니언 160g", 1480, "SN-0002");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("FZ-0001", "Frozen", "군만두", "노브랜드 군만두 1000g", 4980, "FZ-0001");
insert into goods (gCode, gCategory, gName, gContent, gPrice, gImage) values ("FZ-0002", "Frozen", "감자튀김", "피코크 케이준프라이 700g", 8980, "FZ-0002");
USE team5;

INSERT INTO goods (gCode, gCategory, gName, gContent, gPrice, gImage) 
VALUES ("DA-0003", "Dairy", "슬라이스 치즈2", "에이클래스 체다 슬라이스치즈 210g (30g x 7)", 3980, "DA-0001");
commit;