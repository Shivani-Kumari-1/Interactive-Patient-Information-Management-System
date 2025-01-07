CREATE TABLE tbl_Sdetail
(sid varchar(4) constraint sd_id_PK primary key,
sname varchar(20) constraint sd_nm_nn not null,
smobile number(10) constraint sd_mob_nn not null,
deptid char(6) references tbl_DepartmentDetail(deptid) not null,
servicenm varchar(28) default null,
simg varchar(50) constraint sd_img_nn not null);           
            