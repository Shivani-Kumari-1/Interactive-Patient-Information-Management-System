CREATE TABLE tbl_Decision
(UHID char(4) constraint d_no_PK primary key,
pno char(4) references tbl_Appointments(appno),
receipt char(4) not null references tbl_Prescription(receipt),
doctorname varchar(20) not null,
decision varchar(10) constraint d_decision_nn not null,
ddate varchar(30) constraint d_date_nn not null,
LabReportNo char(4) default null,
refno char(4) default null,
servicenm varchar(28) default null,
deptid char(6) default null
);