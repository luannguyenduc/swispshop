package com.swispshop.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.swispshop.entities.QDonHang;
import com.swispshop.dto.SearchDonHangObject;
import com.swispshop.entities.DonHang;
import com.swispshop.entities.NguoiDung;
import com.swispshop.repository.DonHangRepository;
import com.swispshop.service.DonHangService;
import com.querydsl.core.BooleanBuilder;

@Service
public class DonHangServiceImpl implements DonHangService {

	@Autowired
	private DonHangRepository donHangRepo;

	@Override
	public Page<DonHang> getAllDonHangByFilter(SearchDonHangObject object, int page) throws ParseException {
		BooleanBuilder builder = new BooleanBuilder();

		String trangThaiDon = object.getTrangThaiDon();
		String tuNgay = object.getTuNgay();
		String denNgay = object.getDenNgay();
		SimpleDateFormat formatDate = new SimpleDateFormat("dd-MM-yyyy");

		if (!trangThaiDon.equals("")) {
			builder.and(QDonHang.donHang.trangThaiDonHang.eq(trangThaiDon));
		}

		if (!tuNgay.equals("") && tuNgay != null) {
			if (trangThaiDon.equals("") || trangThaiDon.equals("Đang chờ xác nhận khách mua") || trangThaiDon.equals("Đã hủy")) {
				builder.and(QDonHang.donHang.ngayDatHang.goe(formatDate.parse(tuNgay)));
			} else if (trangThaiDon.equals("Đang giao")) {
				builder.and(QDonHang.donHang.ngayNhanHang.goe(formatDate.parse(tuNgay)));
			} else { // hoàn thành
				builder.and(QDonHang.donHang.ngayNhanHang.goe(formatDate.parse(tuNgay)));
			}
		}

		if (!denNgay.equals("") && denNgay != null) {
			if (trangThaiDon.equals("") || trangThaiDon.equals("Đang chờ xác nhận khách mua") || trangThaiDon.equals("Đã hủy")) {
				builder.and(QDonHang.donHang.ngayDatHang.loe(formatDate.parse(denNgay)));
			} else if (trangThaiDon.equals("Đang giao")) {
				builder.and(QDonHang.donHang.ngayNhanHang.loe(formatDate.parse(denNgay)));
			} else { // hoàn thành
				builder.and(QDonHang.donHang.ngayNhanHang.loe(formatDate.parse(denNgay)));
			}
		}

		return donHangRepo.findAll(builder, PageRequest.of(page - 1, 6));
	}

	@Override
	public DonHang update(DonHang dh) {
		return donHangRepo.save(dh);
	}

	@Override
	public DonHang findById(long id) {
		return donHangRepo.findById(id).get();
	}

	@Override
	public List<DonHang> findByTrangThaiDonHangAndEmployee(String trangThai, NguoiDung employee) {
		return donHangRepo.findByTrangThaiDonHangAndEmployee(trangThai, employee);
	}

	@Override
	public DonHang save(DonHang dh) {
		return donHangRepo.save(dh);
	}

	@Override
	public List<Object> layDonHangTheoThangVaNam() {
		return donHangRepo.layDonHangTheoThangVaNam();
	}
	
	@Override
	public List<DonHang> getDonHangByNguoiDung(NguoiDung ng) {
		return donHangRepo.findByNguoiDat(ng);
	}

	@Override
	public Page<DonHang> findDonHangByEmployee(SearchDonHangObject object, int page, int size, NguoiDung employee) throws ParseException {
		BooleanBuilder builder = new BooleanBuilder();

		String trangThaiDon = object.getTrangThaiDon();
		String tuNgay = object.getTuNgay();
		String denNgay = object.getDenNgay();
		SimpleDateFormat formatDate = new SimpleDateFormat("dd-MM-yyyy");
		
		builder.and(QDonHang.donHang.employee.eq(employee));

		if (!trangThaiDon.equals("")) {
			builder.and(QDonHang.donHang.trangThaiDonHang.eq(trangThaiDon));
		}

		if (!tuNgay.equals("") && tuNgay != null) {
			if (trangThaiDon.equals("Đang giao")) {
				builder.and(QDonHang.donHang.ngayGiaoHang.goe(formatDate.parse(tuNgay)));
			} else { // hoàn thành
				builder.and(QDonHang.donHang.ngayNhanHang.goe(formatDate.parse(tuNgay)));
			}
		}

		if (!denNgay.equals("") && denNgay != null) {
			if (trangThaiDon.equals("Đang giao")) {
				builder.and(QDonHang.donHang.ngayGiaoHang.loe(formatDate.parse(denNgay)));
			} else { // hoàn thành
				builder.and(QDonHang.donHang.ngayNhanHang.loe(formatDate.parse(denNgay)));
			}
		}

		return donHangRepo.findAll(builder, PageRequest.of(page - 1, size));
	}

	@Override
	public int countByTrangThaiDonHang(String trangThaiDonHang) {
		return donHangRepo.countByTrangThaiDonHang(trangThaiDonHang);
	}

	@Override
	public List<DonHang> fillAll() {
		
		return donHangRepo.findAll();
	}
	//
	@Override
	public List<Object> top4DoanhThuSanPhamTheoThang(Integer thang) {
		// TODO Auto-generated method stub
		if (thang == null) {
			LocalDate date = LocalDate.now();
			thang = date.getMonthValue();
		}
		return donHangRepo.top4DoanhThuSanPhamTheoThang(thang);
	}

	@Override
	public List<Object> top4SoLuongSanPhamTheoThang(Integer thang) {
		// TODO Auto-generated method stub
		if (thang == null) {
			LocalDate date = LocalDate.now();
			thang = date.getMonthValue();
		}
		return donHangRepo.top4SoLuongSanPhamTheoThang(thang);
	}
	@Override
	public List<Object> top4SoLuongSanPhamCuaNhanVienTheoThang(Integer thang) {
		// TODO Auto-generated method stub
		if (thang == null) {
			LocalDate date = LocalDate.now();
			thang = date.getMonthValue();
		}
		return donHangRepo.top4SoLuongSanPhamCuaNhanVienTheoThang(thang);
	}

	@Override
	public List<Object> top4DoanhThuCuaNhanVienTheoThang(Integer thang) {
		// TODO Auto-generated method stub
		if (thang == null) {
			LocalDate date = LocalDate.now();
			thang = date.getMonthValue();
		}
		return donHangRepo.top4DoanhThuCuaNhanVienTheoThang(thang);
	}

}
