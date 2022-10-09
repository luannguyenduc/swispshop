package com.swispshop.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.swispshop.dto.SanPhamDto;
import com.swispshop.service.DanhMucService;

@Component
public class SanPhamDtoValidator implements Validator{
	
	@Autowired
	private DanhMucService dmService;

	@Override
	public boolean supports(Class<?> clazz) {
		return SanPhamDto.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		SanPhamDto s = (SanPhamDto) target;
		
		ValidationUtils.rejectIfEmpty(errors, "tenSanPham", "error.tenSanPham", "Tên sản phẩm không được trống");
		ValidationUtils.rejectIfEmpty(errors, "donGia", "error.donGia", "Đơn giá không được trống");
		ValidationUtils.rejectIfEmpty(errors, "soLuong", "error.soLuong", "Số lượng không được trống");
		ValidationUtils.rejectIfEmpty(errors, "thongTinBaoHanh", "error.thongTinBaoHanh", "Thông tin bảo hành không được trống");
		ValidationUtils.rejectIfEmpty(errors, "thongTinChung", "error.thongTinChung", "Thông tin chung không được trống");
		ValidationUtils.rejectIfEmpty(errors, "mauSac", "error.mauSac", "Chất men không được trống");
		ValidationUtils.rejectIfEmpty(errors, "chatLieu", "error.chatLieu", "Chất liệu không được trống");
		ValidationUtils.rejectIfEmpty(errors, "thietKe", "error.thietKe", "Họa tiết không được trống");
		ValidationUtils.rejectIfEmpty(errors, "kichThuoc", "error.kichThuoc", "Kích thước không được trống");
		if(Integer.parseInt(s.getDonGia()) < 0) {
			errors.rejectValue("donGia", "error.donGia", "Đơn giá không được âm");
		}
		
		if(Integer.parseInt(s.getSoLuong()) < 0) {
			errors.rejectValue("soLuong", "error.soLuong", "Số lượng không được âm");
		}
		String tenDanhMuc = dmService.getDanhMucById(s.getDanhMucId()).getTenDanhMuc().toLowerCase();
		
		if(tenDanhMuc.contains("Laptop".toLowerCase())) {
			ValidationUtils.rejectIfEmpty(errors, "mauSac", "error.manHinh", "Màu sắc không được trống");
			ValidationUtils.rejectIfEmpty(errors, "thietKe", "error.thietKe", "Thiết kế không được trống");
			ValidationUtils.rejectIfEmpty(errors, "kichThuoc", "error.dungLuongPin", "Kích thước  được trống");			
		}
		
	}

}
