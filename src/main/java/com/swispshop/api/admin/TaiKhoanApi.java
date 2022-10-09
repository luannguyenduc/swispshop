package com.swispshop.api.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.swispshop.dto.TaiKhoanDTO;
import com.swispshop.entities.NguoiDung;
import com.swispshop.entities.ResponseObject;
import com.swispshop.entities.VaiTro;
import com.swispshop.repository.NguoiDungRepository;
import com.swispshop.repository.VaiTroRepository;
import com.swispshop.service.NguoiDungService;
import com.swispshop.service.VaiTroService;

@RestController
@RequestMapping("/api/tai-khoan")
public class TaiKhoanApi {

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private VaiTroService vaiTroService;
	@Autowired
	private NguoiDungRepository nguoiDungRepository;

	@GetMapping("/all")
	public Page<NguoiDung> getNguoiDungByVaiTro(@RequestParam("tenVaiTro") String tenVaiTro,
			@RequestParam(defaultValue = "1") int page) {
		Set<VaiTro> vaiTro = new HashSet<>();
		vaiTro.add(vaiTroService.findByTenVaiTro(tenVaiTro));

		return nguoiDungService.getNguoiDungByVaiTro(vaiTro, page);
	}

	@PostMapping("/save")
	public ResponseObject saveTaiKhoan(@RequestBody @Valid TaiKhoanDTO dto, BindingResult result, Model model) {
		
		ResponseObject ro = new ResponseObject();

		if(nguoiDungService.findByEmail(dto.getEmail()) != null) {
			result.rejectValue("email", "error.email","Email đã được đăng ký");
		}
		if(!dto.getConfirmPassword().equals(dto.getPassword())) {
			result.rejectValue("confirmPassword", "error.confirmPassword","Nhắc lại mật khẩu không đúng");
		}

		if (result.hasErrors()) {
			setErrorsForResponseObject(result, ro);
		} else {
			ro.setStatus("success");
			nguoiDungService.saveUserForAdmin(dto);
		}	
		return ro;
	}

	@DeleteMapping("/delete/{id}")
	public void deleteTaiKhoan(@PathVariable long id) {
		nguoiDungService.deleteById(id);
	}
	public void setErrorsForResponseObject(BindingResult result, ResponseObject object) {

		Map<String, String> errors = result.getFieldErrors().stream()
				.collect(Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage));
		object.setErrorMessages(errors);
		object.setStatus("fail");
		
		List<String> keys = new ArrayList<String>(errors.keySet());			
		for (String key: keys) {
		    System.out.println(key + ": " + errors.get(key));
		}
		
		errors = null;
	}
	
	

	@PutMapping("/switchStatus/{id}")
	public NguoiDung switchStatus(@PathVariable long id) {

		NguoiDung user = nguoiDungService.findById(id);
		Calendar date = Calendar.getInstance();
		long timeInSecs = date.getTimeInMillis();
		Date afterAdding1Mins = new Date(0);
		if(user.getBlockTodate().before(date.getTime())||!user.getIsBlocked() ) {
			afterAdding1Mins = new Date("01/01/3000");
			System.out.println(afterAdding1Mins);
			user.setIsBlocked(true);
		}else if(user.getIsBlocked() || user.getBlockTodate().after(date.getTime())){
			afterAdding1Mins = new Date(0);
			System.out.println("Mở Khóa tài khoản "+user.getId());
			user.setIsBlocked(false);
		}
		
		//System.out.println(user.getPassword());
		user.setBlockTodate(afterAdding1Mins);
		nguoiDungRepository.save(user);
		return user;
	}
	
	@Autowired
	VaiTroRepository vaitroRepo;
	
	@PutMapping("/upRoleToAdmin/{id}")
	public VaiTro upRoleToAdmin(@PathVariable long id) {
		vaitroRepo.updateRoleToAdminByEmployeeId((long)id);
		return null;
	}
	
	
	@PutMapping("/unblockAccountFor1Minute/{id}")
	public NguoiDung blockAccountFor3Days(@PathVariable long id) {
		Date date = new Date();
		NguoiDung user = nguoiDungService.findById(id);
			if(date.after(user.getBlockTodate()) && user.getIsBlocked()) {
				user.setIsBlocked(false);
			}
			nguoiDungRepository.save(user);
		return user;
	}
	
	@PutMapping("/setBlockToDate/{id}")
	public NguoiDung setBlockToDate(@PathVariable long id) {
		Calendar date = Calendar.getInstance();
		System.out.println("Current Date and TIme : " + date.getTime());
		long timeInSecs = date.getTimeInMillis();
		Date afterAdding1Mins = new Date(timeInSecs + (1 * 60 * 1000));
		System.out.println("Khóa tài khoản đến : " + afterAdding1Mins);
		NguoiDung user = nguoiDungService.findById(id);
		System.out.println(user.getPassword());
		user.setBlockTodate(afterAdding1Mins);
		user.setIsBlocked(true);
		nguoiDungRepository.save(user);
		return user;
	}
}
