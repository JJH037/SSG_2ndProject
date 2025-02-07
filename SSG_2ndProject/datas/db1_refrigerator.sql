use team5;

create table refrigerator (
	gCode varchar(20),
	gCategory varchar(20) not null,
	gName varchar(20) not null,
	rStock int default(1) not null,
	primary key (gCode)
);

insert into refrigerator (gCode, gCategory, gName, rStock) values ("SI-0001", "Side dish", "김치", 1);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("SI-0002", "Side dish", "찜닭", 1);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("SC-0001", "Sauce & condiment", "굴소스", 1);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("SC-0002", "Sauce & condiment", "다진마늘", 1);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("VG-0001", "Vegetable", "양배추", 1);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("FR-0001", "Fruit", "귤", 10);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("MT-0001", "Meat", "닭가슴살", 4);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("MT-0002", "Meat", "돼지고기 앞다리살", 2);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("FS-0001", "Fish & Seafood", "고등어", 1);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("DA-0001", "Dairy", "슬라이스 치즈", 20);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("DA-0002", "Diary", "달걀", 5);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("SN-0001", "Snack", "크림빵", 1);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("FZ-0001", "Frozen", "군만두", 2);
insert into refrigerator (gCode, gCategory, gName, rStock) values ("FZ-0002", "Frozen", "감자튀김", 1);

commit;
