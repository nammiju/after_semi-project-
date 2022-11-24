package co.dabling.msp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;
import co.dabling.msp.member.vo.MemberVO;

public class MemberInfoUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원정보수정
		HttpSession session = request.getSession();
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		int memberCode = (int) session.getAttribute("memberCode");
		String memberName = (String) session.getAttribute("name");
		int author = (int) session.getAttribute("author");

		vo.setMemberCode(memberCode);
		vo.setEmail(request.getParameter("email"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(memberName);
		vo.setPhone(request.getParameter("phone"));
		vo.setAuthor(Integer.parseInt(request.getParameter("author"))) ;
		session.setAttribute("phone", vo.getPhone());
		session.setAttribute(memberName, memberName);
		dao.memberUpdate(vo);
		
		return "member/memberInfoMsg.tiles";
	}

}
