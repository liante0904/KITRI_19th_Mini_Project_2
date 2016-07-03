package com.project.shop.seller;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int prod_num;
	private String prod_name;
	private int prod_cnt;
	private String prod_content;
	private int prod_sellcnt;
	private String id;
	private int prod_price;
	private String prod_image1;
	private String prod_image2;
	private MultipartFile file1;
	private MultipartFile file2;
	
	public Product(){}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_cnt() {
		return prod_cnt;
	}
	public void setProd_cnt(int prod_cnt) {
		this.prod_cnt = prod_cnt;
	}
	public String getProd_content() {
		return prod_content;
	}
	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}
	public int getProd_sellcnt() {
		return prod_sellcnt;
	}
	public void setProd_sellcnt(int prod_sellcnt) {
		this.prod_sellcnt = prod_sellcnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_image1() {
		return prod_image1;
	}
	public void setProd_image1(String prod_image1) {
		this.prod_image1 = prod_image1;
	}
	public String getProd_image2() {
		return prod_image2;
	}
	public void setProd_image2(String prod_image2) {
		this.prod_image2 = prod_image2;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public Product(int prod_num, String prod_name, int prod_cnt, String prod_content, int prod_sellcnt, String id,
			int prod_price, String prod_image1, String prod_image2, MultipartFile file1, MultipartFile file2) {
		this.prod_num = prod_num;
		this.prod_name = prod_name;
		this.prod_cnt = prod_cnt;
		this.prod_content = prod_content;
		this.prod_sellcnt = prod_sellcnt;
		this.id = id;
		this.prod_price = prod_price;
		this.prod_image1 = prod_image1;
		this.prod_image2 = prod_image2;
		this.file1 = file1;
		this.file2 = file2;
	}
	@Override
	public String toString() {
		return "Product [prod_num=" + prod_num + ", prod_name=" + prod_name + ", prod_cnt=" + prod_cnt
				+ ", prod_content=" + prod_content + ", prod_sellcnt=" + prod_sellcnt + ", id=" + id + ", prod_price="
				+ prod_price + ", prod_image1=" + prod_image1 + ", prod_image2=" + prod_image2 + ", file1=" + file1
				+ ", file2=" + file2 + "]";
	}
	

	
}
