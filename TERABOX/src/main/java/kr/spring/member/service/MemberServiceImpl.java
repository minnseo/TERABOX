package kr.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional //transaction 단위로 처리되게끔
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper memberMapper;
	
	//회원관리 - 일반회원
	//회원가입
	@Override
	public void insertMember(MemberVO member) {
		//3개의 SQL문장이 하나의 트랜잭션 단위가 됨
		member.setMem_num(memberMapper.selectMem_num());
		memberMapper.insertMember(member);
		memberMapper.insertMember_detail(member);
	}

	@Override
	public MemberVO selectCheckMember(String id) {
		return memberMapper.selectCheckMember(id);
	}

	@Override
	public MemberVO selectMember(Integer mem_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePassword(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(Integer mem_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAu_id(String au_id, int mem_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO selectAu_id(String au_id) {
		return null;
	}

	@Override
	public void deleteAu_id(int mem_num) {
		// TODO Auto-generated method stub
		
	}
	
}
