package service;

import java.util.List;

import vo.ReviewVO;
import vo.UserIdReviewInfoVO;

public interface IReviewService {


	public int getinsertReviewService(ReviewVO rv);

	
	public List<UserIdReviewInfoVO> getUIdReviewInfo(String userId);
	
	public List<ReviewVO> getReviewByClassId(String classId);
}



