package co.dabling.msp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;
import co.dabling.msp.member.vo.MemberVO;

public class MemberLogin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 처리.
		MemberService dao = new MemberServiceImpl();
		MemberVO member = new MemberVO();
		HttpSession session = request.getSession();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		member = dao.memberLogin(email, password);
		if (member != null) {
			session.setAttribute("memberCode", member.getMemberCode());
			session.setAttribute("email", member.getEmail());
			session.setAttribute("name", member.getName());
			session.setAttribute("phone", member.getPhone());
			session.setAttribute("businessNum", member.getBusinessNum());
			session.setAttribute("author", member.getAuthor());
			return "mainPage.do";
		}
		return "member/memberLogin.tiles";
	}

}
