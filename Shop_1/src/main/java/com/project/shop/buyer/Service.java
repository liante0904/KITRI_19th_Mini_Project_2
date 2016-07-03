package com.project.shop.buyer;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.project.shop.seller.Product;

@Component("buyerService")
public class Service implements BuyerService {


	@Resource(name="sqlSession")
	private SqlSession SqlSession;
	
	
	
	void setSqlSession(SqlSession sqlSession) {
		SqlSession = sqlSession;
	}

	@Override
	public void AddCart(Cart c) {
		// TODO Auto-generated method stub
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		buyermapper.insertCart(c);
	

	}

	@Override
	public void DelProduct(int cart_num) {
		// TODO Auto-generated method stub
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		buyermapper.deleteCart(cart_num);
	}

	@Override
	public List<Buy> selectBuy(String id) {
		// TODO Auto-generated method stub
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		return buyermapper.selectBuy(id);
	}

	@Override
	public List<Cart> selectCart(String id) {
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		return buyermapper.selectCart(id);
	}

	@Override
	public void BuyProduct(Buy b) {
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		System.out.println("여기 서비스"+b.getId() + b.getProd_num() + b.getBuy_cnt() + b.getBuy_pay());
		buyermapper.insertBuy(b);		
	}

	@Override
	public Cart selectCartByNum(int cart_num) {
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		return buyermapper.selectCartByNum(cart_num);
	}

	@Override
	public void deleteBuy(int buy_num) {
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		buyermapper.deleteBuy(buy_num);
		
	}

	@Override
	public Buy selectBuyByNum(int buy_num) {
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		return buyermapper.selectBuyByNum(buy_num);
	}

	@Override

	public void insertCmt(Comment c) {

		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);

		buyermapper.insertCmt(c);

	}

 

	@Override

	public void deleteCmt(int cmt_num) {

		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);

		buyermapper.deleteCmt(cmt_num);

		

	}

 

	@Override

	public List<Comment> selectCmt(int prod_num) {

		System.out.println("서비스");

		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);

		return buyermapper.selectCmt(prod_num);

	}

	@Override
	public void UpdateByPay(int buy_num) {
		BuyerMapper buyermapper = SqlSession.getMapper(BuyerMapper.class);
		buyermapper.UpdateByPay(buy_num);
		
	}

	@Override
	public void UpdateByPay2(int buy_num) {
		BuyerMapper buyerMapper = SqlSession.getMapper(BuyerMapper.class);
		buyerMapper.UpdateByPay2(buy_num);
	}


}
