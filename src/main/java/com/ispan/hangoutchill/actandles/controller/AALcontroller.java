package com.ispan.hangoutchill.actandles.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.service.AALservice;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.AioCheckOutDevide;

@Controller
public class AALcontroller {
	@Autowired
	private AALservice aalService;
	@Autowired
	private NormalMemberService nMemberService;

	@GetMapping("/actandles/shop/add")
	public String addAAL(Model model,
			@CurrentSecurityContext(expression = "authentication") Authentication authentication) {

		model.addAttribute("aal", new ActivitiesandLesson());
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("result", result);

		return "aal/addAALPage";
	}

	@PostMapping("/actandles/shop/post")
	public String postAAL(@RequestParam("imageFile") MultipartFile imageFile,
			@ModelAttribute("aal") ActivitiesandLesson aal, Model model) {

		try {
			aal.setImage(imageFile.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			aal.setImage("".getBytes());
		}
		aalService.addAAL(aal);

		return "redirect:/actandles/shop/postall";
	}

	@GetMapping("/actandles/shop/postall")
	public String goShowAAL(@RequestParam(name = "p", defaultValue = "1") Integer pagenumber, Model model) {
		Page<ActivitiesandLesson> page = aalService.findByPage(pagenumber);
		model.addAttribute("page", page);

		return "aal/showMyAaL";
	}

	@DeleteMapping("/actandles/shop/delete")
	public String deleteAAL(@RequestParam Integer id) {
		aalService.deleteAALById(id);
		return "redirect:/actandles/shop/postall";
	}

	@GetMapping("/actandles/shop/edit")
	public String editPage(@RequestParam("id") Integer id, Model model) {
		ActivitiesandLesson aal = aalService.findAALById(id);
		model.addAttribute("aal", aal);

		return "aal/editAALPage";
	}

	@PutMapping("/actandles/shop/edit")
	public String putEditedAAL(@ModelAttribute("aal") ActivitiesandLesson aal) {
		aalService.updateById(aal.getId(), aal);
		return "redirect:/actandles/shop/postall";
	}

	@GetMapping("/actandles/{id}")
	public String showTheDetail(@PathVariable Integer id, Model model) {
		ActivitiesandLesson aal = aalService.findAALById(id);
		model.addAttribute("aal", aal);

		return "aal/showTheDetail";
	}

//====================================管理員部分=========================================	

	@GetMapping("/actandles/admin/chackaal")
	public String goShowAALForAdmin(@RequestParam(name = "p", defaultValue = "1") Integer pagenumber, Model model) {
		Page<ActivitiesandLesson> page = aalService.findByPage(pagenumber);
		model.addAttribute("page", page);

		return "aal/admin/checkAaL";
	}

//===================================結帳測試=========================================	

	/* 準備前往綠界 */
	@GetMapping("/goECPay")
	public void goECPay(Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
//		OrderBean ob = (OrderBean) request.getAttribute("orderBean");
		// 設定金流
		AllInOne aio = new AllInOne("");
		AioCheckOutALL aioCheck = new AioCheckOutALL();
		/* 特店編號 */
		aioCheck.setMerchantID("2000214");
		/* 特店交易時間 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		aioCheck.setMerchantTradeDate(sdf.format(new Date()));
		/* 交易金額 */
		aioCheck.setTotalAmount("500");
		/* 交易描述 */
		aioCheck.setTradeDesc("speakitup");
		/* 商品名稱 */
		aioCheck.setItemName("500");
		/* 特店交易編號 */
		aioCheck.setMerchantTradeNo("testSpeakitup" +131);
		/* 付款完成通知回傳網址 */
		aioCheck.setReturnURL("http://localhost:8080/hangoutchill/returnURL");
		/* Client端回傳付款結果網址 */
		String sessionId = request.getSession().getId();
		aioCheck.setOrderResultURL("http://localhost:8080/hangoutchill/showHistoryOrder?sessionId=" + sessionId);
		// 輸出畫面
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.print(aio.aioCheckOut(aioCheck, null));
	}

	// 綠界回傳資料
	@PostMapping("/returnURL")
	public void returnURL(@RequestParam("Merchant TradeNo") String MerchantTradeNo,
			@RequestParam("RtnCode") int RtnCode, @RequestParam("TradeAmt") int TradeAmt, HttpServletRequest request) {
		// 交易成功
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

	/* 查詢歷史訂單 */
	@PostMapping("/showHistoryOrder")
	public String showECPAYHistoryurder (Model model) {
		
	return "aal/user/historyOrder";
	}
	
	
	
//================================================================================	
}
