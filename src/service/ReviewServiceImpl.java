package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.IReviewDao;
import dao.ReviewDaoImpl;
import vo.ReviewVO;
import vo.UserIdReviewInfoVO;

public class ReviewServiceImpl implements IReviewService {

	private static IReviewService reviewService;
	
	private IReviewDao reviewDao;
	
	private ReviewServiceImpl() {
		reviewDao = ReviewDaoImpl.getInstance();
	}
	
	public static IReviewService getInstance() {
		if(reviewService == null) {
			reviewService = new ReviewServiceImpl();
		}
		
		return reviewService;
	}
		@Override
	public int getinsertReviewService(ReviewVO rv) {
		return reviewDao.insertReview(rv);
	}

  
	@Override
	public List<UserIdReviewInfoVO> getUIdReviewInfo(String userId) {
		return reviewDao.getUserIdReviewInfo(userId);
	}

	@Override
	public List<ReviewVO> getReviewByClassId(String classId) {

		return reviewDao.getReviewByClassId(classId);
	}
}
