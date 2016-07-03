package com.project.shop.seller;

import java.util.HashMap;
import java.util.List;

import com.project.shop.buyer.Buy;

public interface ProductService {
	void insertProd(Product p);
	void deleteProd(int num);
	Product select(int num);
	List<Product> selectProd();
	List<Product> selectProdByName(String PROD_NAME);
	List<Product> selectProdByCont(String PROD_CONTENT);
	List<Product> selectProdById(String ID);
	Product selectProdByNum(int NUM);
	void updateProdAsCnt(HashMap map);
	List<Product> selectUpperprod_price();
	List<Product> selectUpperprod_sellcnt();
	void updateProd(Product p);
	List<Buy> selectByPay(String ID);
	void UpdateByPay(int buy_num);
}
