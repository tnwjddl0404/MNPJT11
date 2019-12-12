package com.model2.mvc.web.purchase;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

//==> 판매관리 Controller
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method 구현 않음

	@Autowired
	/*
	 * //Field
	 */	private PurchaseService purchaseService;
	
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
//	@RequestMapping("/addPurchaseView.do")
	@RequestMapping(value="/json/addPurchase/{prodNo}",method=RequestMethod.GET)
	public Product addPurchaseView(@PathVariable("prodNo")int prodNo) throws Exception {

		System.out.println("/purchse/json/addPurchase : GET");
		System.out.println("prodNo:::"+prodNo);
		
		// Business Logic
		Product product =productService.getProduct(prodNo);
		  System.out.println("product"+product);
		
		return product;
	}
	

//	@RequestMapping("/addPurchase.do")
	@RequestMapping(value="/json/addPurchase/{buyerId}/{prodNo}",method=RequestMethod.POST)
	public void addPurchase(@RequestBody Purchase purchase,
							@PathVariable String buyerId,
							@PathVariable int prodNo) throws Exception {

		System.out.println("/purchse/json/addpurchase : POST");
		System.out.println("purchase:::"+purchase);
		
		// Business Logic

		Product product = new Product();
		product.setProdNo(prodNo);
		purchase.setPurchaseProd(product);
		User user =new User();
		user.setUserId(buyerId);
		purchase.setBuyer(user);
		System.out.println("purchase"+purchase);
		
		purchaseService.addPurchase(purchase);
		System.out.println("성공");

		
	}

//	@RequestMapping("/getPurchase.do")
	@RequestMapping(value="/json/getPurchase/{tranNo}", method= RequestMethod.GET)
	public Purchase getProduct(@PathVariable int tranNo ) throws Exception {

		System.out.println("/purchase/json/getPurchase : GET");

		// Business Logic
		
		 Purchase purchase =purchaseService.getPurchase(tranNo);
		

		return purchase;
	}

//	@RequestMapping("/updatePurchaseView.do")
//	@RequestMapping(value ="updatePurchaseView", method = RequestMethod.GET)
//	public String updatePurchasetView(@RequestParam("tranNo") int tranNo,
//										Model model) throws Exception {
//
//		System.out.println("/purchase/updatePurchaseView : GET");
//		// Business Logic
//		
//		Purchase purchase= 	purchaseService.getPurchase(tranNo);
//				System.out.println("====tranNo:::"+tranNo);
//		// Model 과 View 연결
//		model.addAttribute("purchase", purchase);
//		
//
//		return "forward:/purchase/updatePurchaseView.jsp";
//	}

//	@RequestMapping("/updatePurchase.do")
	@RequestMapping(value="/json/updatePurchase/{tranNo}",method=RequestMethod.POST)
	public void updatePurchase(@RequestBody Purchase purchase, 
								 @PathVariable int tranNo) throws Exception {

		System.out.println("/purchase/json/updatePurchase : POST");
		System.out.println("====purchase 업데이트 넘어가기전 !"+purchase);
		System.out.println("====tranNo:::!!!!"+tranNo);
		
		purchase.setTranNo(tranNo);
		System.out.println("tranNo set 한 purchase::"+purchase);
		purchaseService.updatePurchase(purchase); 
		
		System.out.println("====purchase 업데이트 넘어간 후 !"+purchase);

	
	}


////	@RequestMapping("/updateTranCode.do")
	@RequestMapping(value="json/updateTranCode/{tranNo}/{tranCode}",method=RequestMethod.GET)
	public void updateTranCode(@PathVariable int tranNo,
							   @PathVariable String tranCode) throws Exception {

		System.out.println("/Purchase/json/updateTranCode : GET ");
		
		// Business Logic
		Purchase purchase = new Purchase();
		purchase.setTranNo(tranNo);
		System.out.println("tranNo::"+tranNo);
		System.out.println("tranCode::"+tranCode);
		
		purchaseService.getPurchase(tranNo);
		purchase.setTranCode(tranCode);
		System.out.println("purchase:::"+purchase);
		purchaseService.updateTranCode(purchase);
		

		
		
	}

////	@RequestMapping("/listPurchase.do")
	@RequestMapping(value="/json/listPurchase/{userId}")
	public Map<String , Object> listPurchase(@PathVariable String userId)throws Exception {

		System.out.println("/purchase/json/listPurchase : GET ");
		
		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		// Business logic 수행
		
		Map<String, Object> map = purchaseService.getPurchaseList(search,userId);
		
		//Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
		//		pageSize);
		//System.out.println("::::::::::"+resultPage);
		
		//map.put("resultPage", resultPage);


		return map;
	}
	
////	@RequestMapping("/listSale.do")
	@RequestMapping(value="/json/listSale")
	public Map<String,Object> listSale(@RequestBody Search search)throws Exception {

		System.out.println("/purchase/json/listSale : GET/POST");
		
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String, Object> map = purchaseService.getSaleList(search);
	
		
		//Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
		//		pageSize);
		//System.out.println(resultPage);
		

		

		return map;
	}
	

}