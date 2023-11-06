package dao;

import java.util.List;

import vo.QuestionVO;

public interface IQuestionDao {

	QuestionVO getQueId(String queId);


	List<QuestionVO> questionList();


	public List<QuestionVO> queListByClassId(String classId);
	
	
}
