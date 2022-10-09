package com.swispshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.swispshop.entities.ChiMucGioHang;
import com.swispshop.entities.GioHang;
import com.swispshop.entities.SanPham;

public interface ChiMucGioHangRepository extends JpaRepository<ChiMucGioHang, Long>{
	
	ChiMucGioHang findBySanPhamAndGioHang(SanPham sp,GioHang g);
	
	List<ChiMucGioHang> findByGioHang(GioHang g);
}
