package co.dabling.msp.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dabling.msp.member.vo.MemberVO;

public interface MemberMapper {
	List<MemberVO> memberList(); // 전체 회원 목록
 
	MemberVO memberSelect(int memberCode); // 회원 한명 조회

	int memberInsert(MemberVO vo); // 회원 등록(가입)

	int memberUpdate(MemberVO vo); // 회원 수정(권한 변경)

	MemberVO memberLogin(@Param("email") String email, @Param("password") String password); // 로그인.
		
	
	boolean isMemberEmailCheck(String email); // 중복되는 이메일이면 false 리턴
	boolean isBusinessNumCheck(String businessNum); // 중복되는 사업자 번호면 false 리턴

	void memberPasswordUpdate(@Param("email") String email, @Param("password") String password); // 임시비번으로 바꿈.
	
	public int totalCnt(); // 전체 row 수 카운트

	public List<MemberVO> pageList(int pg);
}
