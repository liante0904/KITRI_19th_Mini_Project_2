package com.project.shop.buyer;

 

public class Comment {

	private int cmt_num;

	private String cmt_comment;

	private int cmt_score;

	private int prod_num;

	private String id;

	

	public Comment() {

 

	}

	public Comment(int cmt_num, String cmt_comment, int cmt_score, int prod_num, String id) {

		super();

		this.cmt_num = cmt_num;

		this.cmt_comment = cmt_comment;

		this.cmt_score = cmt_score;

		this.prod_num = prod_num;

		this.id = id;

	}

	@Override

	public String toString() {

		return "Comment [cmt_num=" + cmt_num + ", cmt_comment=" + cmt_comment + ", cmt_score=" + cmt_score

				+ ", prod_num=" + prod_num + ", id=" + id + "]";

	}

	public int getCmt_num() {

		return cmt_num;

	}

	public void setCmt_num(int cmt_num) {

		this.cmt_num = cmt_num;

	}

	public String getCmt_comment() {

		return cmt_comment;

	}

	public void setCmt_comment(String cmt_comment) {

		this.cmt_comment = cmt_comment;

	}

	public int getCmt_score() {

		return cmt_score;

	}

	public void setCmt_score(int cmt_score) {

		this.cmt_score = cmt_score;

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

	

	

}
