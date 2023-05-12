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
import com.ispan.hangoutchill.shop.service.ShoppingCartService;

@Controller
public class ProductController {

	private ProductService productService;
	private ProductPhotoService productPhotoService;
	private ShoppingCartService shoppingCartService;
	
	
	@Autowired
	public ProductController(ProductService productService, ProductPhotoService productPhotoService, ShoppingCartService shoppingCartService) {
		this.productService = productService;
		this.productPhotoService = productPhotoService;
		this.shoppingCartService = shoppingCartService;
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
				pp.setProduct(product);
				
				// 這行應該是不用存
//			pPK.setProductId(product.getProductId());
				
				try {
					byte[] b = photo.getBytes();
					pp.setPhoto(b);
					pp.setPhotoName(photo.getOriginalFilename());
					System.out.println(photo.getOriginalFilename());
//				pPK.setPhotoName("TEST"); 
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
		List<ProductPhoto> photos = productPhotoService.findPhotosById(productId);
		model.addAttribute("product", p);
		model.addAttribute("photos", photos);
		return "shop/editProductPage";
	}
	

	@PutMapping("/shop/edit/product")
	public String editProduct(@ModelAttribute("product") Product product,
								@RequestParam(name="delphotoid", required=false) Integer[] deletePhotoId,
								@RequestParam(name="addphoto", required=false) MultipartFile[] addphotos) {
//		// 封面照片更改處理
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
		
		// 其餘商品圖片處理
		// 刪除圖片
		List<Integer> deleteList = null; //未來再懂 HQL語法可以這樣寫
		List<Integer> originalIds = productPhotoService.findPhotosIdByProductId(product.getProductId());
		
//		if(deletePhotoId.length >0) {
//			for(Integer i : deletePhotoId) {
//				if(i!=null) {
//					for(Integer j : originalIds) {
//						if(i==j) {
//							break;
//						}
//						productPhotoService.deltePhotoByPhotoId(i);
//					}
//					
//				}
//				
//			}
//			
//		}else if(deletePhotoId==null) {
//			for(Integer i :originalIds ) {
//				productPhotoService.deltePhotoByPhotoId(i);
//			}
//		}
		
		
		
		Boolean flag = false;
		if(deletePhotoId == null) {
			for(Integer i : originalIds) {
				productPhotoService.deltePhotoByPhotoId(i);
			}
		}else {
			for(Integer i : originalIds) {
				for(Integer j : deletePhotoId) {
					if(j==i) {
						flag = true;
						break;
					}else {
						flag = false;
					}
				}
				if(!flag) {
					productPhotoService.deltePhotoByPhotoId(i);
				}
					
			}
			
		}
		
		
		
				
			
		
//		for(Integer i : deletePhotoId) {
//			if(i!=null) {
//				for(Integer j : originalIds) {
//					if(j==i) {
//						break;
//						
//					}
//					productPhotoService.deltePhotoByPhotoId(j);
//				}
//				
//			}
//			
//		}
//		
		
		
		// 新增圖片
		Set<ProductPhoto> photosets = new LinkedHashSet<>();
		ProductPhoto pp;
		
		for(MultipartFile photo : addphotos) {
			if(photo != null && !photo.isEmpty()) {
				pp = new ProductPhoto();
				pp.setProduct(product);
				// 這行應該是不用存
//			pPK.setProductId(product.getProductId());
//				
				try {
					byte[] b = photo.getBytes();
					pp.setPhoto(b);
					pp.setPhotoName(photo.getOriginalFilename());
//					System.out.println(photo.getOriginalFilename());
//				pPK.setPhotoName("TEST"); 
					photosets.add(pp);
					productPhotoService.addProducPhoto(pp);
					
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: "+ e.getMessage());
				}
			}
		}
//		
//		product.setPhotos(photosets);
		productService.updateProductById(product.getProductId(), product);
		
		
		// 新增產品修改成功敘述
		
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
	public ResponseEntity<byte[]> getExtraPhoto(
			HttpServletResponse resp,
			@RequestParam(name="photoid") Integer photoId){
		
		HttpHeaders headers = new HttpHeaders();
		byte[] media = null;
		ProductPhoto photo = productPhotoService.findById(photoId);
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
	
	
	// 前台渲染
	// 商品分類 仍須加上分頁功能與分頁按鈕
	@GetMapping("/shop/products")
	public String showProductbyCategory(@RequestParam(name="category") String category, Model model) {
		List<Product> cps = productService.findProductByCategory(category);
		model.addAttribute("category", category);
		model.addAttribute("cateProducts", cps);
		return "shop/shopCategory";
	}
	
	// 商品單獨頁面
	@GetMapping("/shop/productdetail")
	public String showProductDetail(@RequestParam(name="productid") Integer productId, Model model) {
		Product product = productService.getProductById(productId);
		model.addAttribute("product", product);
		return "shop/productDetail";
	}
	
	
	
}
