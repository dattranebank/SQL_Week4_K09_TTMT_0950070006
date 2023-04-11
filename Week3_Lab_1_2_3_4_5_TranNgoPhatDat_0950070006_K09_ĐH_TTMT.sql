﻿/* Trần Ngô Phát Đạt K09 TTMT 0950070006 */
/* Tạo và sử dụng database */
use master 
Create database QLBanHang
Use QLBanHang

/* Tạo các table */
Create table T1_SanPham
(
	MaSanPham nchar(10) not null,
	MaHangSanXuat nchar(10),
	TenSanPham nvarchar(20),
	SoLuong int,
	MauSac nvarchar(20),
	GiaBan money,
	DonViTinh nchar(10),
	MoTa nvarchar(max)
)

Create table T2_HangSanXuat
(
	MaHangSanXuat nchar(10) not null,
	TenHang nvarchar(20),
	DiaChi nvarchar(30),
	SoDienThoai nvarchar(20),
	Email nvarchar(30)
)

Create table T3_NhanVien
(
	MaNhanVien nchar(10) not null,
	TenNhanVien nvarchar(20),
	GioiTinh nchar(10),
	DiaChi nvarchar(30),
	SoDienThoai nvarchar(20),
	Email nvarchar(30),
	Phong nvarchar(30)
)

Create table T4_Nhap
(
	SoHoaDonNhap nchar(10) not null,
	MaSanPham nchar(10),
	MaNhanVien nchar(10),
	NgayNhap date,
	SoLuongNhap int,
	DonGiaNhap money
)

Create table T5_Xuat
(
	SoHoaDonXuat nchar(10) not null,
	MaSanPham nchar(10),
	MaNhanVien nchar(10),
	NgayXuat date,
	SoLuongXuat int 
)

/* Tạo Primary Key */
Alter table T1_SanPham
Add Constraint T1_SanPham_PK
Primary key (MaSanPham)

Alter table T2_HangSanXuat
Add Constraint T2_HangSanXuat_PK
Primary key (MaHangSanXuat)

Alter table T3_NhanVien
Add Constraint T3_NhanVien_PK
Primary key (MaNhanVien)

Alter table T4_Nhap
Add Constraint T4_Nhap_PK
Primary key (SoHoaDonNhap)

Alter table T5_Xuat
Add Constraint T5_Xuat_PK
Primary key (SoHoaDonXuat)

/* Tạo Foreign key cho các table */
Alter table T1_SanPham
Add Constraint T1_SanPham_FK
Foreign key (MaHangSanXuat)
References T2_HangSanXuat (MaHangSanXuat)

Alter table T4_Nhap
Add Constraint T4_Nhap_FK
Foreign key (MaSanPham)
References T1_SanPham(MaSanPham)

Alter table T4_Nhap
Add Constraint T4_Nhap_FK_1
Foreign key (MaNhanVien)
References T3_NhanVien(MaNhanVien)

Alter table T5_Xuat
Add Constraint T5_Xuat_FK
Foreign key (MaSanPham)
References T1_SanPham(MaSanPham)

Alter table T5_Xuat
Add Constraint T5_Xuat_FK_1
Foreign key (MaNhanVien)
References T3_NhanVien(MaNhanVien)

/* Thêm dữ liệu */
Insert into T2_HangSanXuat
Values ('H01','Samsung','Korea','011-08271717','ss@gmail.com.kr'),
('H02','OPPO','China','081-08626262','oppo@gmail.com.cn'),
('H03','Vinfone','Viet Nam','084-098262626','vf@gmail.com.vn')

Insert into T3_NhanVien
Values ('NV01','Nguyen Thi Thu','Nu','Ha Noi','0982626521','thu@gmail.com','Ke toan'),
('NV02','Le Van Nam','Nam','Bac Ninh','0972525252','nam@gmail.com','Vat tu'),
('NV03','Tran Hoa Binh','Nu','Ha Noi','0328388388','hb@gmail.com','Ke toan')

