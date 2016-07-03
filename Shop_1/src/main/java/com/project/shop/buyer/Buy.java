package com.project.shop.buyer;

import java.sql.Date;

public class Buy {
	private int buy_num;
	private String id;
	private int prod_num;
	private int buy_cnt;
	private Date buy_date;
	private int buy_pay;
	private int prod_price;
	private String seller_id;
	private String prod_name;
	private String prod_image1;
	
	public Buy(){}

	public Buy(int buy_num, String id, int prod_num, int buy_cnt, Date buy_date, int buy_pay, int prod_price,
			String seller_id, String prod_name, String prod_image1) {
		this.buy_num = buy_num;
		this.id = id;
		this.prod_num = prod_num;
		this.buy_cnt = buy_cnt;
		this.buy_date = buy_date;
		this.buy_pay = buy_pay;
		this.prod_price = prod_price;
		this.seller_id = seller_id;
		this.prod_name = prod_name;
		this.prod_image1 = prod_image1;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public int getBuy_cnt() {
		return buy_cnt;
	}

	public void setBuy_cnt(int buy_cnt) {
		this.buy_cnt = buy_cnt;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	public int getBuy_pay() {
		return buy_pay;
	}

	public void setBuy_pay(int buy_pay) {
		this.buy_pay = buy_pay;
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
		return "Buy [buy_num=" + buy_num + ", id=" + id + ", prod_num=" + prod_num + ", buy_cnt=" + buy_cnt
				+ ", buy_date=" + buy_date + ", buy_pay=" + buy_pay + ", prod_price=" + prod_price + ", seller_id="
				+ seller_id + ", prod_name=" + prod_name + ", prod_image1=" + prod_image1 + "]";
	}


	
}
