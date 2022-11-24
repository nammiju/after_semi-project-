package co.dabling.msp.reply.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.relpy.service.ReplyServcie;
import co.dabling.msp.relpy.service.impl.ReplyServiceImpl;
import co.dabling.msp.relpy.vo.ReplyVO;

public class DdeleteReply implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ReplyServcie service = new ReplyServiceImpl();
		
		int reservationCode = Integer.parseInt(request.getParameter("reservationCode"));
		int a = service.deleteReply(reservationCode);
		String message ="답글 삭제 실패";
		if(a!=0) {
			message ="답글 삭제 완료";			
		}
		
		return "ajax:"+message;
	}

}
