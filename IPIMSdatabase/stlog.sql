CREATE TABLE tbl_StLogin
(mobile number(10) constraint stlog_PK primary key,
username varchar(20) constraint stlog_nm_nn not null,
password varchar(8) constraint stlog_pw_nn not null);