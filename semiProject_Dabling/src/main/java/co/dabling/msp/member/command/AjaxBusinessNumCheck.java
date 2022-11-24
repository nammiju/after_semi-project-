package co.dabling.msp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;

public class AjaxBusinessNumCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// ajax 사업자번호 중복체크.
		MemberService dao = new MemberServiceImpl();
		String businessNum = request.getParameter("businessNum");
		boolean check = dao.isBusinessNumCheck(businessNum); // 존재하면 false리턴.
		String result = "0";

		if (check) {
			result = "1";
		}
		return "ajax:" + result;
	}

}
