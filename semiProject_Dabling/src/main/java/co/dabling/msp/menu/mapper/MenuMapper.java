package co.dabling.msp.menu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dabling.msp.menu.vo.MenuVO;

public interface MenuMapper {
	
	List<MenuVO> menuSelectList(); // 메뉴 전체조회

	List<MenuVO> menuSelect(String menuName); // 메뉴별 조회
	
	List<MenuVO> storeMenuSelect(int storeCode);	// 매장별 메뉴조회
										
	int menuInsert(MenuVO vo); // 메뉴등록
	
	int menuUpdate(MenuVO vo); // 메뉴수정
	
	int menuDelete(String menuName); //메뉴삭제
	
	MenuVO storeMenuOnSelect(@Param("storeCode")int storeCode,@Param("menuName") String menuName); // 매장에 대한 메뉴1건 조회.
}
