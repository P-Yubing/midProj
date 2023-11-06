package service;

import java.util.List;
import java.util.Map;

import vo.ClassInfoVO;
import vo.ClassVO;

public interface IClassService {
	
	//클래스 생성
	public int createClass(ClassVO classInfoVO);
	//클래스 카테고리,금액,날짜 선택조회
	public List<ClassVO> searchClassType(String classMap);
	//클래스 키워드 조회
//	public List<ClassVO> searchClass(String keyword);
	
	//클래스 승인시 상태변경
	public int classConfirm(String classId);
	
	//승인 대기중인 클래스 리스트
	public List<ClassVO> classConfirmList();
	
	//클래스 반려시 반려사유 업데이트
	public int classReject(Map<String, Object> rejectMap);
	
	//후기시 classID 필요
	public ClassVO getClassid(String classId);
	
}
