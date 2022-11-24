package co.dabling.msp.notice.service;

import java.util.List;

import co.dabling.msp.member.vo.MemberVO;
import co.dabling.msp.notice.vo.NoticeVO;

public interface NoticeService {
		//공지사항 전체 목록
		List<NoticeVO> noticeSelectList();
		//공지 1건 상세조회
		NoticeVO noticeSelect(int noticeCode);
		//공지사항 입력
		int noticeInsert(NoticeVO vo); 
		//공지사항 수정
		int noticeUpdate(NoticeVO vo);
		//공지사항 삭제
		int noticeDelete(int noticeCode);
}
