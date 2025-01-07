CREATE TABLE tbl_Reference
(refno char(4) constraint ref_PK primary key,
refname varchar(20) constraint ref_nm_nn not null,
refgen char(1) constraint ref_gen_nn_chk check (refgen='M' OR refgen='F') not null,
refadd varchar(100) constraint ref_add_nn not null,
refmobile number(10) constraint ref_mob_nn not null,
refpost varchar(30) constraint ref_post_nn not null
);