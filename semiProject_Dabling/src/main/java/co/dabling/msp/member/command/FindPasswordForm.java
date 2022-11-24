package co.dabling.msp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;

public class FindPasswordForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 비밀번호찾기 폼 호출
		return "member/findPasswordForm.tiles";
	}

}
