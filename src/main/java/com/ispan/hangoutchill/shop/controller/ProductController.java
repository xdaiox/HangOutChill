package com.ispan.hangoutchill.shop.controller;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ispan.hangoutchill.shop.model.Product;
import com.ispan.hangoutchill.shop.model.ProductPhoto;
import com.ispan.hangoutchill.shop.model.ProductPhotoPK;
import com.ispan.hangoutchill.shop.service.ProductPhotoService;
import com.ispan.hangoutchill.shop.service.ProductService;

@Controller
public class ProductController {

	private ProductService productService;
	private ProductPhotoService productPhotoService;
	
	
	@Autowired
	public ProductController(ProductService productService, ProductPhotoService productPhotoService) {
		this.productService = productService;
		this.productPhotoService = productPhotoService;
	}

	@GetMapping("/shop/add")
	public String addProduct(Model model) {
		model.addAttribute("product", new Product());
		return "shop/addProductPage";
	}
	
	@PostMapping("/shop/postProduct")
	public String postProduct(
			@ModelAttribute Product product,
			@RequestParam(name="extraphoto", required=false) MultipartFile[] extraphotos,
			Model model,
			RedirectAttributes redirectAttributes) {
		
		// 商品封面圖片存放
		MultipartFile productImage = product.getMainImage();
		if(productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				product.setCoverImage(b);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: "+ e.getMessage());
			}
		}

		// 其餘商商品圖片存放
		Set<ProductPhoto> photosets = new LinkedHashSet<>();
		ProductPhoto pp;
		ProductPhotoPK pPK;
		
		for(MultipartFile photo : extraphotos) {
			if(photo != null && !photo.isEmpty()) {
				pp = new ProductPhoto();
				pPK = new ProductPhotoPK();
				pp.setProduct(product);
				
				// 這行應該是不用存
//			pPK.setProductId(product.getProductId());
				
				try {
					byte[] b = photo.getBytes();
					pp.setPhoto(b);
					pPK.setPhotoName(photo.getOriginalFilename());
					System.out.println(photo.getOriginalFilename());
//				pPK.setPhotoName("TEST"); 
					pp.setProductPhotoPK(pPK);
					photosets.add(pp);
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: "+ e.getMessage());
				}
			}
		}
		
		product.setPhotos(photosets);
		productService.addProduct(product);
		redirectAttributes.addFlashAttribute("sucessMessage", "新增產品成功 !");
		return "redirect:/shop/allproducts";
	}
	
	
	
	// 後台顯示所有產品清單
	
	@GetMapping("/shop/allproducts")
	public String goShowProducts(
			@RequestParam(name="p", defaultValue="1") Integer pageNum,Model model) {
		Page<Product> page = productService.findByPage(pageNum);
		model.addAttribute("page", page);
		return "shop/showProducts";
	}
	
	
	// 產品刪除
	@DeleteMapping("/shop/delete/product")
	public String deleteProductByid(@RequestParam(name="productid") Integer productId) {
		productService.deleteProductById(productId);
		return "redirect:/shop/allproducts";
	}
	
	//顯示產品詳細頁面
//	@GetMapping("/shop/product")
//	public String goShowProductsDetail(@RequestParam(name="productid") Integer productId, Model model) {
//		Product product = productService.getProductById(productId);
//		model.addAttribute("product", product);
//		return "shop/showProductDetail";
//	}
	
	
	// 顯示後台單獨產品頁面
	@GetMapping("/shop/singleproduct")
	public String goShowSingleProduct(@RequestParam(name="productid") Integer productId, Model model) {
		Product p = productService.getProductById(productId);
		List<ProductPhoto> photos = productPhotoService.findPhotosById(productId);
		model.addAttribute("product", p);
		model.addAttribute("photos", photos);
		return "shop/productInfo";
	}
	
	
	
	
	// 產品編輯
	@GetMapping("/shop/edit/product")
	public String editProductPage(@RequestParam(name="productid") Integer productId, Model model) {
		Product p = productService.getProductById(productId);
		model.addAttribute("product", p);
		return "shop/editProductPage";
	}
	

	@PutMapping("/shop/edit/product")
	public String editProduct(@ModelAttribute("product") Product product) {
		
		MultipartFile productImage = product.getMainImage();
		if(productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				product.setCoverImage(b);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: "+ e.getMessage());
			}
		}else {
			Product originalProduct = productService.getProductById(product.getProductId());
			product.setCoverImage(originalProduct.getCoverImage());
		}
		productService.updateProductById(product.getProductId(), product);
		return "redirect:/shop/allproducts";
	}
	
	
	// 子敬的方法
//	@GetMapping("/getPicture/{productId}")
//	public void getPicture(
//			HttpServletResponse response,
//			@PathVariable Integer productId) {
//		Product product = productService.getProductById(productId);
//		byte[] bytes = product.getCoverImage();
//		
//		response.setContentType("image/png");
//		ServletOutputStream out;
//		try {
//			out = response.getOutputStream();
//			out.write(bytes);			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		out.close();
//	}
	
	@GetMapping("/shop/getPicture/{productId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer productId){
		
		HttpHeaders headers = new HttpHeaders();
		byte[] media = null;
		
		Product product = productService.getProductById(productId);
		if (product != null) {
			byte[] imageBytes = product.getCoverImage();
			if(imageBytes != null) {
				media = imageBytes;
			}
		}
		
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		MediaType mediaType = MediaType.valueOf("image/png");
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		
		return responseEntity;
	}
	
	
	// ExtraImg 取得
	@GetMapping("/shop/getExtraPicture")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp,
			@RequestParam(name="productid") Integer productId,
			@RequestParam(name="productName") String productName){
		
		HttpHeaders headers = new HttpHeaders();
		byte[] media = null;
		ProductPhotoPK ppk = new ProductPhotoPK();
		ppk.setPhotoName(productName);
		ppk.setProductId(productId);
		ProductPhoto photo = productPhotoService.findById(ppk);
//		Product product = productService.getProductById(productId);
		
		if (photo != null) {
			byte[] imageBytes = photo.getPhoto();
			if(imageBytes != null) {
				media = imageBytes;
			}
		}
		
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		MediaType mediaType = MediaType.valueOf("image/png");
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		
		return responseEntity;
	}
	
	
	
	
	
}
