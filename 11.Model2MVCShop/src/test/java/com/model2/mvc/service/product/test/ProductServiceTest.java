package com.model2.mvc.service.product.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class ProductServiceTest {

	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	//@Test
	public void testAddProduct() throws Exception {

		Product product = new Product();
		product.setProdName("testProdName");
		product.setProdDetail("testprodDetail");
		product.setPrice(Integer.parseInt("5000"));
		product.setManuDate("20190101");
		product.setFileName("testFileName");
		
		productService.addProduct(product);
		
		product= productService.getProduct(10031);
	
		// ==> console 확인
		 System.out.println("product::"+product);

		// ==> API 확인
		Assert.assertEquals("testProdName", product.getProdName());
		Assert.assertEquals(10031, product.getProdNo());
		Assert.assertEquals("testprodDetail", product.getProdDetail());
		Assert.assertEquals(5000,product.getPrice());
		Assert.assertEquals("20190101", product.getManuDate());
		Assert.assertEquals("testFileName", product.getFileName());
		
	}

	//@Test
	public void testGetProduct() throws Exception {
		
	Product	product= productService.getProduct(10031);
		
	
	// ==> API 확인
	Assert.assertEquals("testProdName", product.getProdName());
	Assert.assertEquals(10031, product.getProdNo());
	Assert.assertEquals("testprodDetail", product.getProdDetail());
	Assert.assertEquals(5000,product.getPrice());
	Assert.assertEquals("20190101", product.getManuDate());
	Assert.assertEquals("testFileName", product.getFileName());
			
	Assert.assertNotNull(productService.getProduct(10004));
	Assert.assertNotNull(productService.getProduct(10000));
	
	}
	//@Test
	public void testUpdateProduct() throws Exception{
		
		Product product = productService.getProduct(10031);
		Assert.assertNotNull(10031);
		
		Assert.assertEquals("testProdName", product.getProdName());
		Assert.assertEquals(10031, product.getProdNo());
		Assert.assertEquals("testprodDetail", product.getProdDetail());
		Assert.assertEquals(5000,product.getPrice());
		Assert.assertEquals("20190101", product.getManuDate());
		Assert.assertEquals("testFileName", product.getFileName());
		
		product.setPrice(3000);
		product.setProdName("바꾼다");
		product.setProdDetail("바꾼상품정보");
		
		productService.updateProduct(product);
		Assert.assertNotNull(10031);
		
		Assert.assertEquals(3000,product.getPrice());
		Assert.assertEquals("바꾼다", product.getProdName());
		Assert.assertEquals("바꾼상품정보", product.getProdDetail());
	}
	
	//@Test
	public void testGetProductListAll() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String,Object>map = productService.getProductList(search);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
		
		System.out.println("=======================================");
		
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("");
		map=productService.getProductList(search);
		
		list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		
		totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
		
	}
	
	//@Test
	 public void testGetProductListByProdNo() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("10000");
		Map<String,Object>map = productService.getProductList(search);
	
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(1, list.size());
		
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
		
		System.out.println("=======================================");
		
		search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
		
	}
	
	 //@Test
	 public void testGetProductListByProdName() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("1");
		search.setSearchKeyword("인라인");
		Map<String,Object>map = productService.getProductList(search);
	
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(1, list.size());
		
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
		
		System.out.println("=======================================");
		
		search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
		
	}
	
	 @Test
	 public void testGetProductListByPrice() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("2");
		search.setSearchKeyword("3000");
		Map<String,Object>map = productService.getProductList(search);
	
		List<Object> list = (List<Object>)map.get("list");
		System.out.println(map.get("list"));
		Assert.assertEquals(1, list.size());
		
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
		
		System.out.println("=======================================");
		
		search.setSearchCondition("2");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
		
	}
	

	
}
