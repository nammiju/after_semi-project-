package co.dabling.msp.liked.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class LikedVO {
	int likeCode;
	int memberCode;
	int storeCode;
	// 값을 받기위해
	String storeImage;
	String storeName;
	String storeCategory;
	String storeRegion;
}