Insert into T1_SanPham
Values ('SP01','H02','F1 Plus',100,'Xam',7000000,'Chiec','Hang can cao cap'),
('SP02','H01','Galaxy Note 11',50,'Do',19000000,'Chiec','Hang cao cap'),
('SP03','H02','F3 lite',200,'Nau',3000000,'Chiec','Hang pho thong'),
('SP04','H03','Vjoy3',200,'Xam',1500000,'Chiec','Hang pho thong'),
('SP05','H01','Galaxy V21',500,'Nau',8000000,'Chiec','Hang can cao cap')

Insert into T4_Nhap
Values ('N01','SP02','NV01','2019/02/05',10,17000000),
('N02','SP01','NV02','2020/04/07',30,6000000),
('N03','SP04','NV02','2020/05/17',20,1200000),
('N04','SP01','NV03','2020/03/22',10,6200000),
('N05','SP05','NV01','2020/07/07',20,7000000)

Insert into T5_Xuat
Values ('X01','SP03','NV02','2020/06/14',5),
('X02','SP01','NV03','2019/03/05',3),
('X03','SP02','NV01','2020/12/12',1),
('X04','SP03','NV02','2020/06/02',2),
('X05','SP05','NV01','2020/05/18',1)

/* Truy vấn */
/* Câu 1 */
Select *
From T1_SanPham

Select *
From T2_HangSanXuat

Select *
From T3_NhanVien

Select *
From T4_Nhap

Select *
From T5_Xuat

/* Câu 2 */
Select *
From T1_SanPham
Order by GiaBan DESC

/* Câu 3 */
Select T1_SanPham.MaSanPham, T1_SanPham.MaHangSanXuat, T1_SanPham.TenSanPham, MauSac, GiaBan, DonViTinh
From T1_SanPham, T2_HangSanXuat
Where (T1_SanPham.MaHangSanXuat=T2_HangSanXuat.MaHangSanXuat) 
		and (T2_HangSanXuat.TenHang='Samsung')

/* Câu 4 */
Select *
From T3_NhanVien
Where T3_NhanVien.GioiTinh='Nu' and T3_NhanVien.Phong='Ke toan'

/* Câu 5 */
Select T4.SoHoaDonNhap, T4.MaSanPham, T1.TenSanPham, T2.TenHang, T4.SoLuongNhap, T4.DonGiaNhap, T4.SoLuongNhap * T4.DonGiaNhap as TienNhap,
	T1.MauSac, T1.DonViTinh, T4.NgayNhap, T3.TenNhanVien, T3.Phong
From T4_Nhap T4, T1_SanPham T1, T2_HangSanXuat T2, T3_NhanVien T3
Where T4.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat=T2.MaHangSanXuat and T4.MaNhanVien=T3.MaNhanVien
Order by T4.SoHoaDonNhap ASC

/* Câu 6 */
Select T5.SoHoaDonXuat, T5.MaSanPham, T1.TenSanPham, T2.TenHang, T5.SoLuongXuat, T1.GiaBan, T5.SoLuongXuat * T1.GiaBan as TienXuat,
	T1.MauSac, T1.DonViTinh, T5.NgayXuat, T3.TenNhanVien, T3.Phong
From T5_Xuat T5, T1_SanPham T1, T2_HangSanXuat T2, T3_NhanVien T3
Where T5.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat=T2.MaHangSanXuat and T5.MaNhanVien=T3.MaNhanVien
		and NgayXuat>='2018/10/1' and NgayXuat<='2018/10/31'
Order by T5.SoHoaDonXuat DESC

/* Câu 7 */
Select T4.SoHoaDonNhap, T1.TenSanPham, T4.SoLuongNhap, T4.DonGiaNhap, T4.NgayNhap, T3.TenNhanVien, T3.Phong
From T4_Nhap T4, T1_SanPham T1, T3_NhanVien T3, T2_HangSanXuat T2
Where T4.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat=T2.MaHangSanXuat and T2.TenHang='Samsung' and T4.MaNhanVien=T3.MaNhanVien
	and T4.NgayNhap>='2017/1/1' and T4.NgayNhap<='2017/12/31'

