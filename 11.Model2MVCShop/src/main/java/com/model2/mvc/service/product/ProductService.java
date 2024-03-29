package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductService {

	//상품등록
	public void addProduct(Product product) throws Exception;
	
	//상품상세보기
	public Product getProduct(int product) throws Exception;
	
	//상품정보리스트
	public Map<String , Object> getProductList(Search search) throws Exception;

	//상품정보수정
	public void updateProduct(Product product) throws Exception;
	
	//
	
}
