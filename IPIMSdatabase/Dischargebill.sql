CREATE TABLE tbl_Dischargebill
(dbillno char(4) constraint dbill_PK primary key,
billno char(4)  not null references tbl_Treatment(billno),
ddate varchar(30) default null,
totalbill number(10,2) default null,
totalpaid  number(10,2) default null,
duesamount  number(10,2) default null,
discount  number(6,2) default null,
netamount  number(10,2) default null,
paidamount number(10,2) constraint paidamtnum_nn not null,
billpreparedby varchar(20) default null,
billptime varchar(15) default null,
paymentmode varchar(15) constraint pmode_nn not null,
dtype char(5) constraint dtype_nn not null,
totaladvance number(10,2) default null,
status char(5) default null
);

