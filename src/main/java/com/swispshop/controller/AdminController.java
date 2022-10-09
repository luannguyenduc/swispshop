package com.swispshop.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.swispshop.dto.ListCongViecDTO;
import com.swispshop.entities.DonHang;
import com.swispshop.entities.NguoiDung;
import com.swispshop.entities.VaiTro;
import com.swispshop.entities.donhangPDFexporter;
import com.swispshop.service.DanhMucService;
import com.swispshop.service.DonHangService;
import com.swispshop.service.HangSanXuatService;
import com.swispshop.service.LienHeService;
import com.swispshop.service.NguoiDungService;
import com.swispshop.service.VaiTroService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {

	@Autowired
	private DanhMucService danhMucService;

	@Autowired
	private HangSanXuatService hangSXService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private VaiTroService vaiTroService;
	
	@Autowired
	private LienHeService lienHeService;

	@Autowired
	private DonHangService donHangService;

	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	@GetMapping
	public String adminPage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/trangAdmin";
	}

	@GetMapping("/danh-muc")
	public String quanLyDanhMucPage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/quanLyDanhMuc";
	}

	@GetMapping("/nhan-hieu")
	public String quanLyNhanHieuPage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/quanLyNhanHieu";
	}

	@GetMapping("/lien-he")
	public String quanLyLienHePage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/quanLyLienHe";
	}
	
	@GetMapping("/san-pham")
	public String quanLySanPhamPage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		model.addAttribute("listNhanHieu", hangSXService.getALlHangSX());
		model.addAttribute("listDanhMuc", danhMucService.getAllDanhMuc());
		return "admin/quanLySanPham";
	}

	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		model.addAttribute("user", getSessionUser(request));
		return "admin/profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute NguoiDung nd, HttpServletRequest request) {
		NguoiDung currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/admin/profile";
	}

	@GetMapping("/don-hang")
	public String quanLyDonHangPage(Model model) {
		Set<VaiTro> vaiTro = new HashSet<>();
		// lấy danh sách employee
		vaiTro.add(vaiTroService.findByTenVaiTro("ROLE_EMPLOYEE"));
		List<NguoiDung> employees = nguoiDungService.getNguoiDungByVaiTro(vaiTro);
		for (NguoiDung employee : employees) {
			employee.setListDonHang(donHangService.findByTrangThaiDonHangAndEmployee("Đang giao", employee));
		}
		model.addAttribute("allEmployee", employees);
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/quanLyDonHang";
	}

	@GetMapping("/tai-khoan")
	public String quanLyTaiKhoanPage(Model model) {
	    model.addAttribute("listVaiTro", vaiTroService.findAllVaiTro());
	    ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/quanLyTaiKhoan";
	}
	
	@GetMapping("/thong-ke")
	public String thongKePage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/thongKe";
	}
	
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
	@GetMapping("admin/export/execl")
	public void exportToPDF(HttpServletResponse response) throws DocumentException, IOException {
		response.setContentType("application/octet-stream");
		
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());
		 String headerKey = "Content-Disposition";
		 String headerValue = "attachment; filename=donhang_" + currentDateTime + ".xlsx";
	        response.setHeader(headerKey, headerValue);
	      List<DonHang> listdonhang = donHangService.fillAll();
	       donhangPDFexporter exporter = new donhangPDFexporter(listdonhang);
	       exporter.export(response);
	}
	@GetMapping("/thong-ke/doanh-thu-sp-theo-thang")
	public String thongKeDoanhThuSpTheoThangPage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/thongKe";
	}
	
	@GetMapping("/thong-ke/so-luong-sp-theo-thang")
	public String thongKeSoLuongSpTheoThangPage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/thongKe2";
	}
	@GetMapping("/thong-ke/top4DoanhThuCuaNhanVienTheoThang")
	public String top4DoanhThuCuaNhanVienTheoThang(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/thongKe3";
	}
	@GetMapping("/thong-ke/top4SoLuongSanPhamCuaNhanVienTheoThang")
	public String top4SoLuongSanPhamCuaNhanVienTheoThang(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/thongKe4";
	}

}
