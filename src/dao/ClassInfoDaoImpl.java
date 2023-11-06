package dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import vo.ClassInfoVO;

public class ClassInfoDaoImpl extends MyBatisDao implements IClassInfoDao {

	private static IClassInfoDao classInfoDao;
	
    public ClassInfoDaoImpl(){}

    public static IClassInfoDao getInstance() {
    	if(classInfoDao == null) {
    		classInfoDao = new ClassInfoDaoImpl();
    	}
    	return classInfoDao;
    }
    @Override
    public int createClassInfo(ClassInfoVO classInfoVO) {
        int cnt = insert("class.createClassInfo",classInfoVO);
        return cnt;
    }

    @Override
    public List<ClassInfoVO> getClassInfoList() {
        
    	List<ClassInfoVO> infoList = new ArrayList<ClassInfoVO>();
    	
    	infoList = selectList("class.getClassInfoList");
    	
    	return infoList;
    }

	@Override
	public int insertHostPic(ClassInfoVO classInfoVO) {
		return 0;
	}

	@Override
	public List<ClassInfoVO> getWishClass() {

		List<ClassInfoVO> infoList = new ArrayList<ClassInfoVO>();
		
		infoList = selectList("class.getWishClass");
		
		return infoList;
	}

	@Override
	public List<ClassInfoVO> getRecentClass() {
		
		List<ClassInfoVO> infoList = new ArrayList<ClassInfoVO>();
		
		infoList = selectList("class.getRecentClass");
		
		return infoList;
	}

	

	@Override
	public List<ClassInfoVO> getCategoryClass(String classCategory) {
		
		List<ClassInfoVO> infoList = new ArrayList<ClassInfoVO>();
		
		infoList = selectList("class.getCategoryClass", classCategory);
		
		return infoList;
	}

	@Override
	public List<ClassInfoVO> getClassInfo() {

		List<ClassInfoVO> infoList = new ArrayList<ClassInfoVO>();
		
		infoList = selectList("getClassInfo");
		
		return infoList;
	}

	@Override
	public List<ClassInfoVO> getClassTypeinfo(String searchKeyword) {

		List<ClassInfoVO> infoList = new ArrayList<ClassInfoVO>();
		
		infoList = selectList("class.getClassTypeInfo", searchKeyword);
		
		return infoList;
	}

	//index.jsp 인기 클래스 
//	<select id="favoClass" resultType="vo.ClassInfoVO">
	@Override
	public List<ClassInfoVO> favoClass(){
		return selectList("favoClass");
	}

}





