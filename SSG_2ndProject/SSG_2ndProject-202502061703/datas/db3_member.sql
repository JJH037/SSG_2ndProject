use team5;

CREATE TABLE member (
  userid varchar(20) NOT NULL,
  passwd varchar(255) NOT NULL,
  username varchar(20) NOT NULL,
  post varchar(6) NOT NULL,
  addr1 varchar(500) NOT NULL,
  addr2 varchar(500) NOT NULL,
  phone1 varchar(3) NOT NULL,
  phone2 varchar(4) NOT NULL,
  phone3 varchar(4) NOT NULL,
  email1 varchar(20) NOT NULL,
  email2 varchar(20) NOT NULL,
  PRIMARY KEY (userid)
);