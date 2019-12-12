package com.model2.mvc.service.purchase;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {

	public void addPurchase(Purchase purchase) throws Exception;
		
	public Purchase getPurchase(int tranNo) throws Exception;
		
	public List<Purchase> getPurchaseList(Search search,String buyerId) throws Exception;
	
	public List<Purchase> getSaleList(Search search) throws Exception;
	
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;
	
	//게시판  page 처리를 위한 전체 ROW(totalCount)  return
	public int getTotalCount(Search search,String buyerId) throws Exception;
	
	public int getTotalCountSale(Search search) throws Exception;

}
