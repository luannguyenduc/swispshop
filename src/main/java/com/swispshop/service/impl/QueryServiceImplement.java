package com.swispshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swispshop.repository.QueryRepository;
import com.swispshop.service.QueryService;

@Service
public class QueryServiceImplement implements QueryService {

	@Autowired
	QueryRepository rep;

	@Override
	public int tongDoanhThuThang() {
		// TODO Auto-generated method stub
		return rep.tongDoanhThuThang();
	}

	@Override
	public int tongSoLuongNhanVien() {
		// TODO Auto-generated method stub
		return rep.tongSoLuongNhanVien();
	}

	@Override
	public int tongSoLuongMatHang() {
		// TODO Auto-generated method stub
		return rep.tongSoLuongMatHang();
	}

	@Override
	public int tongDoanhThuTheoNgay() {
		// TODO Auto-generated method stub
		 return rep.tongDoanhThuTheoNgay();
	}

	@Override
	public int sodonhoanthanh() {
		// TODO Auto-generated method stub
		return rep.sodonhoanthanh();
	}

	

	
	
}