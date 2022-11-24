package co.dabling.msp.review.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	int reviewNum;
	int reservationCode;
	String content;
	double rate;
	String reviewDate;
	int storeCode;
}
