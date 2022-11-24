package co.dabling.msp.menu.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dabling.msp.common.DataSource;
import co.dabling.msp.menu.mapper.MenuMapper;
import co.dabling.msp.menu.service.MenuService;
import co.dabling.msp.menu.vo.MenuVO;

public class MenuServiceImpl implements MenuService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MenuMapper map = sqlSession.getMapper(MenuMapper.class);

	@Override
	public List<MenuVO> menuSelectList() {
		return map.menuSelectList();
	}

	@Override
	public List<MenuVO> menuSelect(String menuName) {
		return map.menuSelect(menuName);
	}

	@Override
	public List<MenuVO> storeMenuSelect(int storeCode) {
		return map.storeMenuSelect(storeCode);
	}

	@Override
	public int menuInsert(MenuVO vo) {
		return map.menuInsert(vo);
	}

	@Override
	public int menuUpdate(MenuVO vo) {
		return map.menuUpdate(vo);
	}

	@Override
	public int menuDelete(String menuName) {
		return map.menuDelete(menuName);
	}

	@Override
	public MenuVO storeMenuOnSelect(int storeCode, String menuName) {
		return map.storeMenuOnSelect(storeCode, menuName);
	}

}
