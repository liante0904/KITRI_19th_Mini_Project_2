package com.project.shop.seller;

import java.util.HashMap;
import java.util.List;

import com.project.shop.buyer.Buy;

public interface ProductMapper {
	void insertProd(Product p);
	void deleteProd(int num);
	Product select(int num);
	List<Product> selectProd();
	List<Product> selectProdByName(String PROD_NAME);
	List<Product> selectProdByCont(String PROD_CONTENT);
	List<Product> selectProdById(String id);
	Product selectProdByNum(int num);
	void updateProdAsCnt(HashMap map);
	List<Product> selectUpperprod_price();
	List<Product> selectUpperprod_sellcnt();
	void updateProd(Product p);
	List<Buy> selectByPay(String id);
	void UpdateByPay(int buy_num);
}
