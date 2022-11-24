package co.dabling.msp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;
import co.dabling.msp.member.vo.MemberVO;

public class MemberInfoUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 일반회원정보 다가져오기

		HttpSession session = request.getSession();
		MemberService dao = new MemberServiceImpl();
		MemberVO member = new MemberVO();
		int memberCode = (int) session.getAttribute("memberCode");
		member.setMemberCode(memberCode);
		int author = (int) session.getAttribute("author");
		member.setAuthor(author);

		request.setAttribute("memberInfo", dao.memberSelect(member.getMemberCode()));
		request.setAttribute("author", author);
		// 회원정보수정 폼 호출
		return "member/memberInfoUpdateForm.tiles";
	}

}
