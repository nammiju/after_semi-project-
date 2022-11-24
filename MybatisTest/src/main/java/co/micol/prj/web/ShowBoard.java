package co.micol.prj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.common.Command;

public class ShowBoard implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 페이지 이동~~
		return "board/ShowBoard.tiles";
	}

}
