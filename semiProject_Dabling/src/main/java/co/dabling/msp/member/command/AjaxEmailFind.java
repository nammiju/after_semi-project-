package co.dabling.msp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;

public class AjaxEmailFind implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원 계정에 입력한 이메일이 있는지 찾아줌
		MemberService dao = new MemberServiceImpl();
		String email = request.getParameter("email");
		boolean check = dao.isMemberEmailCheck(email); // 존재하면 false리턴.
		String result = "0";

		if (check) {
			result = "1";
		}
		return "ajax:" + result;
	}

}
