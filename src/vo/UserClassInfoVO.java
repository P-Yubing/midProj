package vo;

public class UserClassInfoVO {

	private String userId;
	private String classId;
	private String className; //클래스 이름
	private String classCurr; //커리큘럼
	private String classIntro; //클래스 소개
	private String classHost; //강사소개
	private String classCategory; //카테고리
	private int classPrice; //수강 가격
	private String classDay; // 클래스 요일
	private String classCertificate; // 사업자 등록증
	private int classWishCount; //관심수업 개수
	private String classAddr; //클래스 주소
	private String classStatus; //클래스 상태
	private String rejectReason; // 반려사유
	
	public UserClassInfoVO() {
		// TODO Auto-generated constructor stub
	}
	public UserClassInfoVO(String userId) {
		// TODO Auto-generated constructor stub
	}
	
	public UserClassInfoVO(String userId, String classId, String className, String classCurr, String classIntro,
			String classHost, String classCategory, int classPrice, String classDay, String classCertificate,
			int classWishCount, String classAddr, String classStatus, String rejectReason) {
		super();
		this.userId = userId;
		this.classId = classId;
		this.className = className;
		this.classCurr = classCurr;
		this.classIntro = classIntro;
		this.classHost = classHost;
		this.classCategory = classCategory;
		this.classPrice = classPrice;
		this.classDay = classDay;
		this.classCertificate = classCertificate;
		this.classWishCount = classWishCount;
		this.classAddr = classAddr;
		this.classStatus = classStatus;
		this.rejectReason = rejectReason;
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassCurr() {
		return classCurr;
	}

	public void setClassCurr(String classCurr) {
		this.classCurr = classCurr;
	}

	public String getClassIntro() {
		return classIntro;
	}

	public void setClassIntro(String classIntro) {
		this.classIntro = classIntro;
	}

	public String getClassHost() {
		return classHost;
	}

	public void setClassHost(String classHost) {
		this.classHost = classHost;
	}

	public String getClassCategory() {
		return classCategory;
	}

	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}

	public int getClassPrice() {
		return classPrice;
	}

	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}

	public String getClassDay() {
		return classDay;
	}

	public void setClassDay(String classDay) {
		this.classDay = classDay;
	}

	public String getClassCertificate() {
		return classCertificate;
	}

	public void setClassCertificate(String classCertificate) {
		this.classCertificate = classCertificate;
	}

	public int getClassWishCount() {
		return classWishCount;
	}

	public void setClassWishCount(int classWishCount) {
		this.classWishCount = classWishCount;
	}

	public String getClassAddr() {
		return classAddr;
	}

	public void setClassAddr(String classAddr) {
		this.classAddr = classAddr;
	}

	public String getClassStatus() {
		return classStatus;
	}

	public void setClassStatus(String classStatus) {
		this.classStatus = classStatus;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	@Override
	public String toString() {
		return "UserClassInfoVO [userId=" + userId + ", classId=" + classId + ", className=" + className
				+ ", classCurr=" + classCurr + ", classIntro=" + classIntro + ", classHost=" + classHost
				+ ", classCategory=" + classCategory + ", classPrice=" + classPrice + ", classDay=" + classDay
				+ ", classCertificate=" + classCertificate + ", classWishCount=" + classWishCount + ", classAddr="
				+ classAddr + ", classStatus=" + classStatus + ", rejectReason=" + rejectReason + "]";
	}
	
	

	
}
