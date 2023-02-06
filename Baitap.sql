create table KhachHang (
  id int primary key identity(1,1),
  TenKhachHang varchar(255) NOT NULL,
  SoCMT varchar(255) NOT NULL unique,
  DiaChi varchar(255) NOT NULL
);
create table TTLienLac(
  id int primary key identity(1,1),
  SoDT varchar(11) not null unique,
  LoaiThueBao varchar(20),
  NgayDK date not null,
  KhachHang_id int not null foreign key references KhachHang(id)
);


insert into KhachHang(TenKhachHang,SoCMT,DiaChi)
values('Nguyễn Nguyệt Nga','123456789','Hà Nội'),
('Trần Văn An','987654321','Hà Nam'),
('Đinh Văn B','543216789','Hải Dương');
select * from KhachHang;

insert into TTLienLac(SoDT, LoaiThueBao,NgayDK, KhachHang_id)
values('123456789','Trả trước','2002-12-12',1),
('987654321','Trả trước','2003-11-11',2),
('543216789','Trả trước','2004-10-10',3);
select * from TTLienLac;
 -- Câu 5
 -- a
 select * from TTLienLac A
     inner join KhachHang B on A.KhachHang_id = B.id where SoDT like '123456789';
-- b
 select * from KhachHang where SoCMT = '123456789';
 -- c
  select SoDT,SoCMT from TTLienLac A
     inner join KhachHang B on A.KhachHang_id = B.id where SoCMT like '123456789';
-- d 
select * from TTLienLac where NgayDK = '2002-12-12';
-- e
select * from KhachHang where DiaChi = 'Hà Nội';
-- Câu 6 
select count(*) as [Tổng Khách hàng] from KhachHang;

select count(*) as TongTB from TTLienLac where NgayDK = '2002-12-12';
select * from TTLienLac A
    inner join KhachHang B on A.KhachHang_id = B.id;

-- cau 8
-- a
create index TenKhachHang_index on KhachHang(TenKhachHang);
-- b
create view view_KhachHang as select id as KhachHang_id, TenKhachHang, DiaChi from KhachHang;
 
create view view_TTLienLac as
select a.id as KhachHang_id, a.TenKhachHang, b.SoDT
from KhachHang a
inner join TTLienLac b on a.id = b.KhachHang_id;