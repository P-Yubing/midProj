package vo;

public class ClassVO {
	
	//1. 카멜기법으로 수정하기
	private String classId;
	private String classStatus;
	private String userId;
	private String rejectReason;
	
	//승인 대기중인 클래스 리스트를 출력하기 위해 변수 2개 더 선언함.
	private String classCategory;
	private String className;
	
	
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassstatus() {
		return classStatus;
	}
	public void setClassstatus(String classStatus) {
		this.classStatus = classStatus;
	}
	public String getUserid() {
		return userId;
	}
	public void setUserid(String userId) {
		this.userId = userId;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	
	
	//승인 대기중인 클래스 리스트를 출력하기 위해
	public String getClassCategory() {
		return classCategory;
	}
	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	
}
