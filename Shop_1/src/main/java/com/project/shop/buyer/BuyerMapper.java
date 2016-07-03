package com.project.shop.buyer;

import java.util.List;

public interface BuyerMapper {

	//īƮ
	void insertCart(Cart c);
	
	
	void deleteCart(int cart_num);
	
	List<Cart> selectCart(String id);
	
	
	Buy selectBuyByNum(int buy_num);
	// buy
	void insertBuy(Buy p);
	Cart selectCartByNum(int cart_num);
	List<Buy> selectBuy(String id); // īƮ ��ü����
	void deleteBuy(int buy_num);
	void UpdateByPay(int buy_num);
	void UpdateByPay2(int buy_num);
	//comment

	void insertCmt(Comment c);

	void deleteCmt(int cmt_num);

	List<Comment> selectCmt(int prod_num);
	

}
