create table NHACUNGCAP(
   MaNhaCC varchar(30) primary key ,
   TenNhaCC varchar(255) not null,
   DiaCHi text not null,
   SoDT varchar(11) not null unique,
   MaSoThue int not null
);
create table LOAIDICHVU(
  MaLoaiDV varchar(30) primary key ,
  Tenloaidichvu text not null
);
create table DONGXE(
   DongXe varchar(30) primary key,
   Hangxe text not null,
   SoChoNgoi int not null check(Sochongoi >1)
);
create table MUCPHI(
   MaMucPhi varchar(30) primary key,
   DonGia decimal(12,4) not null check(DonGia >= 0),
   MoTa varchar(255)
);
create table DANGKYCUNGCAP(
   MaDKCC varchar(30) primary key,
   NHACUNGCAP_MaNhaCC varchar(30) not null foreign key references NHACUNGCAP(MaNhaCC),
   LOAIDICHVU_MaloaiDV varchar(30) not null foreign key references LOAIDICHVU(MaLoaiDV),
   DONGXE_DongXe varchar(30) not null foreign key references DONGXE(DongXe),
   MUCPHI_MaMucPhi varchar(30) not null foreign key references MUCPHI(MaMucPhi),
   Ngaybatdaucungcap datetime not null check (Ngaybatdaucungcap <= getdate()),
   Ngayketthuccungcap datetime not null check (Ngayketthuccungcap <= getdate()),
   Soluongxedangky varchar(20) not null
);

insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaCHi,SoDT,MaSoThue)
values ('NCC001','Cty TNHH Toàn Pháp','Hai Chau','05113999888','568941'),
('NCC002','Cty Cổ phần Đông Du','Lien Chieu','05113999889','568942'),
('NCC003','Ông Nguyễn Văn An','Hoa Thuan','05113999890','568943'),
('NCC004','Cty Cổ phần toàn cầu xanh','Thanh Khe','05113999891','568944'),
(   'NCC005','Cty TNHH AMA','Thanh Khe','05113999892','568945'),
('NCC006','Bà Trần Thị Bích Vân','Lieu Chieu','05113999893','568946'),
('NCC007','Cty TNHH Phan Thành','Thanh Khe','05113999894','568947'),
('NCC008','Ông Phan Đình Nam','Hoa Thuan','05113999895','568948'),
('NCC009','Tập đoàn Đông Nam Á ','Lien Chieu','05113999896','568949'),
('NCC010','Cty Cổ phần Rạng Đông','Lien Chieu','05113999897','568950');

select * from NHACUNGCAP;

insert into LOAIDICHVU(MaLoaiDV,Tenloaidichvu)
values ('DV01','Dịch Vụ Xe taxi'),
('DV02','Dịch Vụ Xe buýt công cộng theo tuyến cố định'),
('DV03','Dịch Vụ Xe cho thuê theo hợp đồng');

select * from LOAIDICHVU;

insert into DONGXE(DongXe,Hangxe,SoChoNgoi)
values ('Hiace','Toyota','16'),
('Vios','Toyota','5'),
('Escape','Ford','5'),
('Cerato','KIA','7'),
('Forte','KIA','5'),
('Starex','Huyndai','7'),
('Grand-i10','Huyndai','7');

select * from DongXe where SoChoNgoi > 5;

insert into MUCPHI(MaMucPhi,DonGia,MoTa)
values ('MP01','10.000','Áp dụng từ 1/2015'),
('MP02','15.000','Áp dụng từ 2/2015'),
('MP03','20.000','Áp dụng từ 1/2010'),
('MP04','25.000','Áp dụng từ 2/2011');

select * from MUCPHI;

insert into  DANGKYCUNGCAP(MaDKCC,NHACUNGCAP_MaNhaCC,LOAIDICHVU_MaloaiDV,DONGXE_DongXe,MUCPHI_MaMucPhi,
Ngaybatdaucungcap,Ngayketthuccungcap,Soluongxedangky)

values ('DK001','NCC001','DV01','Hiace','MP01','2015-11-20','2016-11-20','4'),
('DK002','NCC002','DV02','Vios','MP02','2015-11-20','2017-11-20','3'),
('DK003','NCC003','DV03','Escape','MP03','2017-11-20','2018-11-20','5'),
('DK004','NCC005','DV01','Cerato','MP04','2015-11-20','2019-11-20','7'),
('DK005','NCC002','DV02','Forte','MP03','2019-11-20','2020-11-20','1'),
('DK006','NCC004','DV03','Starex','MP04','2016-11-10','2021-11-2','2'),
('DK007','NCC005','DV01','Cerato','MP03','2015-11-30','2016-1-25','8'),
('DK008','NCC006','DV01','Vios','MP02','2016-02-28','2016-8-15','9'),
('DK009','NCC005','DV03','Grand-i10','MP02','2016-04-27','2017-04-30','10'),
('DK010','NCC006','DV01','Forte','MP02','2015-11-21','2016-02-22','4'),
('DK011','NCC007','DV01','Forte','MP01','2016-12-25','2017-02-20','5'),
('DK012','NCC007','DV03','Cerato','MP01','2016-04-14','2017-12-20','6'),
('DK013','NCC003','DV02','Cerato','MP01','2015-12-21','2016-12-21','8'),
('DK014','NCC008','DV02','Cerato','MP01','2016-05-20','2016-12-30','1'),
('DK015','NCC003','DV01','Hiace','MP02','2018-04-24','2019-11-20','6'),
('DK016','NCC001','DV03','Grand-i10','MP02','2016-06-22','2016-12-21','8'),
('DK017','NCC002','DV03','Cerato','MP03','2016-09-30','2019-9-30','4'),
('DK018','NCC008','DV03','Escape','MP04','2017-12-13','2018-09-30','2'),
('DK019','NCC003','DV03','Escape','MP03','2016-01-24','2016-12-30','8'),
('DK020','NCC002','DV03','Cerato','MP04','2016-05-03','2017-10-21','7'),
('DK021','NCC006','DV01','Forte','MP02','2015-01-30','2016-12-30','9'),
('DK022','NCC002','DV02','Cerato','MP04','2016-05-25','2017-12-30','6'),
('DK023','NCC002','DV01','Forte','MP03','2017-11-30','2018-05-20','5'),
('DK024','NCC003','DV03','Forte','MP04','2017-12-23','2019-12-30','8'),
('DK025','NCC003','DV03','Hiace','MP02','2016-06-24','2017-12-25','1')
;

select * from DANGKYCUNGCAP;
-- b3 
select * from DONGXE where SoChoNgoi >5;

--b4
select * from DANGKYCUNGCAP where MaNhaCC in 
( select Nqq
