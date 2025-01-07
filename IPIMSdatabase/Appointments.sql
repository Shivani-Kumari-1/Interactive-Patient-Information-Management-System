CREATE TABLE tbl_Appointments
(appno char(4) constraint app_no_PK primary key,
adate char(10) constraint app_date not null,
deptid char(6) constraint app_deptid_nn not null,
deptnm varchar(12) constraint app_deptnm_nn not null,
doctorname varchar(20) constraint app_nm_nn not null,
servicenm varchar(28) default null,
afee number(5,2) constraint app_fee_nn not null,
pno char(4)  not null references tbl_PbasicDetail(pno),
Disease varchar(20) default null,
st1 char(11) constraint app_st_nn not null,
appFixedBy varchar(20) default null,
refno char(4) default null,
status char(8) default null
);