CREATE TABLE tbl_DepartmentDetail
(deptid char(6) constraint deptd_PK primary key,
deptname varchar(12) constraint deptd_nm_nnu not null unique);