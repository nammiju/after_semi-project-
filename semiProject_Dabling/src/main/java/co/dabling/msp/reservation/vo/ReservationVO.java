package co.dabling.msp.reservation.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationVO {
	private int reservationCode;
	private int memberCode;
	private String name;
	private String phone;
	private int storeCode;
	@JsonFormat(pattern = "yyyy-MM-dd", locale = "Asia/Seoul")
	private Date reservationDate;
	private String reservationTime;
	private int reservationPeople;
	@JsonFormat(pattern = "yyyy-MM-dd", locale = "Asia/Seoul")
	private Date firstDate;
	@JsonFormat(pattern = "yyyy-MM-dd", locale = "Asia/Seoul")
	private Date lastDate;

	// 리뷰내용을 가져오기 위해서
	private String content;
}
