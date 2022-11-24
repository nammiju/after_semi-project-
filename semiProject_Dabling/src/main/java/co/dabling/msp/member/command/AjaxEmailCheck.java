package co.dabling.msp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;

public class AjaxEmailCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// ajax 이메일 중복체크.
		MemberService dao = new MemberServiceImpl();
		String email = request.getParameter("email");
		boolean check = dao.isMemberEmailCheck(email); // 존재하면 false리턴.
		String result = "0"; //중복

		if (check) {
			result = "1"; // 없음
		}
		return "ajax:" + result;
	}

}
