package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import vo.NoticeVO;

/**
 * 실제 DB에 연결해서 Sql문을 수행하여 결과를 서비스에 전달해주는\ DAO를 위한 인터페이스
 * 
 */
public interface INoticeDao {


    int insertNotice(NoticeVO notice);


	int updateNotice(NoticeVO notice);


	// 로그인 체크 (id = pw 검증)
	public String loginChk(Map<String, Object> loginChkMap) throws SQLException;

	NoticeVO getNotice(int notiId);

	NoticeVO getNoticeById(String noticeId);

	List<NoticeVO> noticeList();


	int deleteNotice(String noticeId);






}
