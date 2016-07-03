package com.project.shop.buyer;

import java.util.List;

import com.project.shop.seller.Product;


public interface BuyerService {

	// īƮ ���
	void AddCart(Cart c); // �����ϱ�
	void DelProduct(int cart_num); //īƮ ����(������� ������)
	List<Buy> selectBuy(String id);
	// Buy���
	void BuyProduct(Buy p); // ��ٱ��Ͽ��� �����ϱ�
	List<Cart> selectCart(String id);
	Cart selectCartByNum(int cart_num);
	void deleteBuy(int buy_num);
	Buy selectBuyByNum(int buy_num);
	void UpdateByPay(int buy_num);
	void UpdateByPay2(int buy_num);
	//comment

	void insertCmt(Comment c);

	void deleteCmt(int cmt_num);

	List<Comment> selectCmt(int prod_num);
}
