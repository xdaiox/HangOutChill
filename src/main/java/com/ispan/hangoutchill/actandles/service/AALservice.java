package com.ispan.hangoutchill.actandles.service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.hangoutchill.actandles.dao.AALRepository;
import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;

@Service
public class AALservice {
	@Autowired
	private AALRepository aalRepository;

	public void addAAL(ActivitiesandLesson aal) {
		aalRepository.save(aal);
	}

	public Page<ActivitiesandLesson> findPageByMemberId(Integer id, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "theDayofSubmission");
		Page<ActivitiesandLesson> page = aalRepository.findPageByMemberId(id, pgb);
		List<ActivitiesandLesson> contentlist = page.getContent();
		for (ActivitiesandLesson aal : contentlist) {
			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
			aal.setRegistered(aalRepository.findregistered(aal.getId()));
		}
		return page;
	}

	public Page<ActivitiesandLesson> findByaccountsId(Integer id, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "theDayofSubmission");
		Page<ActivitiesandLesson> page = aalRepository.findByaccountsId(id, pgb);
		List<ActivitiesandLesson> contentlist = page.getContent();
		for (ActivitiesandLesson aal : contentlist) {
			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
			aal.setRegistered(aalRepository.findregistered(aal.getId()));
		}
		return page;
	}

	public Page<ActivitiesandLesson> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.DESC, "theDayofSubmission");
		Page<ActivitiesandLesson> page = aalRepository.findAll(pgb);
		List<ActivitiesandLesson> contentlist = page.getContent();
		for (ActivitiesandLesson aal : contentlist) {
			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
			aal.setRegistered(aalRepository.findregistered(aal.getId()));
		}
		return page;
	}
//	public Page<ActivitiesandLesson> findByStatusforadmin(Integer pageNumber) {
//		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "theDayofSubmission");
//		Page<ActivitiesandLesson> page = aalRepository.findPageByStatusForAdmin(pgb);
//		List<ActivitiesandLesson> contentlist = page.getContent();
//		for (ActivitiesandLesson aal : contentlist) {
//			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
//			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
//			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
//		}
//		return page;
//	}
//	
//	public Page<ActivitiesandLesson> findByStatusforguest(Integer pageNumber) {
//		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "theDayofSubmission");
//		Page<ActivitiesandLesson> page = aalRepository.findPageByStatusForGuest(pgb);
//		List<ActivitiesandLesson> contentlist = page.getContent();
//		for (ActivitiesandLesson aal : contentlist) {
//			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
//			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
//			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
//		}
//		return page;
//	}
	
	public Page<ActivitiesandLesson> findByStatus(Integer pageNumber,String value) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "theDayofSubmission");
		Page<ActivitiesandLesson> page = aalRepository.findPageByStatus(value, pgb);
		List<ActivitiesandLesson> contentlist = page.getContent();
		for (ActivitiesandLesson aal : contentlist) {
			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
			//取得報名人數
			aal.setRegistered(aalRepository.findregistered(aal.getId()));
			
		}
		return page;
	}
	
	

	public void deleteAALById(Integer id) {
		aalRepository.deleteById(id);
	}

	public ActivitiesandLesson findAALById(Integer id) {
		Optional<ActivitiesandLesson> option = aalRepository.findById(id);

		if (option.isEmpty()) {
			return null;
		} else {
			ActivitiesandLesson content = option.get();
			byte[] imageBytes = content.getImage(); // 取得圖片二進位數據
			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
			content.setBase64image(base64Image); // 設置到對應的實體類屬性中
			content.setRegistered(aalRepository.findregistered(content.getId()));
		}

		return option.get();
	}

	@Transactional
	public ActivitiesandLesson updateById(Integer id, ActivitiesandLesson aal) {
		Optional<ActivitiesandLesson> option = aalRepository.findById(id);

		if (option.isPresent()) {
			ActivitiesandLesson aalOriginal = option.get();
//			aalOriginal.setShop_Id(aal.getShop_Id());
			aalOriginal.setName(aal.getName());
			aalOriginal.setAalContent(aal.getAalContent());
			aalOriginal.setTopic(aal.getTopic());
			aalOriginal.setTheDayofSubmission(aalOriginal.getTheDayofSubmission());
			if (aal.getTheDayofStarts() != null) {
				aalOriginal.setTheDayofStarts(aal.getTheDayofStarts());
			}
			aalOriginal.setFee(aal.getFee());
			aalOriginal.setQuota(aal.getQuota());
			aalOriginal.setLowerLimit(aal.getLowerLimit());
			if (aal.getDeadLine() != null) {
				aalOriginal.setDeadLine(aal.getDeadLine());
			}
			aalOriginal.setCurrentStatus(aal.getCurrentStatus());
			if (aal.getImageFile().isEmpty() == false) {
				try {
					aalOriginal.setImage(aal.getImageFile().getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return aalOriginal;
		}
		return null;
	}
	@Transactional
	public ActivitiesandLesson updateForApproved(Integer id, String currentStatus) {
		Optional<ActivitiesandLesson> option = aalRepository.findById(id);
		
		if (option.isPresent()) {
			ActivitiesandLesson aalOriginal = option.get();

			aalOriginal.setCurrentStatus(currentStatus);
			
			return aalOriginal;
		}
		return null;
	}
	
	
	public Integer findSignUpDetail(Integer lesid ,Integer memberid){
		return aalRepository.findSignUpDetail(lesid, memberid);		
	}
 
}
