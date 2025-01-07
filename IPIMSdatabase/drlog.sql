CREATE TABLE tbl_DrLogin
(mobile number(10) constraint drlog_PK primary key,
username varchar(20) constraint drlog_nm_nn not null,
password varchar(8) constraint drlog_pw_nn not null);