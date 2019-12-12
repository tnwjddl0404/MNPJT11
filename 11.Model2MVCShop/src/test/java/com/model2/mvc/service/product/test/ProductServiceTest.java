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
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class ProductServiceTest {

	// ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
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
	
		// ==> console Ȯ��
		 System.out.println("product::"+product);

		// ==> API Ȯ��
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
		
	
	// ==> API Ȯ��
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
		product.setProdName("�ٲ۴�");
		product.setProdDetail("�ٲۻ�ǰ����");
		
		productService.updateProduct(product);
		Assert.assertNotNull(10031);
		
		Assert.assertEquals(3000,product.getPrice());
		Assert.assertEquals("�ٲ۴�", product.getProdName());
		Assert.assertEquals("�ٲۻ�ǰ����", product.getProdDetail());
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
	 	
		//==> console Ȯ��
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
		search.setSearchKeyword("�ζ���");
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
	 	
		//==> console Ȯ��
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
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
		
	}
	

	
}
