CREATE SCHEMA `quanlykhohang` ;
USE `quanlykhohang` ;
CREATE TABLE `quanlykhohang`.`vattu` (
  `ID` INT NOT NULL,
  `MAVT` INT NULL,
  `TENVATTU` VARCHAR(45) NULL,
  `ĐVT` VARCHAR(45) NULL,
  `GIAVT` DOUBLE NULL,
  PRIMARY KEY (`ID`));
CREATE TABLE `quanlykhohang`.`tonkho` (
  `ID` INT NOT NULL,
  `VATTU_ID` INT NULL,
  `SOLUONG_DAU` DOUBLE NULL,
  `TONGSL_NHAP` DOUBLE NULL,
  `TONGSL_XUAT` DOUBLE NULL,
  `SOLUONG_CUOI` DOUBLE NULL,
  PRIMARY KEY (`ID`),
    CONSTRAINT `fk_vattu_idTonkho_idVattu`
    FOREIGN KEY (`VATTU_ID`)
    REFERENCES `quanlykhohang`.`vattu` (`ID`));
    CREATE TABLE `quanlykhohang`.`nhacungcap` (
  `ID` INT NOT NULL,
  `MANHA_CC` INT NULL,
  `TENNHA_CC` VARCHAR(45) NULL,
  `DIACHI` VARCHAR(45) NULL,
  `SODT` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));
CREATE TABLE `quanlykhohang`.`dondathang` (
  `ID` INT NOT NULL,
  `MADON` INT NULL,
  `NgayDatHang` DATE NULL,
  `NhaCC_id` INT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Nhacc_idDondathang_idNhaCC`
    FOREIGN KEY (`NhaCC_id`)
    REFERENCES `quanlykhohang`.`nhacungcap` (`ID`));
    CREATE TABLE `quanlykhohang`.`phieunhap` (
  `id` INT NOT NULL,
  `SoPhieuNhap` INT NULL,
  `NgayNhap` DATE NULL,
  `DonHang_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Donhangid_idDondathang`
    FOREIGN KEY (`DonHang_id`)
    REFERENCES `quanlykhohang`.`dondathang` (`ID`));
    CREATE TABLE `quanlykhohang`.`phieuxuat` (
  `id` INT NOT NULL,
  `NgayXuat` DATE NULL,
  `TenKhachHang` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
CREATE TABLE `quanlykhohang`.`ctdonhang` (
  `id` INT NOT NULL,
  `Donhang_id` INT NULL,
  `Vattu_id` INT NULL,
  `SoluongDat` DOUBLE NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Donhang_idCTDH_idDonHang`
    FOREIGN KEY (`Donhang_id`)
    REFERENCES `quanlykhohang`.`dondathang` (`ID`),
     CONSTRAINT `fk_Vattu_idCTDH_idVattu`
    FOREIGN KEY (`Vattu_id`)
    REFERENCES `quanlykhohang`.`vattu` (`ID`));
    CREATE TABLE `quanlykhohang`.`ctphieunhap` (
  `id` INT NOT NULL,
  `PhieuNhap_id` INT NULL,
  `Vattu_id` INT NULL,
  `SoLuongNhap` DOUBLE NULL,
  `DonGiaNhap` DOUBLE NULL,
  `GhiChu` VARCHAR(145) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_PhieunhapID_idPhieuNhap`
    FOREIGN KEY (`PhieuNhap_id`)
    REFERENCES `quanlykhohang`.`phieunhap` (`id`),
  CONSTRAINT `fk_Vattuid_idVattu`
    FOREIGN KEY (`Vattu_id`)
    REFERENCES `quanlykhohang`.`vattu` (`ID`));
    CREATE TABLE `quanlykhohang`.`ctphieuxuat` (
  `id` INT NOT NULL,
  `PhieuXuat_id` INT NULL,
  `Vattu_id` INT NULL,
  `SoLuongXuat` DOUBLE NULL,
  `DonGiaXuat` DOUBLE NULL,
  `GhiChu` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_PhieuXuatID_IDPhieuXuat`
    FOREIGN KEY (`PhieuXuat_id`)
    REFERENCES `quanlykhohang`.`phieuxuat` (`id`),
  CONSTRAINT `fk_VattuID2_IDVattu`
    FOREIGN KEY (`Vattu_id`)
    REFERENCES `quanlykhohang`.`vattu` (`ID`));

-- 5 vật tư
INSERT INTO `quanlykhohang`.`vattu` (`ID`, `MAVT`, `TENVATTU`, `ĐVT`, `GIAVT`) VALUES ('1', '241', 'Banh1', 'thung', '150000');
INSERT INTO `quanlykhohang`.`vattu` (`ID`, `MAVT`, `TENVATTU`, `ĐVT`, `GIAVT`) VALUES ('2', '242', 'Banh2', 'thung', '200000');
INSERT INTO `quanlykhohang`.`vattu` (`ID`, `MAVT`, `TENVATTU`, `ĐVT`, `GIAVT`) VALUES ('3', '243', 'Banh3', 'thung', '120000');
INSERT INTO `quanlykhohang`.`vattu` (`ID`, `MAVT`, `TENVATTU`, `ĐVT`, `GIAVT`) VALUES ('4', '244', 'Keo1', 'thung', '125000');
INSERT INTO `quanlykhohang`.`vattu` (`ID`, `MAVT`, `TENVATTU`, `ĐVT`, `GIAVT`) VALUES ('5', '245', 'Keo2', 'thung', '160000');