/* Câu 8 */
Select TOP(10) *
From T5_Xuat T5
Where T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31'
Order by T5.SoLuongXuat DESC

/* Câu 9 */
Select TOP(10) *
From T1_SanPham T1
Order by T1.GiaBan DESC

/* Câu 10 */
Select *
From T1_SanPham T1
Where T1.GiaBan>=100000 and T1.GiaBan<=500000

/* Câu 11 */
Select SUM(DonGiaNhap *SoLuongNhap)
From T4_Nhap T4		

/* Câu 12 */
Select SUM(T1.GiaBan*T5.SoLuongXuat)
From T5_Xuat T5, T1_SanPham T1

/* Câu 13 */
Select TOP(1) T4.SoHoaDonNhap, T4.NgayNhap,  T4.DonGiaNhap*T4.SoLuongNhap as TienNhap
From T4_Nhap T4
Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
Order by TienNhap DESC

/* Câu 14 */
Select TOP(10) *
From T4_Nhap T4
Where T4.NgayNhap>='2019/1/1' and T4.NgayNhap<='2019/12/31'
Order by T4.SoLuongNhap DESC

/* Câu 15 */
Select T1.MaSanPham, T1.TenSanPham, T2.TenHang, T4.MaNhanVien
From T1_SanPham T1, T2_HangSanXuat T2,T4_Nhap T4
Where T1.MaHangSanXuat=T2.MaHangSanXuat and T2.TenHang='Samsung' and T4.MaNhanVien='NV01'
	and T1.MaSanPham=T4.MaSanPham

/* Câu 16 */
Select T4.SoHoaDonNhap, T4.MaSanPham, T4.SoLuongNhap, T4.NgayNhap, T5.MaNhanVien
From T1_SanPham T1, T4_Nhap T4, T5_Xuat T5
Where T1.MaSanPham=T4.MaSanPham and T1.MaSanPham='SP02' and T4.MaNhanVien=T5.MaNhanVien
	and T4.MaSanPham=T5.MaSanPham and T5.MaNhanVien='NV02'

/* Câu 17 */
Select T3.MaNhanVien, T3.TenNhanVien
From T5_Xuat T5, T3_NhanVien T3
Where T5.MaSanPham='SP02' and T5.NgayXuat='2020/02/03'

/* Lab 3 Tuần 3 */
/* Câu 1. Hãy thống kê xem mỗi hãng sản xuất có bao nhiêu loại sản phẩm */
Select T2.TenHang, COUNT (*) as 'Số sản phẩm'
From T1_SanPham T1, T2_HangSanXuat T2
Where T1.MaHangSanXuat=T2.MaHangSanXuat
Group by T2.TenHang

/* Câu 2. Hãy thống kê xem tổng tiền nhập của mỗi sản phẩm trong năm 2018 */
Select MaSanPham, SUM(SoLuongNhap*DonGiaNhap) as 'Tổng tiền nhập'
From T4_Nhap
Group by MaSanPham

Select T4.MaSanPham, SUM(SoLuongNhap*DonGiaNhap) as 'Tổng tiền nhập'
From T4_Nhap T4
Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
Group by T4.MaSanPham

/* Câu 3. Hãy thống kê các sản phẩm có tổng số lượng xuất năm 2018 là lớn hơn
10.000 sản phẩm của hãng Samsung */
Select T1.TenSanPham, SUM(T5.SoLuongXuat) as 'Tổng số lượng xuất'
From T1_SanPham T1, T2_HangSanXuat T2, T5_Xuat T5
Where T5.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat = T2.MaHangSanXuat and T2.TenHang='Samsung'
      and T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31' and T5.SoLuongXuat>10000
Group by T1.TenSanPham

/* Câu 4. Thống kê số lượng nhân viên nam của mỗi phòng ban */
Select Phong, count (GioiTinh) as 'Số lượng nhân viên nam'
From T3_NhanVien
Group by Phong,GioiTinh
Having GioiTinh='Nam'

