package com.model2.mvc.service.purchase.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;

import junit.framework.Assert;

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
public class PurchaseServiceTest {

	// ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	// @Test
	public void testAddPurchase() throws Exception {
		System.out.println("purchase: set ���� ");

		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		product.setProdNo(10000); // test prodNo
		purchase.setPurchaseProd(product);
		user.setUserId("user13");
		purchase.setBuyer(user);
		purchase.setPaymentOption("1");
		purchase.setReceiverName("testReceiverName");
		purchase.setReceiverPhone("testPhone");
		purchase.setDivyAddr("testDivyAddr");
		purchase.setDivyDate("20190101");
		purchase.setDivyRequest("������");

		System.out.println(purchase);
		System.out.println("purchase: set �� ");

		purchaseService.addPurchase(purchase);

		purchase = purchaseService.getPurchase(11); // tranNo

		// ==> console Ȯ��
		System.out.println("purchase::" + purchase);

		// ==> API Ȯ��

		Assert.assertEquals(10007, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user12", purchase.getBuyer().getUserId());
		Assert.assertEquals("1", purchase.getPaymentOption().trim());
		Assert.assertEquals("SCOTT", purchase.getReceiverName());
		Assert.assertEquals("01095658465", purchase.getReceiverPhone());
		Assert.assertEquals(null, purchase.getDivyAddr());
		Assert.assertEquals(null, purchase.getDivyDate());
		Assert.assertEquals(null, purchase.getDivyRequest());

	}

	 //@Test
	public void testGetPurchase() throws Exception {

		Purchase purchase = purchaseService.getPurchase(112);

		// ==> API Ȯ��

		Assert.assertEquals(10000, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user13", purchase.getBuyer().getUserId());
		Assert.assertEquals("1", purchase.getPaymentOption().trim());
		Assert.assertEquals("�ٲ��̸�", purchase.getReceiverName());
		Assert.assertEquals("0000", purchase.getReceiverPhone());
		Assert.assertEquals("testDivyAddr", purchase.getDivyAddr());
		Assert.assertEquals(null, purchase.getDivyDate());

		Assert.assertNotNull(purchaseService.getPurchase(110));
		Assert.assertNotNull(purchaseService.getPurchase(111));

	}

	// @Test
	public void testUpdatePurchase() throws Exception {

		Purchase purchase = purchaseService.getPurchase(112);
		Assert.assertNotNull(112);

		Assert.assertEquals(10000, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user13", purchase.getBuyer().getUserId());
		Assert.assertEquals("1", purchase.getPaymentOption().trim());
		Assert.assertEquals("testReceiverName", purchase.getReceiverName());
		Assert.assertEquals("testPhone", purchase.getReceiverPhone());
		Assert.assertEquals("testDivyAddr", purchase.getDivyAddr());
		Assert.assertEquals(null, purchase.getDivyDate());

		purchase.setReceiverName("����");
		purchase.setReceiverPhone("0001");

		purchaseService.updatePurchase(purchase);
		Assert.assertNotNull(112);

		Assert.assertEquals("����", purchase.getReceiverName());
		Assert.assertEquals("0001", purchase.getReceiverPhone());

	}

	 //@Test
	public void testUpdateTranCode() throws Exception {

		Purchase purchase = purchaseService.getPurchase(104);
		Assert.assertNotNull(104);

		Assert.assertEquals("2", purchase.getTranCode().trim());

		purchase.setTranCode("3");

		purchaseService.updateTranCode(purchase);
		Assert.assertNotNull(104);
		Assert.assertEquals("3", purchase.getTranCode().trim());

	}

	//@Test
	public void testGetPurchaseListAll() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		

		Map<String, Object> map = purchaseService.getPurchaseList(search, "user13");

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("=======================================");

		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("");

		map = purchaseService.getPurchaseList(search, "user13");

		list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

	}
	
	@Test
		public void testGetSaleList() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String, Object> map = purchaseService.getSaleList(search);
		
		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("=======================================");

		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("");

		map = purchaseService.getSaleList(search);

		list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
		
		
		
		
	}
	
	
	
	

}
