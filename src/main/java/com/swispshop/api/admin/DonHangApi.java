package com.swispshop.api.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.swispshop.dto.SearchDonHangObject;
import com.swispshop.entities.ChiTietDonHang;
import com.swispshop.entities.DonHang;
import com.swispshop.entities.SanPham;
import com.swispshop.service.DonHangService;
import com.swispshop.service.NguoiDungService;
@CrossOrigin("*")
@RestController
@RequestMapping("/api/don-hang")
public class DonHangApi {

	@Autowired
	private DonHangService donHangService;

	@Autowired
	private NguoiDungService nguoiDungService;

	// lấy danh sách đơn hàng theo search object
	@GetMapping("/all")
	public Page<DonHang> getDonHangByFilter(@RequestParam(defaultValue = "1") int page,
			@RequestParam String trangThai,
			@RequestParam String tuNgay,
			@RequestParam String denNgay) throws ParseException {

		SearchDonHangObject object = new SearchDonHangObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiDon(trangThai);
		object.setTuNgay(tuNgay);
		Page<DonHang> listDonHang = donHangService.getAllDonHangByFilter(object, page);
		return listDonHang;
	}

	@GetMapping("/{id}")
	public DonHang getDonHangById(@PathVariable long id) {
		return donHangService.findById(id);
	}

	// phân công đơn hàng
	@PostMapping("/assign")
	public void phanCongDonHang(@RequestParam("employee") String emailEmployee,
			@RequestParam("donHangId") long donHangId) {
		DonHang dh = donHangService.findById(donHangId);
		dh.setTrangThaiDonHang("Đang giao");
		dh.setEmployee(nguoiDungService.findByEmail(emailEmployee));

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			String dateStr = format.format(new Date());
			Date date = format.parse(dateStr);
			dh.setNgayGiaoHang(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		donHangService.save(dh);
	}

	// xác nhận hoàn thành đơn hàng
	@PostMapping("/update")
	public void xacNhanHoanThanhDon(@RequestParam("donHangId") long donHangId,
			@RequestParam("ghiChu") String ghiChuAdmin) {
		DonHang dh = donHangService.findById(donHangId);
		
		for(ChiTietDonHang ct : dh.getDanhSachChiTiet()) {
			SanPham sp = ct.getSanPham();
			sp.setSoLuong(sp.getSoLuong() - ct.getSoLuongNhanHang() );
		}
		dh.setTrangThaiDonHang("Hoàn thành");
		String ghiChu = dh.getGhiChu();
		if (!ghiChuAdmin.equals("")) {
			ghiChu += "<br> Ghi chú admin:\n" + ghiChuAdmin;
			
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			String dateStr = format.format(new Date());
			Date date = format.parse(dateStr);
			dh.setNgayNhanHang(date);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		dh.setGhiChu(ghiChu);
		donHangService.save(dh);
	}

	// xác nhận hoàn thành đơn hàng
	@PostMapping("/cancel")
	public void huyDonHangAdmin(@RequestParam("donHangId") long donHangId) {
		DonHang dh = donHangService.findById(donHangId);
		dh.setTrangThaiDonHang("Đã bị hủy");
		donHangService.save(dh);
	}

	// lấy dữ liệu làm báo cáo thống kê
	@GetMapping("/report")
	public List<Object> test() {
		return donHangService.layDonHangTheoThangVaNam();
	}
	
	@PostMapping("/buySuccess")
	 public void buySuccess(@RequestParam("donHangId") long donHangId) {
			DonHang dh = donHangService.findById(donHangId);
			dh.setTrangThaiDonHang("Chờ duyệt");
			donHangService.save(dh);
			}
	@PostMapping("/Problem")
	 public void problem(@RequestParam("donHangId") long donHangId) {
			DonHang dh = donHangService.findById(donHangId);
			String statusPre = dh.getTrangThaiDonHang();			
			dh.setTrangThaiDonHang("Đang có sự cố");
			donHangService.save(dh);
			}
	@GetMapping("/report/doanh-thu-theo-san-pham/{thang}")
	public List<Object> revenueByProduct(@PathVariable(value = "thang") Integer thang){
		return donHangService.top4DoanhThuSanPhamTheoThang(thang);
	}
	
	@GetMapping("/report/so-luong-theo-san-pham/{thang}")
	public List<Object> quantityByProduct(@PathVariable(value = "thang") Integer thang){
		return donHangService.top4SoLuongSanPhamTheoThang(thang);
	}
	
	@GetMapping("/report/top4DoanhThuCuaNhanVienTheoThang/{thang}")
	public List<Object> revenueOfEmployeeByProduct(@PathVariable(value = "thang") Integer thang){
		return donHangService.top4DoanhThuCuaNhanVienTheoThang(thang);
	}
	
	@GetMapping("/report/top4SoLuongSanPhamCuaNhanVienTheoThang/{thang}")
	public List<Object> top4SoLuongSanPhamCuaNhanVienTheoThang(@PathVariable(value = "thang") Integer thang){
		return donHangService.top4SoLuongSanPhamCuaNhanVienTheoThang(thang);
	}

}
