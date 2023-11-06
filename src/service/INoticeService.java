package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import vo.NoticeVO;

public interface INoticeService {
	public int updateNotice(NoticeVO notice);
	public NoticeVO getNoticeById(String notiId);
	public int insertNotice(NoticeVO notice);
	public List<NoticeVO> noticeList();
	public int deleteNotice(String notiId);
//	public NoticeVO deleteNotice(String notiId);
}
