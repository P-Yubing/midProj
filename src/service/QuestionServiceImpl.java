package service;

import java.util.List;

import dao.IQuestionDao;
import dao.QuestionDaoImpl;
import vo.QuestionVO;

public class QuestionServiceImpl implements IQuestionService{
	
	private static IQuestionDao questionDao;
	private static IQuestionService questionService;
	

	public QuestionServiceImpl() {
		
		questionDao = QuestionDaoImpl.getInstance();
		
	}
	
	public static IQuestionService getInstance() {
		if(questionService == null)
			questionService = new QuestionServiceImpl();
		return questionService;
	}

	@Override
	public QuestionVO getQueId(String queId) {
		return questionDao.getQueId(queId);
	
	}

	public List<QuestionVO> questionList() {
		return questionDao.questionList();
	}

	@Override
	public List<QuestionVO> queListByClassId(String classId) {
		return questionDao.queListByClassId(classId);
	}
	

}
