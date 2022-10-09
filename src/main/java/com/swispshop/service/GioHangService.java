package com.swispshop.service;

import com.swispshop.entities.GioHang;
import com.swispshop.entities.NguoiDung;

public interface GioHangService {
	
	GioHang getGioHangByNguoiDung(NguoiDung n);
	
	GioHang save(GioHang g);
}
