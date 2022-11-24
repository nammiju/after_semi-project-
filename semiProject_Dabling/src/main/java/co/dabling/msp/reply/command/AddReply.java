package co.dabling.msp.reply.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.relpy.service.ReplyServcie;
import co.dabling.msp.relpy.service.impl.ReplyServiceImpl;
import co.dabling.msp.relpy.vo.ReplyVO;

public class AddReply implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ReplyServcie service = new ReplyServiceImpl();
		ReplyVO reply = new ReplyVO();
		
		int reservationCode = Integer.parseInt(request.getParameter("reservationCode"));
		String content = request.getParameter("content");
		reply.setReservationCode(reservationCode);
		reply.setContent(content);
		int a = service.insertReply(reply);
		String message ="답글 등록 실패";
		if(a!=0) {
			message ="답글 등록 완료";			
		}
		
		return "ajax:"+message;
	}

}
