package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import dao.INoticeDao;
import dao.NoticeDaoImpl;
import vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {
    private static INoticeService noticeService;
    private INoticeDao noticeDao;

    public NoticeServiceImpl() {
        noticeDao = NoticeDaoImpl.getInstance();
    }

    public static INoticeService getInstance() {
        if (noticeService == null) {
            noticeService = new NoticeServiceImpl();
        }
        return noticeService;
    }

    @Override
    public int insertNotice(NoticeVO notice) {
        int cnt = noticeDao.insertNotice(notice);
        // 삽입된 공지사항의 ID를 확인하려면 공지사항 객체에서 가져와야 할 수도 있습니다.
        return cnt;
    }

    @Override
    public NoticeVO getNoticeById(String notiId) {
        return noticeDao.getNoticeById(notiId);
    }

    @Override
    public List<NoticeVO> noticeList() {
        return noticeDao.noticeList();
    }


    @Override
    public int updateNotice(NoticeVO notice) {
    return noticeDao.updateNotice(notice);
    }

    @Override
    public int deleteNotice(String notiId) {
        return noticeDao.deleteNotice(notiId);
    }


}