-- 10 tồn kho

-- 3 nhà cung cấp
INSERT INTO `quanlykhohang`.`nhacungcap` (`ID`, `MANHA_CC`, `TENNHA_CC`, `DIACHI`, `SODT`) VALUES ('1', '241', 'CTy Banh keo Hue', 'Hue', '0234123456');
INSERT INTO `quanlykhohang`.`nhacungcap` (`ID`, `MANHA_CC`, `TENNHA_CC`, `DIACHI`, `SODT`) VALUES ('2', '242', 'Cty Banh keo Da Nang', 'Da Nang', '02344123456');
INSERT INTO `quanlykhohang`.`nhacungcap` (`ID`, `MANHA_CC`, `TENNHA_CC`, `DIACHI`, `SODT`) VALUES ('3', '243', 'Cty Banh keo Quang Binh', 'Quang Binh', '02345123456');

-- 3 đơn hàng
INSERT INTO `quanlykhohang`.`dondathang` (`ID`, `MADON`, `NgayDatHang`, `NhaCC_id`) VALUES ('1', '2401', '2024-04-17', '1');
INSERT INTO `quanlykhohang`.`dondathang` (`ID`, `MADON`, `NgayDatHang`, `NhaCC_id`) VALUES ('2', '2402', '2024-04-13', '2');
INSERT INTO `quanlykhohang`.`dondathang` (`ID`, `MADON`, `NgayDatHang`, `NhaCC_id`) VALUES ('3', '2403', '2024-04-15', '3');

-- 3 phiếu nhập
INSERT INTO `quanlykhohang`.`phieunhap` (`id`, `SoPhieuNhap`, `NgayNhap`, `DonHang_id`) VALUES ('1', '20241704', '2024-04-17', '3');
INSERT INTO `quanlykhohang`.`phieunhap` (`id`, `SoPhieuNhap`, `NgayNhap`, `DonHang_id`) VALUES ('2', '20241504', '2024-04-15', '2');
INSERT INTO `quanlykhohang`.`phieunhap` (`id`, `SoPhieuNhap`, `NgayNhap`, `DonHang_id`) VALUES ('3', '20241904', '2024-04-19', '1');

-- 3 phiếu xuất
INSERT INTO `quanlykhohang`.`phieuxuat` (`id`, `NgayXuat`, `TenKhachHang`) VALUES ('1', '2024-04-12', 'Khách lẻ ở TP');
INSERT INTO `quanlykhohang`.`phieuxuat` (`id`, `NgayXuat`, `TenKhachHang`) VALUES ('2', '2024-04-15', 'Khách lẻ ở  Huyện');
INSERT INTO `quanlykhohang`.`phieuxuat` (`id`, `NgayXuat`, `TenKhachHang`) VALUES ('3', '2024-04-16', 'Khách lẻ ngoại tỉnh');

-- 6 CT đơn hàng




-- Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: 
-- số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập
create view vw_CTPNHAP as
select p.SoPhieuNhap, v.MAVT, ct.SoLuongNhap, ct.DonGiaNhap,ct.SoLuongNhap*ct.DonGiaNhap as ThanhTien  from ctphieunhap ct 
join phieunhap p on ct.PhieuNhap_id = p.id 
join vattu v on ct.PhieuNhap_id = v.id;
select * from vw_CTPNHAP;


-- Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: 
-- số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT as
select p.SoPhieuNhap, v.MAVT, v.TENVATTU, ct.SoLuongNhap, ct.DonGiaNhap,ct.SoLuongNhap*ct.DonGiaNhap as ThanhTien  from ctphieunhap ct 
join phieunhap p on ct.PhieuNhap_id = p.id 
join vattu v on ct.PhieuNhap_id = v.id;
select * from vw_CTPNHAP_VT;

-- Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: 
-- số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư,
--  số lượng nhập, đơn giá nhập, thành tiền nhập

create view vw_CTPNHAP_VT_PN as
select p.SoPhieuNhap, p.NgayNhap, p.DonHang_id, v.MAVT, v.TENVATTU, 
ct.SoLuongNhap, ct.DonGiaNhap,ct.SoLuongNhap*ct.DonGiaNhap as ThanhTien  from ctphieunhap ct 
join phieunhap p on ct.PhieuNhap_id = p.id 
join vattu v on ct.PhieuNhap_id = v.id;
select * from vw_CTPNHAP_VT_PN;

-- Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: 
-- số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư,
-- số lượng nhập, đơn giá nhập, thành tiền nhập.
  create view vw_CTPNHAP_VT_PN_DH  as
select p.SoPhieuNhap, p.NgayNhap, p.DonHang_id, ncc.MANHA_CC, v.MAVT, v.TENVATTU,
 ct.SoLuongNhap, ct.DonGiaNhap,ct.SoLuongNhap*ct.DonGiaNhap as ThanhTien  
 from ctphieunhap ct 
join phieunhap p on ct.PhieuNhap_id = p.id 
join vattu v on ct.PhieuNhap_id = v.id
join nhacungcap ncc on d.NhaCC_id = ncc.id
join phieunhap p  on d.id = p.DonHang_id;
select * from vw_CTPNHAP_VT_PN_DH;