package com.swispshop.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.data.domain.Page;

import com.swispshop.dto.SearchDonHangObject;
import com.swispshop.entities.DonHang;
import com.swispshop.entities.NguoiDung;

public interface DonHangService {

	Page<DonHang> getAllDonHangByFilter(SearchDonHangObject object, int page) throws ParseException;

	DonHang update(DonHang dh);
	
	DonHang findById(long id);
	
	Page<DonHang> findDonHangByEmployee(SearchDonHangObject object, int page, int size, NguoiDung employee) throws ParseException;

	DonHang save(DonHang dh);
	
	List<Object> layDonHangTheoThangVaNam();

	List<DonHang> findByTrangThaiDonHangAndEmployee(String string, NguoiDung employee);

	
	List<DonHang> getDonHangByNguoiDung(NguoiDung currentUser);
    List<Object> top4DoanhThuSanPhamTheoThang(Integer thang);
	
	List<Object> top4SoLuongSanPhamTheoThang(Integer thang);
    List<Object> top4SoLuongSanPhamCuaNhanVienTheoThang(Integer thang);
	
	List<Object> top4DoanhThuCuaNhanVienTheoThang(Integer thang);
	int countByTrangThaiDonHang(String trangThaiDonHang);
	 List<DonHang> fillAll();
}
