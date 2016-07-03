package com.project.shop.seller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.project.shop.buyer.Buy;

@Component("prodService")
public class Service implements ProductService {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertProd(Product p) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		ProductMapper.insertProd(p);
	}

	@Override
	public void deleteProd(int num) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		ProductMapper.deleteProd(num);
	}

	@Override
	public List<Product> selectProd() {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> lp = ProductMapper.selectProd();
		return lp;
	}

	@Override
	public List<Product> selectProdByName(String PROD_NAME) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> lp = ProductMapper.selectProdByName(PROD_NAME);
		return lp;
	}

	@Override
	public List<Product> selectProdByCont(String PROD_CONTENT) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> lp = ProductMapper.selectProdByCont(PROD_CONTENT);
		return lp;
	}

	@Override
	public List<Product> selectProdById(String ID) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> lp = ProductMapper.selectProdById(ID);
		return lp;
	}

	@Override
	public Product selectProdByNum(int NUM) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		Product lp = ProductMapper.selectProdByNum(NUM);
		return lp;
	}

	@Override
	public Product select(int num) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		return ProductMapper.select(num);
	}

	@Override
	public void updateProdAsCnt(HashMap map) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		ProductMapper.updateProdAsCnt(map);
	}

	@Override
	public List<Product> selectUpperprod_price() {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> lp = ProductMapper.selectUpperprod_price();
		return lp;
	}

	@Override
	public List<Product> selectUpperprod_sellcnt() {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> lp = ProductMapper.selectUpperprod_price();
		return lp;
	}

	@Override
	public void updateProd(Product p) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		ProductMapper.updateProd(p);
	}

	@Override
	public List<Buy> selectByPay(String ID) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		return ProductMapper.selectByPay(ID);
	}

	@Override
	public void UpdateByPay(int buy_num) {
		ProductMapper ProductMapper = sqlSession.getMapper(ProductMapper.class);
		ProductMapper.UpdateByPay(buy_num);
	}

}
