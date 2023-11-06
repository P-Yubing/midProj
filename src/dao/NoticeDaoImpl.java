package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.MyBatisDao;
import config.MyBatisUtil;
import vo.NoticeVO;

public class NoticeDaoImpl extends MyBatisDao implements INoticeDao {

	
    private static INoticeDao noticeDao;
    private SqlSessionFactory sqlSessionFactory;

    public NoticeDaoImpl() {
        // 싱글톤 형태 만들기
    	  sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();
    	
    }

    public static INoticeDao getInstance() {
        if (noticeDao == null) {
            noticeDao = new NoticeDaoImpl();
        }
        return noticeDao;
    }

    @Override
    public int insertNotice(NoticeVO notice) {
        int cnt = insert("NoticeMapper.insertNotice", notice);
        return cnt;
    }

    @Override
    public List<NoticeVO> noticeList() {

       List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
          
       noticeList = selectList("NoticeMapper.listNotice");
         
       return noticeList;
    }
    @Override
    public int updateNotice(NoticeVO notice) {
        int cnt = update("NoticeMapper.updateNotice", notice);
        return cnt;
    }

    @Override
    public int deleteNotice(String noticeId) {
        int cnt = delete("NoticeMapper.deleteNotice", noticeId);
        return cnt;
    }

    @Override
    public String loginChk(Map<String, Object> loginChkMap) throws SQLException {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public NoticeVO getNotice(int notiId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public NoticeVO getNoticeById(String notiId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("getNoticeById", notiId);
        }
     }

}
