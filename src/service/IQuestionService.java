package service;

import java.util.List;

import vo.QuestionVO;

public interface IQuestionService {

	QuestionVO getQueId(String queId);


	List<QuestionVO> questionList();


	public List<QuestionVO> queListByClassId(String classId);

}
