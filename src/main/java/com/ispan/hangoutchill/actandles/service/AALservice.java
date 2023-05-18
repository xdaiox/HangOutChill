package com.ispan.hangoutchill.actandles.service;

import java.io.IOException;
import java.util.ArrayList;
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

	
//========================================個別商家申辦內容===========================================
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
//========================================個別一般會員已報名搜索========================================
	public Page<ActivitiesandLesson> findByaccountsId(Integer id, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "theDayofSubmission");
		Page<ActivitiesandLesson> page = aalRepository.findByaccountsId(id, pgb);
		List<ActivitiesandLesson> contentlist = page.getContent();
		for (ActivitiesandLesson aal : contentlist) {
			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
			aal.setRegistered(aalRepository.findregistered(aal.getId()));
			aal.setCheckedout(aalRepository.findcheckedout(aal.getId(), id));
			System.out.println(aal.getCheckedout());
		}
		return page;
	}
//========================================全搜尋========================================
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

	
//========================================針對類別搜尋========================================
	public Page<ActivitiesandLesson> findPageByTopic(Integer pageNumber,String value){
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "theDayofSubmission");
		Page<ActivitiesandLesson> page = aalRepository.findPageByTopic(value, pgb);
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
//========================================針對前台用戶的類別搜尋========================================
	public Page<ActivitiesandLesson> findPageByTopicforguest(Integer pageNumber,String value){
		Pageable pgb = PageRequest.of(pageNumber - 1, 100, Sort.Direction.DESC, "theDayofSubmission");
		Page<ActivitiesandLesson> page = aalRepository.findPageByTopicforguest(value, pgb);
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
	
	
	
//========================================針對核准與開放報名來搜索========================================
	public Page<ActivitiesandLesson> findByStatusforguest(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 100, Sort.Direction.DESC ,"theDayofSubmission");
		Page<ActivitiesandLesson> page = aalRepository.findPageByStatusForGuest(pgb);
		List<ActivitiesandLesson> contentlist = page.getContent();
		for (ActivitiesandLesson aal : contentlist) {
			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
		}
		return page;
	}

//========================================指定狀態來搜索========================================
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
	
//========================================單個活動查詢========================================	
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
//========================================針對商家-搜尋已開放報名活動========================================
	public List<ActivitiesandLesson> findByMemberandOpened(Integer id){
		return aalRepository.findIDByMemberIdAndOpened(id);
	}
	
	
	
//========================================更新========================================
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
			if (aal.getCause()!=null ) {
				aalOriginal.setCause(aal.getCause());
			}
			return aalOriginal;
		}
		return null;
	}
//========================================更改狀態用========================================
	@Transactional
	public ActivitiesandLesson updateStatus(Integer id, String currentStatus) {
		Optional<ActivitiesandLesson> option = aalRepository.findById(id);
		
		if (option.isPresent()) {
			ActivitiesandLesson aalOriginal = option.get();

			aalOriginal.setCurrentStatus(currentStatus);
			
			return aalOriginal;
		}
		return null;
	}
	
//========================================查看是否報名========================================
	public Integer findSignUpDetail(Integer lesid ,Integer memberid){
		return aalRepository.findSignUpDetail(lesid, memberid);		
	}
 
//========================================查看最新的前3筆資料========================================
	public List<ActivitiesandLesson> findLastest(){
		return aalRepository.findLastest();
	}
//========================================找報名最多的活動========================================
	public ActivitiesandLesson findTheMostPopularAct() {
		List<ActivitiesandLesson> actlist = aalRepository.findTheMostPopularAct();
		for (ActivitiesandLesson aal : actlist) {
			byte[] imageBytes = aal.getImage(); // 取得圖片二進位數據
			String base64Image = Base64.getEncoder().encodeToString(imageBytes); // 轉換為base64格式
			aal.setBase64image(base64Image); // 設置到對應的實體類屬性中
			//取得報名人數
			aal.setRegistered(aalRepository.findregistered(aal.getId()));
		}
		Integer target=null ;
		for(int i=0;i<actlist.size();i++) {
			for(int j=0;j<actlist.size();j++) {
				if(actlist.get(j).getRegistered()>actlist.get(i).getRegistered()) {
					target=actlist.get(j).getId();
				}
			}
		}	
		System.out.println("取得id"+target);
		if(target!=null) {
			ActivitiesandLesson top = (aalRepository.findById(target)).get();
			return top;
		}else {
			ActivitiesandLesson top = aalRepository.findLastestAct();
			return top;
		}
	}
	
	
}
