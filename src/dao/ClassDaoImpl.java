package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import config.MyBatisUtil;
import vo.ClassVO;

public class ClassDaoImpl extends MyBatisDao implements IClassDao {

    private static IClassDao classDao;

    public ClassDaoImpl() {
    }

    public static IClassDao getInstance() {
        if (classDao == null)
            classDao = new ClassDaoImpl();
        return classDao;
    }
    
    @Override
    public int createClass(ClassVO cv) {
			
    	int cnt = insert("class2.createClass",cv);
		
		return cnt;
	}


    @Override
    public List<ClassVO> searchClassType(String typeList) {
    	
    	List<ClassVO> classList = new ArrayList<ClassVO>();
    	
    	classList = selectList("class.getClassTypeInfo", typeList);
    	
    	return classList;
    }

	@Override
	public int classConfirm(String classId) {

		int cnt = update("class2.classConfirm", classId);
		
		return cnt;
	}

	@Override
	public List<ClassVO> classConfirmList() {

		List<ClassVO> classConfirmList = new ArrayList<ClassVO>();
		
		classConfirmList = selectList("class2.classConfirmList");
		
		return classConfirmList;
	}

	@Override
	public int classReject(Map<String, Object> rejectMap) {
		
		int cnt = update("class2.classReject", rejectMap);
		
		return cnt;
	}

	@Override
	public ClassVO getClassid(String className) {
		// TODO Auto-generated method stub
		return null;
	}

	

//    @Override
//    public List<ClassVO> searchClass(String keyword) {
//    	
//    	List<ClassVO> classList = new ArrayList<ClassVO>();
//    	
//    	SqlSession session = MyBatisUtil.getInstance();
//    	try {
//    		
//    		classList = session.selectList("getClassInfo", keyword);
//    		
//    	}catch(PersistenceException ex) {
//    		ex.printStackTrace();
//    	}
//    	return classList;
//    }
}
