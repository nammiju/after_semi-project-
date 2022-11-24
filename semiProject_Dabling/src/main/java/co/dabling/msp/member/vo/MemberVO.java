package co.dabling.msp.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private int memberCode;
	private String email;
	private String password;
	private String name;
	private String phone;
	private String businessNum;
	private int author;
}
