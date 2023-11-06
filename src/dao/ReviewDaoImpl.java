package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.MyBatisDao;
import config.MyBatisUtil;
import vo.ReviewVO;
import vo.UserIdReviewInfoVO;

public class ReviewDaoImpl extends MyBatisDao implements IReviewDao  {

	private static IReviewDao reviewDao;
	
	public ReviewDaoImpl() {}
	
	public static IReviewDao getInstance() {
		if(reviewDao == null) reviewDao = new ReviewDaoImpl();
		return reviewDao;
	}
	
   
	@Override
	public int insertReview(ReviewVO rv) {

		int cnt = insert("review.insertReview", rv);
		
		return cnt;
	}
   
   

  
	@Override
	public List<UserIdReviewInfoVO> getUserIdReviewInfo(String userId) {

		List<UserIdReviewInfoVO> userReview= new ArrayList<UserIdReviewInfoVO>();
		
		userReview = selectList("review.getUserIdReviewInfoList",userId);
		
		return userReview;
	}

	@Override
	public List<ReviewVO> getReviewByClassId(String classId) {

		List<ReviewVO> classReview= new ArrayList<ReviewVO>();
		
		classReview = selectList("review.getReviewByClassId", classId);
		
		return classReview;
	}
	
	
//	public List<UserIdReviewInfoVO> getUserIdReviewInfo(){
//	List<UserIdReviewInfoVO> userReview= new ArrayList<UserIdReviewInfoVO>();
//		
//		userReview = selectList("review.getUserIdReviewInfoList",userId);
//		
//		return userReview;
//	}
//	
//	
//	public ReviewVO getReviewByPayId(String payId) {
//		
//	}
//	
//	
	
}
