package co.dabling.msp.reservation.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.reservation.service.ReservationService;
import co.dabling.msp.reservation.service.impl.ReservationServiceImpl;
import co.dabling.msp.reservation.vo.ReservationVO;

public class MakeReservation implements Command {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      System.out.println("MakeReservation도착");

      ReservationService service = new ReservationServiceImpl();
      ReservationVO reservation = new ReservationVO();
   
      int memberCode = Integer.parseInt(request.getParameter("memberCode"));
      int storeCode = Integer.parseInt(request.getParameter("storeCode"));
      String time = request.getParameter("time");
      String stringDate = request.getParameter("date");
      int person = Integer.parseInt(request.getParameter("person"));

      
      if(stringDate.contains("/")) {
         stringDate = stringDate.replace("/", "-");         
      }
      
      Date date = Date.valueOf(stringDate);
      
      System.out.println(date);
      
      reservation.setMemberCode(memberCode);
      reservation.setStoreCode(storeCode);
      reservation.setReservationDate(date);
      reservation.setReservationTime(time);
      reservation.setReservationPeople(person);
      
      int book = service.reservationInsert(reservation) ;
      String message =null;
      if(book>0) {
         message ="예약완료";
      }else {
         message ="예약실패";
      }
      
      return "ajax:"+message;
   }

}