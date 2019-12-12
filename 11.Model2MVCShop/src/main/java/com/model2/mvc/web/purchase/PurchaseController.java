package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

//==> �ǸŰ��� Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	/// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method ���� ����

	public PurchaseController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// ���� �Ұ�
	// ==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
//	@RequestMapping("/addPurchaseView.do")
	@RequestMapping(value="addPurchase",method=RequestMethod.GET)
	public String addPurchaseView(@RequestParam("prodNo")int prodNo, Model model) throws Exception {

		System.out.println("/purchse/addPurchase : GET");
		System.out.println("prodNo:::"+prodNo);
		
		// Business Logic
		
		Product product =productService.getProduct(prodNo);
		  System.out.println("product"+product);
		//Model And View ����
		model.addAttribute("product",product);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	

//	@RequestMapping("/addPurchase.do")
	@RequestMapping(value="addPurchase",method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase,
								@RequestParam("prodNo")int prodNo,
								Model model, HttpServletRequest request) throws Exception {

		System.out.println("/purchse/addpurchase : POST");
		System.out.println("purchase:::"+purchase);
		
		// Business Logic

		Product product = new Product();
		product.setProdNo(prodNo);
		purchase.setPurchaseProd(product);
		User user =(User)request.getSession().getAttribute("user");
		purchase.setBuyer(user);
		System.out.println("purchase"+purchase);
		
		purchaseService.addPurchase(purchase);
		System.out.println("����");

		model.addAttribute("purchase",purchase);

		return "forward:/purchase/addPurchase.jsp";
	}

//	@RequestMapping("/getPurchase.do")
	@RequestMapping(value="getPurchase", method= RequestMethod.GET)
	public String getProduct(@RequestParam("tranNo") int tranNo, Model model,
								@ModelAttribute("purchase") Purchase purchase,
								HttpServletRequest request) throws Exception {
		System.out.println(tranNo);
		System.out.println("/purchase/getPurchase : GET");

		// Business Logic
		User user =(User)request.getSession().getAttribute("user");
		purchase.setBuyer(user);
		purchase.setTranNo(tranNo);
		purchase =purchaseService.getPurchase(tranNo);
		
		// Model �� View ����
		model.addAttribute("purchase", purchase);

		return "forward:/purchase/getPurchase.jsp";
	}

//	@RequestMapping("/updatePurchaseView.do")
	@RequestMapping(value ="updatePurchaseView", method = RequestMethod.GET)
	public String updatePurchasetView(@RequestParam("tranNo") int tranNo,
										Model model) throws Exception {

		System.out.println("/purchase/updatePurchaseView : GET");
		// Business Logic
		
		Purchase purchase= 	purchaseService.getPurchase(tranNo);
				System.out.println("====tranNo:::"+tranNo);
		// Model �� View ����
		model.addAttribute("purchase", purchase);
		

		return "forward:/purchase/updatePurchaseView.jsp";
	}

//	@RequestMapping("/updatePurchase.do")
	@RequestMapping(value="updatePurchase",method=RequestMethod.POST)
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase, 
								 @RequestParam("tranNo") int tranNo, 
								 @RequestParam("prodNo") int prodNo,
								 Model model,
								 HttpServletRequest request) throws Exception {

		System.out.println("/purchase/updatePurchase : POST");
		System.out.println("====purchase ������Ʈ �Ѿ���� !"+purchase);
		System.out.println("====tranNo:::!!!!"+tranNo);
		
		Product product = productService.getProduct(prodNo);
		purchase.setPurchaseProd(product);
		User user =(User)request.getSession().getAttribute("user");
		purchase.setBuyer(user);
		purchase.setTranNo(tranNo);
		
		purchaseService.updatePurchase(purchase); 
		
		System.out.println("====purchase ������Ʈ �Ѿ �� !"+purchase);

		model.addAttribute("purchase",purchaseService.getPurchase(tranNo));
	
		return "forward:/purchase/getPurchase.jsp";
	}


//	@RequestMapping("/updateTranCode.do")
	@RequestMapping(value="updateTranCode",method=RequestMethod.GET)
	public String updateTranCode(@ModelAttribute("purchase") Purchase purchase,
								@RequestParam("tranCode") String tranCode, Model model,
								@RequestParam("tranNo") int tranNo,
								HttpServletRequest request) throws Exception {

		System.out.println("/Purchase/updateTranCode : GET ");
		
		// Business Logic
		
		User user = (User)request.getSession().getAttribute("user");
//		purchase.setTranCode(tranCode);
//		purchase.setTranNo(tranNo);
//		System.out.println(tranCode);
//		System.out.println("tranNo::"+tranNo);
		purchase =purchaseService.getPurchase(tranNo);
		purchase.setTranCode(tranCode);
		System.out.println("tranCode!!!!"+purchase.getTranCode());
		System.out.println("purchase:::"+purchase);
		purchaseService.updateTranCode(purchase);
		

		if(user.getRole().equals("admin")) {
			return "forward:/purchase/listSale" ;
		}
		
		return "forward:/purchase/listPurchase";
	}

//	@RequestMapping("/listPurchase.do")
	@RequestMapping(value="listPurchase")
	public String listPurchase(@ModelAttribute("search") Search search, 
								Model model, HttpServletRequest request)throws Exception {

		System.out.println("/purchase/listPurchase : GET ");
		

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		// Business logic ����
		User user =(User)request.getSession().getAttribute("user");
		Map<String, Object> map = purchaseService.getPurchaseList(search,user.getUserId());
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("::::::::::"+resultPage);

		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		

		return "forward:/purchase/listPurchase.jsp";
	}
	
//	@RequestMapping("/listSale.do")
	@RequestMapping(value="listSale")
	public String listSale(@ModelAttribute("search") Search search, 
								Model model,
								//@RequestParam("menu") String menu,
								 HttpServletRequest request)throws Exception {

		System.out.println("/purchase/listSale : GET/POST");
		
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String, Object> map = purchaseService.getSaleList(search);
	
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
	//	model.addAttribute("tranNo", tranNo);
	//	model.addAttribute("menu", menu);
		
		

		return "forward:/purchase/listSale.jsp";
	}
}