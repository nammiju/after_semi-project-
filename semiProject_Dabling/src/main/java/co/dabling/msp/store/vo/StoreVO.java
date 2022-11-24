package co.dabling.msp.store.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class StoreVO {
	private int storeCode;
	private String storeName;
	private String storeRegion;// 중구,동구,북구..
	private String storeCategory;
	private String storeInfo;
	private double lat;
	private double lng;
	private String storeImage;
	private String storeAddress;
	private String businessNum;
	private String storeImageRename;
	private int approvalState;
}
