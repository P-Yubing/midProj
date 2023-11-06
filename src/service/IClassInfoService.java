package service;

import java.util.List;

import vo.ClassInfoVO;

public interface IClassInfoService {
    public void createClassInfo(ClassInfoVO classInfoVO);
    
    public List<ClassInfoVO> getWishClass();
    
    public List<ClassInfoVO> getRecentClass();
    
  
    
    public List<ClassInfoVO> getCategoryClass(String classCategory);
    
    public List<ClassInfoVO> getClassInfo();

    public List<ClassInfoVO> favoClass();
    
    List<ClassInfoVO> getClassTypeInfo(String searchKeyword);
}