/* Câu 5. Thống kê tổng số lượng nhập của mỗi hãng sản xuất trong năm 2018 */
Select T2.TenHang, SUM(SoLuongNhap) as 'Số lượng nhập'
From T1_SanPham T1, T2_HangSanXuat T2, T4_Nhap T4
Where T4.MaSanPham=T1.MaSanPham and T2.MaHangSanXuat=T1.MaHangSanXuat 
	and T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
Group by T2.TenHang

/* Câu 6. Hãy thống kê xem tổng lượng tiền xuất của mỗi nhân viên trong năm 2018 là bao nhiêu*/
Select T3.TenNhanVien, SUM(T1.GiaBan*T5.SoLuongXuat) as 'Tổng lượng tiền xuất'
From T1_SanPham T1, T5_Xuat T5, T3_NhanVien T3
Where T5.MaNhanVien=T3.MaNhanVien and T1.MaSanPham=T5.MaSanPham
	and T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31'
Group by T3.TenNhanVien

/* Câu 7. Hãy đưa ra tổng tiền nhập của mỗi nhân viên trong tháng 8/2018 có tổng giá trị
lớn hơn 100.000 */
Select T3.TenNhanVien, SUM(T4.SoLuongNhap*T4.DonGiaNhap) as 'Tổng lượng tiền nhập'
From T4_Nhap T4, T3_NhanVien T3
Where T3.MaNhanVien=T4.MaNhanVien
	 and T4.NgayNhap>='2018/8/1' and T4.NgayNhap<='2018/8/31'
Group by T3.TenNhanVien
Having SUM(T4.SoLuongNhap*T4.DonGiaNhap)>100000

/* Câu 8. Hãy đưa ra danh sách các sản phẩm đã nhập nhưng chưa xuất bao giờ */
Select *
From T4_Nhap T4
Where T4.MaSanPham NOT IN (Select T5.MaSanPham From T5_Xuat T5)

