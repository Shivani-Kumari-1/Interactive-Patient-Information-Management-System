Create User <IPIMSDB> identified by <IPIMSSHIVANI>;
Grant resource, connect to <IPIMSDB>;
Grant dba to <IPIMSDB>;
Conn <IPIMSDB>/<IPIMSSHIVANI>;

CREATE TABLE tbl_DepartmentDetail
(deptid char(6) constraint deptd_PK primary key,
deptname varchar(12) constraint deptd_nm_nnu not null unique);

CREATE TABLE tbl_DrDetail
(deptid char(6) references tbl_DepartmentDetail(deptid) not null,
did varchar(4) constraint dd_id_PK primary key,
dname varchar(20) constraint dd_nm_nn not null,
dmobile number(10) constraint dd_mob_nn not null,
servicenm varchar(28) default null,
dimg varchar(50) constraint dd_img_nn not null);           

CREATE TABLE tbl_Sdetail
(deptid char(6) references tbl_DepartmentDetail(deptid) not null,
sid varchar(4) constraint sd_id_PK primary key,
sname varchar(20) constraint sd_nm_nn not null,
smobile number(10) constraint sd_mob_nn not null,
servicenm varchar(28) default null,
simg varchar(50) constraint sd_img_nn not null);           

CREATE TABLE tbl_DrLogin
(mobile number(10) constraint drlog_PK primary key,
username varchar(20) constraint drlog_nm_nn not null,
password varchar(8) constraint drlog_pw_nn not null);

CREATE TABLE tbl_StLogin
(mobile number(10) constraint stlog_PK primary key,
username varchar(20) constraint stlog_nm_nn not null,
password varchar(8) constraint stlog_pw_nn not null);

CREATE TABLE tbl_PbasicDetail
(pno char(4) constraint pbd_PK primary key,
pname varchar(20) constraint pbd_nm_nn not null,
pfathername varchar(20) constraint pbd_fnm_nn not null,
pdob char(10) constraint pbd_dob_nn not null,
page int  constraint pbd_age_nn_chk check (page>0) not null,
pgen char(1) constraint pbd_gen_nn_chk check (pgen='M' OR pgen='F') not null,
pms char(1) constraint pbd_ms_nn_chk check (pms='M' OR pms='U') not null,
pbloodg char(3) default null,
preligion char(9) default null,
presadd varchar(100) constraint pbd_radd_nn not null,
pperadd varchar(100) constraint pbd_padd_nn not null,
pdoorno int default null,
pstreet varchar(20) constraint pbd_street_nn not null,
ptown varchar(20) default null,
ppo varchar(20) default null,
ptaluk varchar(20) default null,
pdistrict varchar(20) constraint pbd_dist_nn not null,
pstate varchar(20) constraint pbd_state_nn not null,
pcountry char(5) constraint pbd_cou_nn not null,
ppincode number(10) default null,
pmobile number(10) constraint pbd_mob_nn not null,
pallergy varchar(25) default null,
pimg varchar(50) default null,
status char(8) default null,
refno char(4)  default null);

CREATE TABLE tbl_Reference
(refno char(4) constraint ref_PK primary key,
refname varchar(20) constraint ref_nm_nn not null,
refgen char(1) constraint ref_gen_nn_chk check (refgen='M' OR refgen='F') not null,
refadd varchar(100) constraint ref_add_nn not null,
refmobile number(10) constraint ref_mob_nn not null,
refpost varchar(30) constraint ref_post_nn not null);

CREATE TABLE tbl_Appointments
(pno char(4)  not null references tbl_PbasicDetail(pno),
appno char(4) constraint app_no_PK primary key,
adate char(10) constraint app_date not null,
deptid char(6) constraint app_deptid_nn not null,
deptnm varchar(12) constraint app_deptnm_nn not null,
doctorname varchar(20) constraint app_nm_nn not null,
servicenm varchar(28) default null,
afee number(5,2) constraint app_fee_nn not null,
Disease varchar(20) default null,
st1 char(11) constraint app_st_nn not null,
appFixedBy varchar(20) default null,
refno char(4) default null,
status char(8) default null);

CREATE TABLE tbl_Prescription
(pno char(4) not null references tbl_PbasicDetail(pno),
receipt char(4) constraint r_PK primary key,
rdate varchar(30) constraint r_date_nn not null,
name varchar(20) constraint r_nm_nn not null,
dob char(10) constraint r_dob_nn not null,
peradd varchar(100) constraint r_add_nn not null,
Disease varchar(20) constraint r_disease_nn not null,
medicine1 varchar(30) default null,
medicine2 varchar(30) default null,
medicine3 varchar(30) default null,
medicine4 varchar(30) default null,
medicine5 varchar(30) default null,
medicine6 varchar(30) default null,
labtest1 varchar(20) default null,
labtest2 varchar(20) default null,
labtest3 varchar(20) default null,
labtest4 varchar(20) default null,
labtest5 varchar(20) default null,
fee number(5,2)  constraint r_fee_nn not null,
doctorname varchar(20) constraint r_dnm_nn not null,
status varchar(8) default null,
labtest char(1) default null,
refno char(4) default null,
servicenm char(28) default null);

