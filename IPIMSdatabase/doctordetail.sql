CREATE TABLE tbl_DrDetail
(did varchar(4) constraint dd_id_PK primary key,
dname varchar(20) constraint dd_nm_nn not null,
dmobile number(10) constraint dd_mob_nn not null,
deptid char(6) references tbl_DepartmentDetail(deptid) not null,
servicenm varchar(28) default null,
dimg varchar(50) constraint dd_img_nn not null);           
            