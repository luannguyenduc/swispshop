package com.swispshop.api.employee;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.swispshop.api.admin.TaiKhoanApi;
import com.swispshop.dto.CapNhatDonHangEmployee;
import com.swispshop.dto.SearchDonHangObject;
import com.swispshop.dto.TaiKhoanDTO;
import com.swispshop.entities.ChiTietDonHang;
import com.swispshop.entities.DonHang;
import com.swispshop.entities.NguoiDung;
import com.swispshop.entities.SanPham;
import com.swispshop.service.DonHangService;
import com.swispshop.service.NguoiDungService;

@RestController
@RequestMapping("/api/employee/don-hang")
public class DonHangEmployeeApi {

	@Autowired
	private DonHangService donHangService;

	@Autowired
	private NguoiDungService nguoiDungService;
	long employeeID;
	@GetMapping("/all")
	public Page<DonHang> getDonHangByFilter(@RequestParam(defaultValue = "1") int page, @RequestParam String trangThai,
			@RequestParam String tuNgay, @RequestParam String denNgay, @RequestParam long idEmployee)
			throws ParseException {

		SearchDonHangObject object = new SearchDonHangObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiDon(trangThai);
		object.setTuNgay(tuNgay);

		NguoiDung employee = nguoiDungService.findById(idEmployee);
		
		Page<DonHang> listDonHang = donHangService.findDonHangByEmployee(object, page, 6, employee);
		return listDonHang;
	}

@GetMapping("/listConfirmGuest")
	public Page<DonHang> getDonHangByFilter(@RequestParam(defaultValue = "1") int page,
       @RequestParam String tuNgay, @RequestParam String denNgay, @RequestParam long idEmployee) throws ParseException {
	employeeID = idEmployee;
		SearchDonHangObject object = new SearchDonHangObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiDon("Đang chờ xác nhận khách mua");
		object.setTuNgay(tuNgay);
		Page<DonHang> listDonHang = donHangService.getAllDonHangByFilter(object, page);
		return listDonHang;
	}    

	@GetMapping("/{id}")
	public DonHang getDonHangById(@PathVariable long id) {
		return donHangService.findById(id);
	}

	@PostMapping("/confirmGuest")
	public void phanCongDonHang(@RequestBody CapNhatDonHangEmployee capNhatDonHangEmployee) {
		DonHang donHang = donHangService.findById(capNhatDonHangEmployee.getIdDonHang());
		
		donHang.setEmployee(nguoiDungService.findById(employeeID));
		
		for (ChiTietDonHang chiTiet : donHang.getDanhSachChiTiet()) {
			SanPham sp =chiTiet.getSanPham();
			
			
			for (CapNhatDonHangEmployee.CapNhatChiTietDon chiTietCapNhat : capNhatDonHangEmployee
					.getDanhSachCapNhatChiTietDon()) {
				if (chiTiet.getId() == chiTietCapNhat.getIdChiTiet()) {	
					if(chiTietCapNhat.getSoLuongNhanHang() >chiTiet.getSoLuongDat() ) {	
						/*
						 * System.out.println("So luong yeu cau "+chiTietCapNhat.getSoLuongNhanHang());
						 * System.out.println("So luong dat "+chiTiet.getSoLuongDat());
						 * System.out.println("So luong trong kho "+sp.getSoLuong());
						 */
						if(sp.getSoLuong()<(chiTietCapNhat.getSoLuongNhanHang()-chiTiet.getSoLuongDat())) {
							sp.setSoLuong(0);
						}else
						{sp.setSoLuong(sp.getSoLuong()-(chiTietCapNhat.getSoLuongNhanHang()-chiTiet.getSoLuongDat()));}
					}else if(chiTietCapNhat.getSoLuongNhanHang() <chiTiet.getSoLuongDat() ) {
						sp.setSoLuong(sp.getSoLuong()+(chiTiet.getSoLuongDat()-chiTietCapNhat.getSoLuongNhanHang()));
					}
					chiTiet.setSoLuongNhanHang(chiTietCapNhat.getSoLuongNhanHang());
				}
			}
		}

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			String dateStr = format.format(new Date());
			Date date = format.parse(dateStr);
			donHang.setNgayNhanHang(date);
			donHang.setNgayGiaoHang(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		donHang.setTrangThaiDonHang("Đang giao");

		String ghiChu = capNhatDonHangEmployee.getGhiChuEmployee();

		if (!ghiChu.equals("")) {
			donHang.setGhiChu(capNhatDonHangEmployee.getGhiChuEmployee());
		}
		 donHangService.save(donHang); 
	}
	
	@PostMapping("/update")
	public void capNhatTrangThaiDonHang(@RequestBody CapNhatDonHangEmployee capNhatDonHangEmployee) {
		DonHang donHang = donHangService.findById(capNhatDonHangEmployee.getIdDonHang());

		for (ChiTietDonHang chiTiet : donHang.getDanhSachChiTiet()) {
			SanPham sp =chiTiet.getSanPham();
			for (CapNhatDonHangEmployee.CapNhatChiTietDon chiTietCapNhat : capNhatDonHangEmployee
					.getDanhSachCapNhatChiTietDon()) {
				if (chiTiet.getId() == chiTietCapNhat.getIdChiTiet()) {
					
					if(chiTiet.getSoLuongNhanHang()>chiTietCapNhat.getSoLuongNhanHang()) {
						sp.setSoLuong(sp.getSoLuong()+(chiTiet.getSoLuongNhanHang()-chiTietCapNhat.getSoLuongNhanHang()));
					}
					chiTiet.setSoLuongNhanHang(chiTietCapNhat.getSoLuongNhanHang());
				}
			}
		}

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			String dateStr = format.format(new Date());
			Date date = format.parse(dateStr);
			donHang.setNgayNhanHang(date);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		donHang.setTrangThaiDonHang("Hoàn thành");

		String ghiChu = capNhatDonHangEmployee.getGhiChuEmployee();

		if (!ghiChu.equals("")) {
			donHang.setGhiChu(capNhatDonHangEmployee.getGhiChuEmployee());
		}
		 donHangService.save(donHang); 

	}
	@PostMapping("/cancelConfirm") public void
	  huyDonHangEmployee(@RequestBody CapNhatDonHangEmployee capNhatDonHangEmployee) {
			DonHang donHang = donHangService.findById(capNhatDonHangEmployee.getIdDonHang());
			donHang.setEmployee(nguoiDungService.findById(employeeID));
			for (ChiTietDonHang chiTiet : donHang.getDanhSachChiTiet()) {
				SanPham sp =chiTiet.getSanPham();
				for (CapNhatDonHangEmployee.CapNhatChiTietDon chiTietCapNhat : capNhatDonHangEmployee
						.getDanhSachCapNhatChiTietDon()) {
					if (chiTiet.getId() == chiTietCapNhat.getIdChiTiet()) {
						chiTiet.setSoLuongNhanHang(chiTietCapNhat.getSoLuongNhanHang());
						sp.setSoLuong(sp.getSoLuong()+chiTietCapNhat.getSoLuongNhanHang());
					}
				}
			}

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {

				String dateStr = format.format(new Date());
				Date date = format.parse(dateStr);
				donHang.setNgayNhanHang(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			donHang.setTrangThaiDonHang("Đã bị hủy");

			String ghiChu = capNhatDonHangEmployee.getGhiChuEmployee();

			if (!ghiChu.equals("")) {
				donHang.setGhiChu(capNhatDonHangEmployee.getGhiChuEmployee());
			}
			System.out.println("GHI CHU :"+ghiChu);
			donHangService.save(donHang);

		}
	
	
}