CREATE TABLE tbl_LabTest
(receipt char(4)  not null references tbl_Prescription(receipt),
LabReportNo varchar(4) constraint lab_PK primary key,
ldate varchar(30) default null,
group1 varchar(30) default null,
group2 varchar(30) default null,
group3 varchar(30) default null,
group4 varchar(30) default null,
group5 varchar(30) default null,
labtest1 varchar(20) default null,
labtest2 varchar(20) default null,
labtest3 varchar(20) default null,
labtest4 varchar(20) default null,
labtest5 varchar(20) default null,
charge1 varchar(10) default null,
charge2 varchar(10) default null,
charge3 varchar(10) default null,
charge4 varchar(10) default null,
charge5 varchar(10) default null,
total1 varchar(10) default null,
total2 varchar(10) default null,
total3 varchar(10) default null,
total4 varchar(10) default null,
total5 varchar(10) default null,
result1 varchar(13) default null,
result2 varchar(13) default null,
result3 varchar(13) default null,
result4 varchar(13) default null,
result5 varchar(13) default null,
status varchar(8) default null,
refno char(4) default null);

CREATE TABLE tbl_Decision
(pno char(4) references tbl_Appointments(appno),
receipt char(4) not null references tbl_Prescription(receipt),
UHID char(4) constraint d_no_PK primary key,
doctorname varchar(20) not null,
decision varchar(10) constraint d_decision_nn not null,
ddate varchar(30) constraint d_date_nn not null,
LabReportNo char(4) default null,
refno char(4) default null,
servicenm varchar(28) default null,
deptid char(6) default null);

CREATE TABLE tbl_Registration
(pno char(4) not null references tbl_PbasicDetail(pno),
uhid char(4) not null references tbl_Decision(uhid),
ipd char(4) constraint ipd_PK primary key,
ipddate varchar(23) constraint ipd_date_nn not null,
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
deptid char(6) default null);

CREATE TABLE tbl_WardServices
(pno char(4)  not null references tbl_PbasicDetail(pno),
UHID char(4)  not null references tbl_Decision(UHID),
ipd char(4)  not null references tbl_Registration(ipd),
receiptno char(4) constraint ipd_ward_PK primary key,
Service varchar(28) constraint ward_service_nn not null,
roomtype varchar(19) constraint ward_roomtype_nn not null,
roomno varchar(5) constraint ward_roomno_nn not null,
Ptype varchar(10) constraint ward_ptype_nn not null,
bednumber int constraint ward_bedno_nn not null,
price number(6,2) constraint ward_price_nn not null,
wdatetime varchar(30) constraint ward_wdatetime_nn not null,
status char(5) constraint ward_status_nn not null,
deptid char(6) default null);

CREATE TABLE tbl_Treatment
(pno char(4)  not null references tbl_PbasicDetail(pno),
UHID char(4)  not null references tbl_Decision(UHID),
ipd char(4) not null references tbl_Registration(ipd),
receiptno char(4)  not null references tbl_WardServices(receiptno),
billno char(4) constraint treat_bill_PK primary key,
pnm varchar(20) not null,
pfnm varchar(20) not null,
page int  not null,
psex char(1) not null,
Address varchar(100) not null,
mobile number(10) not null,
service varchar(28) not null,
roomtype varchar(19) not null,
roomno varchar(5) not null,
Ptype varchar(10) not null,
bednumber int not null,
price number(6,2) not null,
admissiondate varchar(30) not null,
LabReportNo char(4) default null ,
refno char(4) default null,
Abill1 char(4) constraint treat_abill1_nn not null,
Adate1 varchar(10) constraint treat_adate1_nn not null,
Aamount1 number(6,2) constraint treat_aamount1_nn not null,
Abill2 char(4) constraint treat_abill2_nn not null,
Adate2 varchar(10) constraint treat_adate2_nn not null,
Aamount2 number(10,2) constraint treat_aamount2_nn not null,
slno char(4) constraint treat_slno_nn not null,
visited_Dr1_nm varchar(20) default null,
dr1_billdate varchar(10) default null,
dr1_charge number(6,2) default null,
dr1_visit_times int default null,
dtotal1 number(10,2) default null,
visited_Dr2_nm varchar(20) default null,
dr2_billdate varchar(10) default null,
dr2_charge number(6,2) default null,
dr2_visit_times int default null,
dtotal2 number(10,2) default null,
Operation_Charge number(10,2) constraint treat_ocharge2_nn not null,
Nurshing_Charge number(6,2) constraint treat_ncharge2_nn not null,
status char(4) constraint treat_status_nn not null);

CREATE TABLE tbl_Dischargebill
(billno char(4)  not null references tbl_Treatment(billno),
dbillno char(4) constraint dbill_PK primary key,
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
status char(5) default null);

