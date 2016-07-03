package com.project.shop.buyer;

public class Cart {
	private int cart_num;
	private int prod_num;
	private String id;
	private int cart_cnt;
	private int prod_price;
	private String seller_id;
	private String prod_name;
	private String prod_image1;
	
	public Cart(){}

	public Cart(int cart_num, int prod_num, String id, int cart_cnt, int prod_price, String seller_id, String prod_name,
			String prod_image1) {
		this.cart_num = cart_num;
		this.prod_num = prod_num;
		this.id = id;
		this.cart_cnt = cart_cnt;
		this.prod_price = prod_price;
		this.seller_id = seller_id;
		this.prod_name = prod_name;
		this.prod_image1 = prod_image1;
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCart_cnt() {
		return cart_cnt;
	}

	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_image1() {
		return prod_image1;
	}

	public void setProd_image1(String prod_image1) {
		this.prod_image1 = prod_image1;
	}

	@Override
	public String toString() {
		return "Cart [cart_num=" + cart_num + ", prod_num=" + prod_num + ", id=" + id + ", cart_cnt=" + cart_cnt
				+ ", prod_price=" + prod_price + ", seller_id=" + seller_id + ", prod_name=" + prod_name
				+ ", prod_image1=" + prod_image1 + "]";
	}
	
	
}
