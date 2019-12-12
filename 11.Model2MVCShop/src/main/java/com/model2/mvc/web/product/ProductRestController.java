package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

//==>상품관리 Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	/// Field
	@Autowired
	private ProductService productService;
	// setter Method 구현 않음

	public ProductRestController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// 참조 할것
//	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	 
	/* @RequestMapping("/addProduct.do") */
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct( @RequestBody Product product) throws Exception {

		System.out.println("/product/addProduct : POST");
		System.out.println();
		System.out.println("[From Client Data]");
		System.out.println("1:" + product);
		
		// Business Logic
		//product.setManuDate(manuDate.replace("-",""));
		
		productService.addProduct(product);
		
		return product;

	}

	/* @RequestMapping("/getProduct.do") */
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {

		
		System.out.println("/product/json/getProduct : GET");
		
		// Business Logic
		return productService.getProduct(prodNo);

	}

	/* @RequestMapping("/updateProductView.do") */ //해야되는건지 잘모르겠음..
	@RequestMapping(value="json/updateProduct/{prodNo}", method=RequestMethod.GET)
	public Product updateProductView(@PathVariable int prodNo) throws Exception {

		System.out.println("/product/json/updateProduct: GET");
		// Business Logic
		
		Product product =productService.getProduct(prodNo);
				
		// Model 과 View 연결
		//model.addAttribute("product", product);

		return product;
	}
	
//
//	/* @RequestMapping("/updateProduct.do") */
	@RequestMapping(value="json/updateProduct", method=RequestMethod.POST)
	public void updateProduct(@RequestBody Product product) throws Exception {

		System.out.println("/product/json/updateProduct: POST");
		System.out.println("product:::"+product);
		// Business Logic
		//product.setManuDate(manuDate.replace("-",""));
		productService.updateProduct(product); ;

	//	model.addAttribute("product", productService.getProduct(product.getProdNo()));
		
	
	}

//
//	/* @RequestMapping("/listProduct.do") */
//	@RequestMapping(value="json/listProduct" ,  method=RequestMethod.GET)
//	public Map<String , Object> listProduct()throws Exception {
//
//		System.out.println("/product/json/listProduct: GET");
//		
//		Search search = new Search();
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//
//		// Business logic 수행
//		Map<String, Object> map = productService.getProductList(search);
//		
//		System.out.println(map);
//
//		//Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				//pageSize);
//	//	System.out.println(resultPage);
//
//		// Model 과 View 연결
//	//	map.put("resultPage", resultPage);
//		
//		
//
//		return map;
//	}
	
//	/* @RequestMapping("/listProduct.do") */
	@RequestMapping(value="/json/listProduct" ,  method=RequestMethod.POST)
	public Map<String , Object> listProduct(@RequestBody Search search)throws Exception {

		System.out.println("/product/json/listProduct: POST");
		

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		 System.out.println("search"+search);
		System.out.println("가기전");
		// Business logic 수행
		Map<String, Object> map = productService.getProductList(search);
		
		System.out.println("갔다옴");
		System.out.println(map);

//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);


		return map;
	}
}