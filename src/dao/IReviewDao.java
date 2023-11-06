package dao;

import java.util.List;

import vo.ReviewVO;
import vo.UserIdReviewInfoVO;

public interface IReviewDao {


	public int insertReview(ReviewVO rv);

	public List<UserIdReviewInfoVO> getUserIdReviewInfo(String userId);
	
	public List<ReviewVO> getReviewByClassId(String classId);
	

}