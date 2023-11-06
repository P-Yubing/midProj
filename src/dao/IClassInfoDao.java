package dao;

import java.util.List;

import vo.ClassInfoVO;

public interface IClassInfoDao {
	/**
	 * 클래스 생성
	 * @param classInfoVO
	 */
    public int createClassInfo(ClassInfoVO classInfoVO);
    
    /**
     * 클래스 세부정보 리스트
     * @return
     */
    List<ClassInfoVO> getClassInfoList();
    /**
     * 호스트파일 저장
     * @param classInfoVO
     * @return
     */
    public int insertHostPic(ClassInfoVO classInfoVO);

    public List<ClassInfoVO> getWishClass();
	
    public List<ClassInfoVO> getRecentClass();
	
    public List<ClassInfoVO> getCategoryClass(String classCategory);
	
    public List<ClassInfoVO> getClassInfo();

    public List<ClassInfoVO> favoClass();
	
	List<ClassInfoVO> getClassTypeinfo(String searchKeyword);
}
