package com.project.shop.member;


public interface MemberService {

	void addMember(Member m);

	Member getMember(String id);

	boolean login(Member m);

	void editMember(Member m);

	void delMember(String id);
	
}
