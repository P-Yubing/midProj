package dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;

import common.MyBatisDao;
import config.MyBatisUtil;
import vo.ClassInfoVO;
import vo.QuestionVO;

public class QuestionDaoImpl extends MyBatisDao implements IQuestionDao {

	private static IQuestionDao questionDao;
//    private SqlSessionFactory sqlSessionFactory;
	
	public QuestionDaoImpl() {
		
//     sqlSessionFactory  = MyBatisUtil.getSqlSessionFactory();
	    	
	}
	
	
	
	public static IQuestionDao getInstance() {
		
		 if (questionDao == null) {
			 questionDao = new QuestionDaoImpl();
	        }
	        return questionDao;
	}



	@Override
	public QuestionVO getQueId(String queId) {
		QuestionVO que = selectOne("question.insertQuestion", queId);
	       
		return que;
	}



	@Override
	public List<QuestionVO> questionList() {
		
		List<QuestionVO> questionList = new ArrayList<QuestionVO>();
        
		questionList = selectList("question.listQuestion");
	         
	       return questionList;
	}



	@Override
	public List<QuestionVO> queListByClassId(String classId) {
		List<QuestionVO> queListByClassId = new ArrayList<QuestionVO>();
        
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classId", classId);
		
		queListByClassId = selectList("question.queListByClassId", map);
	         
	       return queListByClassId;
	}

	
	
	
	
	
	
}
