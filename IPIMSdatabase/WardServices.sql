CREATE TABLE tbl_WardServices
(receiptno char(4) constraint ipd_ward_PK primary key,
ipd char(4)  not null references tbl_Registration(ipd),
UHID char(4)  not null references tbl_Decision(UHID),
pno char(4)  not null references tbl_PbasicDetail(pno),
Service varchar(28) constraint ward_service_nn not null,
roomtype varchar(19) constraint ward_roomtype_nn not null,
roomno varchar(5) constraint ward_roomno_nn not null,
Ptype varchar(10) constraint ward_ptype_nn not null,
bednumber int constraint ward_bedno_nn not null,
price number(6,2) constraint ward_price_nn not null,
wdatetime varchar(30) constraint ward_wdatetime_nn not null,
status char(5) constraint ward_status_nn not null,
deptid char(6) default null
);

