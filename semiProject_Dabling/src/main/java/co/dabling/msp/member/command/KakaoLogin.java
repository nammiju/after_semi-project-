package co.dabling.msp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;
import co.dabling.msp.member.vo.MemberVO;

public class KakaoLogin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 카카오 로그인 처리
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		boolean check = dao.isMemberEmailCheck(email); // 존재하면 false리턴.
		System.out.println(email);
		if (check) {
			return "member/memberJoinForm.tiles";
		} else {
			String password = "0000";
			dao.memberPasswordUpdate(email, password);
			vo = dao.memberLogin(email, password);
			if (vo != null) {
				session.setAttribute("memberCode", vo.getMemberCode());
				session.setAttribute("email", vo.getEmail());
				session.setAttribute("name", vo.getName());
				session.setAttribute("phone", vo.getPhone());
				session.setAttribute("businessNum", vo.getBusinessNum());
				session.setAttribute("author", vo.getAuthor());
			}
			return "member/memberInfoUpdateForm.tiles";
		}
	}

}
