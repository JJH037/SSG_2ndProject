use team5;
drop table cart;
CREATE TABLE cart (
  num int NOT NULL AUTO_INCREMENT,
  userid varchar(20) DEFAULT NULL,
  gCode varchar(20) NOT NULL,
  gAmount int NOT NULL,
  gCartDate date DEFAULT (curdate()),
  PRIMARY KEY (num),
  KEY cart_userid_fk (userid),
  KEY cart_gCode_fk (gCode),
  CONSTRAINT cart_gCode_fk FOREIGN KEY (gCode) REFERENCES goods (gCode) ON DELETE CASCADE,
  CONSTRAINT cart_userid_fk FOREIGN KEY (userid) REFERENCES member (userid) ON DELETE CASCADE
);
use team5;
SELECT * FROM refrigerator;
SELECT * FROM team5.cart;