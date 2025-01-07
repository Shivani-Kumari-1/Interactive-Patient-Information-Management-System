CREATE TABLE tbl_Registration
(ipd char(4) constraint ipd_PK primary key,
uhid char(4) not null references tbl_Decision(uhid),
ipddate varchar(23) constraint ipd_date_nn not null,
pno char(4) not null references tbl_PbasicDetail(pno),
pnm varchar(20) not null,
pfnm varchar(20) not null,
age int not null,
sex char(1)  not null,
pperadd varchar(100) not null,
mobile number(10) not null,
receipt char(4) not null,
status char(5) default null,
refno char(4) default null,
LabReportNo char(4) default null,
RegFee number(5,2) not null,
servicenm varchar(28) default null,
deptid char(6) default null
);