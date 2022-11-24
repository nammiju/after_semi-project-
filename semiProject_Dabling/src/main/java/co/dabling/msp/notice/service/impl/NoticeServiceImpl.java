package co.dabling.msp.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dabling.msp.common.DataSource;
import co.dabling.msp.notice.mapper.NoticeMapper;
import co.dabling.msp.notice.service.NoticeService;
import co.dabling.msp.notice.vo.NoticeVO;



public class NoticeServiceImpl implements NoticeService {
   private SqlSession sqlSession = DataSource.getInstance().openSession(true);
   private NoticeMapper map = sqlSession.getMapper(NoticeMapper.class);
   @Override
   public List<NoticeVO> noticeSelectList() {
      // 공지사항 전체조회
      return map.noticeSelectList();
   }

   @Override
   public NoticeVO noticeSelect(int noticeCode) {
      // 공지사항 1건 상세조회
      return map.noticeSelect(noticeCode);
   }

   @Override
   public int noticeInsert(NoticeVO vo) {
      // 공지사항 입력
      return map.noticeInsert(vo);
   }

   @Override
   public int noticeUpdate(NoticeVO vo) {
      // 공지사항 수정
      return map.noticeUpdate(vo);
   }

   @Override
   public int noticeDelete(int noticeCode) {
      // 공지사항 추가.
      return map.noticeDelete(noticeCode);
   }
}