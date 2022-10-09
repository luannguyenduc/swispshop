package com.swispshop.service;

import java.text.ParseException;

import org.springframework.data.domain.Page;

import com.swispshop.dto.SearchLienHeObject;
import com.swispshop.entities.LienHe;

public interface LienHeService {

	Page<LienHe> getLienHeByFilter(SearchLienHeObject object, int page) throws ParseException;

	LienHe findById(long id);
	
	LienHe save(LienHe lh);
	
	int countByTrangThai(String trangThai);

}
