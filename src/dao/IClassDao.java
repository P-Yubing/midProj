package dao;

import java.util.List;
import java.util.Map;

import vo.ClassVO;

public interface IClassDao {
	
	   public int createClass(ClassVO cv);
	   
	   public List<ClassVO> searchClassType(String typeList);
	   
//	   public List<ClassVO> searchClass(String keyword);
	   
	   public int classConfirm(String classId);
	   
	   public List<ClassVO> classConfirmList();
	   
	   public int classReject(Map<String, Object> rejectMap);


	   //후기시 필요
	   public ClassVO getClassid(String className);
}
	
