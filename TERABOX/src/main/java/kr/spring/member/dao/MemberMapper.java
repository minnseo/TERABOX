package kr.spring.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	//회원관리 - 일반회원
	//회원번호 생성
	@Select("SELECT spmember_seq.nextval FROM dual")
	public int selectMem_num();
	
	//회원가입
	@Insert("INSERT INTO spmember (mem_num,id,nick_name) VALUES (#{mem_num},#{id},#{nick_name})")
	public void insertMember(MemberVO member);
	public void insertMember_detail(MemberVO member);
	
	//ID를 이용한 회원정보 체크
	public MemberVO selectCheckMember(String id);
	
	//회원번호를 이용한 회원정보 구하기
	public MemberVO selectMember(Integer mem_num);
	
	//회원정보 수정
	public void updateMember(MemberVO member);
	public void updateMember_detail(MemberVO member);
	
	//비밀번호 수정
	public void updatePassword(MemberVO member);
	
	//회원탈퇴
	public void deleteMember(Integer mem_num);
	public void deleteMember_detail(Integer mem_num);
	
	//자동 로그인				//mybatis3의 경우, @Param을 이용하여 여러 개의 파라미터 명시 가능
	public void updateAu_id(@Param("au_id") String au_id, @Param("mem_num") int mem_num);
	public MemberVO selectAu_id(String au_id);
	public void deleteAu_id(int mem_num);
}
