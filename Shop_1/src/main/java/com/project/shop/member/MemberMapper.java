package com.project.shop.member;

public interface MemberMapper {

	
	

	Member getMember(String id);
	
	void insertMember(Member m);
	
	void updateMember(Member m);
	
	void deleteMember(String id);
	
	
}