/* Câu 9. Hãy đưa ra danh sách các sản phẩm đã nhập năm 2018 và đã xuất năm 2018 */
Select *
From T4_Nhap T4
Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
	  and T4.MaSanPham IN (Select T5.MaSanPham 
						From T5_Xuat T5
						Where T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31')

/* Câu 10. Hãy đưa ra danh sách các nhân viên vừa nhập vừa xuất */
Select DISTINCT (T4.MaNhanVien), T3.TenNhanVien
From T4_Nhap T4, T3_NhanVien T3
Where T4.MaNhanVien IN (Select T5.MaNhanVien
						From T5_Xuat T5)
		and T4.MaNhanVien=T3.MaNhanVien

/* Câu 11. Hãy đưa ra danh sách các nhân viên không tham gia việc nhập và xuất */
Select DISTINCT (T4.MaNhanVien), T3.TenNhanVien
From T4_Nhap T4, T3_NhanVien T3
Where T4.MaNhanVien NOT IN (Select T5.MaNhanVien
						From T5_Xuat T5)
		and T4.MaNhanVien=T3.MaNhanVien


/* Tuần 3 Lab 4: Tạo View */ 
/* Câu 1. View */
Create view C1_View as
	Select T2.TenHang, COUNT (*) as 'Số sản phẩm'
	From T1_SanPham T1, T2_HangSanXuat T2
	Where T1.MaHangSanXuat=T2.MaHangSanXuat
	Group by T2.TenHang

Select *
From C1_View

/* Câu 2. View */
Create view C2_View as
	Select T4.MaSanPham, SUM(SoLuongNhap*DonGiaNhap) as 'Tổng tiền nhập'
	From T4_Nhap T4
	Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
	Group by T4.MaSanPham

Select *
From C2_View

/* Câu 3. View */
Create view C3_View as
	Select T1.TenSanPham, SUM(T5.SoLuongXuat) as 'Tổng số lượng xuất'
	From T1_SanPham T1, T2_HangSanXuat T2, T5_Xuat T5
	Where T5.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat = T2.MaHangSanXuat and T2.TenHang='Samsung'
		  and T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31' and T5.SoLuongXuat>10000
	Group by T1.TenSanPham

Select *
From C3_View

/* Câu 4. View */
Create view C4_View as
	Select Phong, count (GioiTinh) as 'Số lượng nhân viên nam'
	From T3_NhanVien
	Group by Phong,GioiTinh
	Having GioiTinh='Nam'

Select *
From C4_View

/* Câu 5. View */
Create view C5_View as
	Select T2.TenHang, SUM(SoLuongNhap) as 'Số lượng nhập'
	From T1_SanPham T1, T2_HangSanXuat T2, T4_Nhap T4
	Where T4.MaSanPham=T1.MaSanPham and T2.MaHangSanXuat=T1.MaHangSanXuat 
		and T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
	Group by T2.TenHang

Select *
From C5_View

/* Câu 6. View */
Create view C6_View as
	Select T3.TenNhanVien, SUM(T1.GiaBan*T5.SoLuongXuat) as 'Tổng lượng tiền xuất'
	From T1_SanPham T1, T5_Xuat T5, T3_NhanVien T3
	Where T5.MaNhanVien=T3.MaNhanVien and T1.MaSanPham=T5.MaSanPham
		and T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31'
	Group by T3.TenNhanVien

Select *
From C6_View

/* Câu 7. View */
Create view C7_View as
	Select T3.TenNhanVien, SUM(T4.SoLuongNhap*T4.DonGiaNhap) as 'Tổng lượng tiền nhập'
	From T4_Nhap T4, T3_NhanVien T3
	Where T3.MaNhanVien=T4.MaNhanVien
		 and T4.NgayNhap>='2018/8/1' and T4.NgayNhap<='2018/8/31'
	Group by T3.TenNhanVien
	Having SUM(T4.SoLuongNhap*T4.DonGiaNhap)>100000

Select *
From C7_View

/* Câu 8. View */
Create view C8_View as
	Select *
	From T4_Nhap T4
	Where T4.MaSanPham NOT IN (Select T5.MaSanPham From T5_Xuat T5)

Select *
From C8_View

/* Câu 9. View */
Create view C9_View as
	Select *
	From T4_Nhap T4
	Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
		  and T4.MaSanPham IN (Select T5.MaSanPham 
								From T5_Xuat T5
								Where T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31')

Select *
From C9_View

/* Câu 10. View */
Create view C10_View as
	Select DISTINCT (T4.MaNhanVien), T3.TenNhanVien
	From T4_Nhap T4, T3_NhanVien T3
	Where T4.MaNhanVien IN (Select T5.MaNhanVien
							From T5_Xuat T5)
			and T4.MaNhanVien=T3.MaNhanVien

Select *
From C10_View

/* Câu 11. View */
Create view C11_View as
	Select DISTINCT (T4.MaNhanVien), T3.TenNhanVien
	From T4_Nhap T4, T3_NhanVien T3
	Where T4.MaNhanVien NOT IN (Select T5.MaNhanVien From T5_Xuat T5)
		  and T4.MaNhanVien=T3.MaNhanVien

Select *
From C11_View

/* Tuần 3 - Lab 5:Hàm */
/* Câu 1: Hãy xây dựng hàm đưa ra tên hangsx khi nhập vào masp từ bàn phím */
Create function	Cau1_Function (@MaSanPham nvarchar(10))
returns nvarchar(20) as
	begin
		Declare @KetQua nvarchar(20)
		set @KetQua= (Select T2.TenHang
					 From T1_SanPham T1, T2_HangSanXuat T2
				     Where T1.MaHangSanXuat=T2.MaHangSanXuat and T1.MaSanPham=@MaSanPham)
		return @KetQua
	end

Declare @MaSanPham nvarchar(10)
set @MaSanPham='SP01'
Select dbo.Cau1_Function(@MaSanPham) as 'Tên hãng sản xuất'

/* Câu 2: Hãy xây dựng hàm đưa ra tổng giá trị nhập từ năm nhập x đến năm nhập y
với x,y được nhập từ bàn phím */
Drop function Cau2_Function
Create function	Cau2_Function (@x smalldatetime, @y smalldatetime)
returns numeric as
	begin
		Declare @KetQua numeric
		set @KetQua= (Select COALESCE(SUM(SoLuongNhap*DonGiaNhap),0)
					  From T4_Nhap T4
					  Where @x<T4.NgayNhap and T4.NgayNhap<@y)
		return @KetQua
	end

Declare @x smalldatetime
Declare @y smalldatetime
set @x='2015/1/1'
set @y='2016/6/6'
Select dbo.Cau2_Function(@x, @y) as 'Tổng giá trị nhập'

/* Câu 3: Hãy viết hàm thống kê	tổng số lượng thay đổi nhập xuất của tên sản phẩm x trong năm y, 
với x,y được nhập từ bàn phím */
Drop function Cau3_Function
Create function	Cau3_Function(@x nvarchar(20), @y int)
returns int as
	begin
		Declare @TongNhap int
		set @TongNhap= (Select COALESCE(SUM(T4.SoLuongNhap), 0)
						From T1_SanPham T1, T4_Nhap T4
						Where T1.TenSanPham=@x and T1.MaSanPham=T4.MaSanPham and Year(T4.NgayNhap)=@y)

		Declare @TongXuat int
		set @TongXuat= (Select COALESCE(SUM(T5.SoluongXuat), 0)
						From T1_SanPham T1, T5_Xuat T5
						Where T1.TenSanPham=@x and T1.MaSanPham=T5.MaSanPham and Year(T5.NgayXuat)=@y)

		Declare @KetQua int
		set @Ketqua=@TongNhap+@TongXuat
		return @Ketqua
	end

Declare @x nvarchar(20)
Declare @y int
set @x='F1 Plus'
set @y=2021
Select dbo.Cau3_Function(@x, @y) as 'Tổng số lượng thay đổi nhập xuất'

/* Câu 4: Hãy xây dựng hàm đưa ra tổng giá trị nhập từ ngày nhập x đến ngày nhập y,
với x, y được nhập từ bàn phím */
Drop function Cau4_Function
Create function	Cau4_Function (@x smalldatetime, @y smalldatetime)
returns int as
	begin
		Declare @KetQua int
		set @KetQua= (Select COALESCE(SUM(T4.SoLuongNhap),0)
					 From T4_Nhap T4
				     Where @x<T4.NgayNhap and T4.NgayNhap<@y)
		return @KetQua
	end

Declare @x smalldatetime
Declare @y smalldatetime
set @x='2000/1/1'
set @y='2022/1/1'
Select dbo.Cau4_Function(@x, @y) as 'Tổng giá trị nhập'


/* Câu 5: Hãy xây dựng hàm đưa ra tổng giá trị xuất của hãng, tên hãng là A, trong năm tài khóa x,
với A, x được nhập từ bàn phím */
Drop function Cau5_Function
Create function	Cau5_Function (@A nvarchar(20), @x int)
returns numeric as
	begin
		Declare @KetQua numeric
		set @KetQua= (Select COALESCE(SUM(T1.GiaBan*T5.SoLuongXuat),0)
					  From T1_SanPham T1, T2_HangSanXuat T2, T5_Xuat T5
					  Where T2.TenHang=@A and T1.MaSanPham=T5.MaSanPham and T1.MaHangSanXuat=T2.MaHangSanXuat
					  and Year(T5.NgayXuat)=@x)
		return @KetQua
	end

Declare @A nvarchar(20)
Declare @x int
set @A='Samsung'
set @x=2021
Select dbo.Cau5_Function(@A, @x) as 'Tổng giá trị xuất'

/* Câu 6. Hãy xây dựng hàm thống kê số lượng nhân viên mỗi phòng với tên phòng
nhập từ bàn phím */
Drop function Cau6_Function
Create function	Cau6_Function (@TenPhong nvarchar(30))
returns int as
	begin
		Declare @KetQua int
		set @KetQua= (Select COUNT(*)
					  From T3_NhanVien T3
					  Where T3.Phong=@TenPhong
					  Group by T3.Phong)
		return @KetQua
	end

Declare @TenPhong nvarchar(30)
set @TenPhong='Vat tu'
Select dbo.Cau6_Function(@TenPhong) as 'Số nhân viên'

/* Câu 7. Hãy viết hàm thống kê, xem tên sản phẩm x đã xuất được bao nhiêu sản phẩm
trong ngày y với x, y được nhập từ bàn phím */
Drop function Cau7_Function
Create function	Cau7_Function (@x nvarchar(20), @y smalldatetime)
returns int as
	begin
		Declare @KetQua int
		set @KetQua= (Select COALESCE(SUM(T5.SoLuongXuat),0)
					 From T1_SanPham T1, T5_Xuat T5
				     Where T1.MaSanPham=T5.MaSanPham and T1.TenSanPham=@x
	                 and T5.NgayXuat=@y)
		return @KetQua
	end

Declare @x nvarchar(20)
Declare @y smalldatetime
set @x='F1 Plus'
set @y='2019/3/5'
Select dbo.Cau7_Function(@x, @y) as 'Số lượng xuất'

/* Câu 8. Hãy viết hàm trả về số điện thoại của nhân viên đã xuất hóa đơn x, với x được nhập từ bàn phím */
Drop function Cau8_Function
Create function	Cau8_Function (@x nvarchar(10))
returns nvarchar(20) as
	begin
		Declare @KetQua nvarchar(20)
		set @KetQua= (Select T3.SoDienThoai
					  From T3_NhanVien T3, T5_Xuat T5
					  Where T3.MaNhanVien=T5.MaNhanVien and T5.SoHoaDonXuat=@x)
		return @KetQua
	end

Declare @x nvarchar(10)
set @x='X02'
Select dbo.Cau8_Function(@x) as 'Số điện thoại'


/* Câu 9. Hãy viết hàm thống kê tổng số lượng thay đổi nhập xuất của tên sản phẩm x trong năm y,
với x,y được nhập từ bàn phím */
/* Câu 9 trùng câu 3 */

/* Câu 10. Hãy viết hàm thống kê tổng số lượng sản phẩm của hãng x với tên hãng nhập từ bàn phím */
Drop function Cau10_Function
Create function	Cau10_Function (@TenHang nvarchar(20))
returns int as
	begin
		Declare @KetQua int
		set @KetQua= (Select COALESCE(SUM(T1.SoLuong),0)
					 From T1_SanPham T1,T2_HangSanXuat T2
				     Where T1.MaHangSanXuat=T2.MaHangSanXuat and T2.TenHang=@TenHang)
		return @KetQua
	end

Declare @TenHang nvarchar(20)
set @TenHang='Samsung'
Select dbo.Cau10_Function(@TenHang) as 'Tổng số lượng sản phẩm'

/* Tuần 4 Lab 6: Tạo hàm */ 
/* Câu 1. Hãy xây dựng hàm đưa ra thông tin các sản phẩm của hãng có tên nhập từ bàn phím */
Drop function Cau1_Function
Create function Cau1_Function (@TenHangSanXuat nvarchar(20))
returns table as 
		return (Select T1.MaSanPham, T1.TenSanPham, T1.SoLuong, T1.MauSac, T1.GiaBan, T1.DonViTinh, T1.MoTa
				From T1_SanPham T1, T2_HangSanXuat T2
				Where T1.MaHangSanXuat=T2.MaHangSanXuat and T2.TenHang=@TenHangSanXuat)

Select *
From Cau1_Function('Samsung')

/* Câu 2. Hãy viết hàm đưa ra danh sách các sản phẩm và hãng sản xuất tương ứng đã được nhập
từ ngày x đến ngày y với x,y nhập từ bàn phím */
Drop function Cau2_Function
Create function Cau2_Function (@x smalldatetime, @y smalldatetime)
returns table as 
		return (Select T1.MaSanPham, T1.TenSanPham, T2.TenHang, T1.SoLuong, T1.MauSac, T1.GiaBan, T1.DonViTinh, T1.MoTa
				From T1_SanPham T1, T2_HangSanXuat T2, T4_Nhap T4
				Where T1.MaHangSanXuat=T2.MaHangSanXuat and T4.MaSanPham=T1.MaSanPham
				and @x<T4.NgayNhap and T4.NgayNhap<@y)

Select *
From Cau2_Function('2015/1/1','2022/1/1')

/* Câu 3. Hãy xây dựng hàm đưa ra danh sách các sản phẩm theo hãng sản xuất
và 1 lựa chọn, nếu lựa chọn bằng 0 thì đưa ra danh sách các sản phẩm có số lượng bằng 0,
ngược lại lựa chọn bằng 1 thì đưa ra danh sách các sản phẩm có số lượng >0 */
Drop function Cau3_Function
Create function Cau3_Function (@TenHangSanXuat nvarchar(20), @DieuKien tinyint)
returns table as 
	return (Select T1.MaSanPham, T1.TenSanPham, T1.SoLuong, T1.MauSac, T1.GiaBan, T1.DonViTinh, T1.MoTa
			From T1_SanPham T1, T2_HangSanXuat T2
			Where (T1.MaHangSanXuat=T2.MaHangSanXuat and T2.TenHang=@TenHangSanXuat) 
			and ((T1.SoLuong=0 and @DieuKien=0) or (T1.SoLuong>0 and @DieuKien=1)) )

Select *
From Cau3_Function('Samsung',1)

/* Câu 4. */
Drop function Cau4_Function
Create function Cau4_Function (@TenPhong nvarchar(30))
returns table as 
		return (Select T3.MaNhanVien, T3.TenNhanVien
				From T3_NhanVien T3
				Where T3.Phong=@TenPhong)

Select *
From Cau4_Function('Ke toan')

/* Câu 5 */


/* Câu 6 */


/* Câu 7 */
Drop function Cau7_Function
Create function Cau7_Function (@TenHangSanXuat nvarchar(20), @DieuKien tinyint)
returns table as 
	return (Select T1.MaSanPham, T1.TenSanPham, T1.SoLuong, T1.MauSac, T1.GiaBan, T1.DonViTinh, T1.MoTa
			From T1_SanPham T1, T2_HangSanXuat T2, T4_Nhap T4, T5_Xuat T5
			Where (T1.MaHangSanXuat=T2.MaHangSanXuat and T2.TenHang=@TenHangSanXuat) 
			and ((@DieuKien=0 and T1.MaSanPham=T4.MaSanPham) 
			or (@DieuKien=1 and T1.MaSanPham=T5.MaSanPham)) )

Select *
From Cau7_Function('Samsung',0)

Select  *
From T1_SanPham T1, T4_Nhap T4
Where T1 in T4
/* Câu 8 */
Drop function Cau8_Function
Create function Cau8_Function (@x smalldatetime)
returns table as 
		return (Select T3.MaNhanVien, T3.TenNhanVien, T3.GioiTinh, T3.DiaChi, T3.SoDienThoai, T3.Email, T3.Phong
				From T3_NhanVien T3, T4_Nhap T4
				Where T3.MaNhanVien=T4.MaNhanVien and T4.NgayNhap=@x)

Select *
From Cau8_Function('2019/2/5')

/* Câu 9 */
Drop function Cau9_Function
Create function Cau9_Function (@x numeric, @y numeric, @z nvarchar(20))
returns table as 
		return (Select T1.MaSanPham, T1.TenSanPham, T2.TenHang, T1.SoLuong, T1.MauSac, T1.GiaBan, T1.DonViTinh, T1.MoTa
				From T1_SanPham T1, T2_HangSanXuat T2, T4_Nhap T4
				Where T1.MaHangSanXuat=T2.MaHangSanXuat and T4.MaSanPham=T1.MaSanPham
				and @x<T1.GiaBan and T1.GiaBan<@y and T2.TenHang=@z)

Select *
From Cau9_Function(7000000,10000000,'Samsung')

/* Câu 10 */
Drop function Cau10_Function
Create function Cau10_Function()
returns table as 
		return (Select T1.MaSanPham, T1.TenSanPham, T2.TenHang, T1.SoLuong, T1.MauSac, T1.GiaBan, T1.DonViTinh, T1.MoTa
				From T1_SanPham T1, T2_HangSanXuat T2
				Where T1.MaHangSanXuat=T2.MaHangSanXuat)

Select *
From Cau10_Function()
