package service;

import dao.IClassInfoDao;
import dao.ClassInfoDaoImpl;
import org.apache.ibatis.session.SqlSession;
import util.SqlSessionUtil;
import vo.ClassInfoVO;

import java.io.File;
import java.util.List;

public class ClassInfoServiceImpl implements IClassInfoService {

    private IClassInfoDao classInfoDao;
    private static IClassInfoService classInfoService;

    public ClassInfoServiceImpl() {

    	classInfoDao = ClassInfoDaoImpl.getInstance();
    	
    }

    public static IClassInfoService getInstance() {
    	if(classInfoService == null)
    		classInfoService = new ClassInfoServiceImpl();
		return classInfoService;
    	
    }
    
    @Override
    public void createClassInfo(ClassInfoVO classInfoVO) {
    	
    	
        try (SqlSession sqlSession = SqlSessionUtil.getSqlSession()) {
            // DAO 메서드 호출
            classInfoDao.createClassInfo(classInfoVO);
           
        } // try-with-resources를 사용하여 SqlSession 자동으로 닫기
    }

	@Override
	public List<ClassInfoVO> getWishClass() {
		
		return classInfoDao.getWishClass();
	}

	@Override
	public List<ClassInfoVO> getRecentClass() {

		return classInfoDao.getRecentClass();
	}



	@Override
	public List<ClassInfoVO> getCategoryClass(String classCategory) {

		return classInfoDao.getCategoryClass(classCategory);
	}

	@Override
	public List<ClassInfoVO> getClassInfo() {

		return classInfoDao.getClassInfo();
	}

	@Override
	public List<ClassInfoVO> getClassTypeInfo(String searchKeyword) {

		return classInfoDao.getClassTypeinfo(searchKeyword);
	}
	
	//index.jsp 인기 클래스 
	@Override
	public List<ClassInfoVO> favoClass(){
		return classInfoDao.favoClass();
	}

	
}
