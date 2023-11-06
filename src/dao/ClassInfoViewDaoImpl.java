package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.MyBatisDao;
import vo.ClassInfoVO;

public class ClassInfoViewDaoImpl extends MyBatisDao implements IClassInfoViewDao{

	private static IClassInfoViewDao classInfoViewDao;
	
	public ClassInfoViewDaoImpl() {
		
	}
	
	
	public static IClassInfoViewDao getInstance() {
        if (classInfoViewDao == null) {
        	classInfoViewDao = new ClassInfoViewDaoImpl();
        }
        return classInfoViewDao;
}
	
	@Override
	public ClassInfoVO getClassInfoById(String classId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classId", classId);
		
		ClassInfoVO civ = selectOne("classinfo.getClassInfoById", map);
       
		return civ;
	}
	
	 @Override
	    public List<ClassInfoVO> classInfoViewList(ClassInfoVO civ) {

	       List<ClassInfoVO> classInfoViewList = new ArrayList<ClassInfoVO>();
	          
	       classInfoViewList = selectList("classinfo.listNotice");
	         
	       return classInfoViewList;
	    }


	@Override
	public int classWishCount(int classId) {
		
		int classwishcount = update("classinfo.classWishCount", classId);
	       
		return classwishcount;
	}
	 
}
	
	
