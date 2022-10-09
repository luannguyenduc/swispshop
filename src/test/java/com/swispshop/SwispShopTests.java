package com.swispshop;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.swispshop.entities.DanhMuc;
import com.swispshop.entities.DonHang;
import com.swispshop.entities.NguoiDung;
import com.swispshop.entities.VaiTro;
import com.swispshop.repository.DonHangRepository;
import com.swispshop.repository.NguoiDungRepository;
import com.swispshop.service.DanhMucService;
import com.swispshop.service.NguoiDungService;
import com.swispshop.service.SanPhamService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SwispShopTests {

	@Autowired
	private DanhMucService dmService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private NguoiDungRepository ndRepo;

	@Autowired
	private DonHangRepository dhRepo;
	
	@Autowired
	private SanPhamService spService;


//	@Test
//	public void getALlDanhMucTest() {
//		System.out.println(dhRepo.test().size());
//	}

	@Test
	public void getALlDanhMucTest() {
		System.out.println(spService.getSanPhamByTenSanPhamForAdmin("asus",0,10).getContent().size());
	}

}
