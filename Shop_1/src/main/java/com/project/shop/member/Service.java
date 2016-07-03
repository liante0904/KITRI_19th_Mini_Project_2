package com.project.shop.member;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.project.shop.seller.ProductMapper;

@Component("memService")
public class Service implements MemberService {

	
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

	
	
	@Override
	public void addMember(Member m) {
		MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
		membermapper.insertMember(m);
	}

	@Override
	public Member getMember(String id) {
		MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
		return membermapper.getMember(id);
	}

	@Override
	public boolean login(Member m) {
		MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println(m.getId()+ "서비스단");
		Member login_chk= membermapper.getMember(m.getId());
		
		if (login_chk.getId().equals(m.getId())) {
			if (login_chk.getPwd().equals(m.getPwd())) {
				return true;
				//로그인 성공
			}
		}else {
		return false;
		}
		return false;
	}

	@Override
	public void editMember(Member m) {
		MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
		membermapper.updateMember(m);
	}

	@Override
	public void delMember(String id) {
		MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
		membermapper.deleteMember(id);
	
	}

}
