package com.ispan.hangoutchill.actandles.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.service.AALservice;
import com.ispan.hangoutchill.actandles.service.SignUpOrderDetailService;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Controller
public class AALcontroller {

	@Autowired
	private AALservice aalService;
	@Autowired
	private NormalMemberService nMemberService;
	@Autowired
	private SignUpOrderDetailService suoService;

	
	
//====================================活動申辦頁面====================================
	@GetMapping("/actandles/shop/add")
	public String addAAL(Model model,
			@CurrentSecurityContext(expression = "authentication") Authentication authentication) {

		model.addAttribute("aal", new ActivitiesandLesson());
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("result", result);

		return "aal/addAALPage";
	}

	
//====================================執行新增頁面====================================
	
	@PostMapping("/actandles/shop/post")
	public String postAAL(@RequestParam("imageFile") MultipartFile imageFile,@ModelAttribute("aal") ActivitiesandLesson aal) {

		try {
			aal.setImage(imageFile.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			aal.setImage("".getBytes());
		}
		aalService.addAAL(aal);

		return "redirect:/actandles/shop/postall?currentStatus=unreviewed";
	}

	
//====================================商家活動管理頁面====================================
	@GetMapping("/actandles/shop/postall")
	public String goShowAAL(@RequestParam(name = "p", defaultValue = "1") Integer pagenumber, Model model,@RequestParam(name = "currentStatus",defaultValue = "approved") String currentStatus,
			@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		Page<ActivitiesandLesson> page = aalService.findByStatus(pagenumber, currentStatus);
		model.addAttribute("page", page);
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("result", result);
		model.addAttribute("currentStatus", currentStatus);

		return "aal/showMyAaL";
	}

	
//====================================狀態切換====================================
	@Transactional
	@PutMapping("/actandles/shop/postall")
	public String closeTheRegistration(@RequestParam(name = "id") Integer id,@RequestParam(name = "currentStatus",defaultValue = "unreviewed" ) String currentStatus,Model model,
			@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		aalService.updateStatus(id, currentStatus);
		
		if(result.getRole().getRoleId()==3) {
			return "redirect:/actandles/shop/postall?currentStatus=overruled";
		}
		if(currentStatus=="deleted") {
			return "redirect:/actandles/shop/postall?currentStatus=unreviewed";
		}
		return "redirect:/actandles/shop/postall?currentStatus="+currentStatus;
		
	}
	

	@Transactional
	@DeleteMapping("/actandles/shop/delete")
	public String deleteAAL(@RequestParam Integer id) {
		String value = "deleted";
		aalService.updateStatus(id, value);
		return "redirect:/actandles/shop/postall";
	}

//====================================活動編輯頁面====================================
	@GetMapping("/actandles/shop/edit")
	public String editPage(@RequestParam("id") Integer id, Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		ActivitiesandLesson aal = aalService.findAALById(id);
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("result", result);
		model.addAttribute("aal", aal);

		return "aal/editAALPage";
	}
	
	@Transactional
	@PutMapping("/actandles/shop/edit")
	public String putEditedAAL(@ModelAttribute("aal") ActivitiesandLesson aal, Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		aalService.updateById(aal.getId(), aal);
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		
		if(result.getRole().getRoleId()==3) {
			return "redirect:/actandles/admin/chackaal";
		}
		
		return "redirect:/actandles/shop/postall";
	}

//====================================活動詳細頁面====================================
	@GetMapping("/actandles/{id}")
	public String showTheDetail(@PathVariable Integer id, Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		ActivitiesandLesson aal = aalService.findAALById(id);
		model.addAttribute("aal", new ActivitiesandLesson());
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("aal", aal);
		model.addAttribute("result",result);
//		model.addAttribute("checksignup",aalService.findSignUpDetail(aal.getId(), result.getId()));
		return "aal/showTheDetail2";
	}

//====================================管理員部分=========================================	

	//審核列表	
	@GetMapping("/actandles/admin/chackaal")
	public String goShowAALForAdmin(@RequestParam(name = "p", defaultValue = "1") Integer pagenumber, Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("result", result);
		
		String value = "unreviewed";
		Page<ActivitiesandLesson> page = aalService.findByStatus(pagenumber, value);
		
		model.addAttribute("page", page);

		return "aal/admin/checkAaL";
	}
	@Transactional
	@PutMapping("/actandles/admin/chackaal")
	public String approvedAAL(@RequestParam(name = "id") Integer id,@RequestParam(name = "currentStatus") String currentStatus) {

		aalService.updateStatus(id, currentStatus);
		return "redirect:/actandles/admin/chackaal";
	}
	
	//已刪除列表	
	@GetMapping("/actandles/admin/chackdeletdaal")
	public String goShowDeletedAAL(@RequestParam(name = "p", defaultValue = "1") Integer pagenumber, Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("result", result);
		
		String value = "deleted";
		Page<ActivitiesandLesson> page = aalService.findByStatus(pagenumber, value);
		
		model.addAttribute("page", page);

		return "aal/admin/checkdeleted";
	}
	
	@Transactional
	@DeleteMapping("/actandles/admin/chackdeletdaal")
	public String deleteDeletedAAL(@RequestParam(name = "id") Integer id) {

		aalService.deleteByid(id);
		return "redirect:/actandles/admin/chackdeletdaal";
	}

//===================================結帳測試=========================================	

	/* 準備前往綠界 */
	@ResponseBody
	@PostMapping("/actandles/detail/checkout")
	public String goECPay(@RequestParam(name = "id") Integer id,@RequestParam(name = "numbersOfPeople") Integer numbersOfPeople,@CurrentSecurityContext(expression = "authentication") Authentication authentication,Model model)
			throws IOException {
		ActivitiesandLesson aal = aalService.findAALById(id);
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		if(numbersOfPeople> aal.getQuota()-aal.getRegistered()) {numbersOfPeople=aal.getQuota()-aal.getRegistered();}
		// 設定金流
		AllInOne aio = new AllInOne("");
		AioCheckOutALL aioCheck = new AioCheckOutALL();
		/* 特店編號 */
		aioCheck.setMerchantID("2000132");
		/* 特店交易時間 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		aioCheck.setMerchantTradeDate(sdf.format(new Date()));
		/* 交易金額 */
		aioCheck.setTotalAmount(String.valueOf(aal.getFee()*numbersOfPeople));
		/* 交易描述 */
		aioCheck.setTradeDesc(aal.getTopic());
		/* 商品名稱 */
		aioCheck.setItemName(aal.getName());
		/* 特店交易編號 */
		String uuNo = UUID.randomUUID().toString().replaceAll("-", "").substring(0,2);
		String timestamp = Long.toString(System.currentTimeMillis());
		timestamp=timestamp.substring(timestamp.length()-3);
		
		aioCheck.setMerchantTradeNo("AaL"+aal.getId()+aal.getNormalMember().getId()+result.getId()+uuNo+timestamp);
		/* 付款完成通知回傳網址 */
		aioCheck.setReturnURL("http://localhost:8080/hangoutchill/returnURL");
//		aioCheck.setReturnURL("https://0ebf-203-204-109-146.ngrok-free.app/hangoutchill/returnURL");
		/* Client端回傳付款結果網址 */

		aioCheck.setOrderResultURL("http://localhost:8080/hangoutchill/actandles/showOrder?on=AaL"+aal.getId()+aal.getNormalMember().getId()+result.getId()+uuNo+timestamp);
//		aioCheck.setOrderResultURL("http://localhost:8080/hangoutchill/showOrder?ind="+uuNo+timestamp+aal.getId()+"&n="+numbersOfPeople);
//		aioCheck.setOrderResultURL("https://0ebf-203-204-109-146.ngrok-free.app/hangoutchill/showHistoryOrder?id="+aal.getId());
		// 輸出畫面
		suoService.createOrder(result, aal, uuNo, timestamp, numbersOfPeople);
		String form = aio.aioCheckOut(aioCheck, null);
		 
		return form;
	}

	// 綠界回傳資料
	@Transactional
	@PostMapping("/returnURL")
	public void returnURL(@RequestParam("MerchantTradeNo") String MerchantTradeNo,
			@RequestParam("RtnCode") int RtnCode, @RequestParam("TradeAmt") int TradeAmt,@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		// 交易成功
		System.out.println("RtnCode"+RtnCode);
		if (RtnCode == 1) {
//			String orderIdStr = MerchantTradeNo.substring(13);
//			int orderId = Integer.parseInt(orderIdStr);
//			OrderBean ob = orderService.getOrder(orderId);
//			ob.setStatus("#");
			System.out.println("辨認成功");
		}else {
			System.out.println("辨認失敗");
		}
	}

	
//================================================================================	
}
