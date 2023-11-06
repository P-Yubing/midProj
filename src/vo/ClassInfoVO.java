package vo;

public class ClassInfoVO {
	
	private String classId = "";
	private String classCurr;
	private String classIntro;
	private String classHost;
	private String classCategory;
	private String classPrice;
	private String classDay;
	private String classCertificate;
	private String className;
	private String classWishCount;
	private String hostPic;
	private String classAddr;
	
	private ClassVO classVO;
	
	private String classPicId = "";
	private String classCours = "";
	
	private ClassPicVO picVO;
	
	public ClassPicVO getPicVO() {
		return picVO;
	}

	public void setPicVO(ClassPicVO picVO) {
		this.picVO = picVO;
	}

	public ClassInfoVO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getClassId() {
		return classId;
	}

	public ClassVO getClassVO() {
		return classVO;
	}

	public void setClassVO(ClassVO classVO) {
		this.classVO = classVO;
	}


	public void setClassId(String classId) {
		this.classId = classId;
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

	public String getClassPrice() {
		return classPrice;
	}

	public void setClassPrice(String classPrice) {
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

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassWishCount() {
		return classWishCount;
	}

	public void setClassWishCount(String classWishCount) {
		this.classWishCount = classWishCount;
	}

	public String getHostPic() {
		return hostPic;
	}

	public void setHostPic(String hostPic) {
		this.hostPic = hostPic;
	}

	public String getClassAddr() {
		return classAddr;
	}

	public void setClassAddr(String classAddr) {
		this.classAddr = classAddr;
	}

	public String getClassPicId() {
		return classPicId;
	}

	public void setClassPicId(String classPicId) {
		this.classPicId = classPicId;
	}

	public String getClassCours() {
		return classCours;
	}

	public void setClassCours(String classCours) {
		this.classCours = classCours;
	}
	
	@Override
	public String toString() {
		return "ClassInfoVO [classId=" + classId + ", classCurr=" + classCurr + ", classIntro=" + classIntro
				+ ", classHost=" + classHost + ", classCategory=" + classCategory + ", classPrice=" + classPrice
				+ ", classDay=" + classDay + ", classCertificate=" + classCertificate + ", className=" + className
				+ ", classWishCount=" + classWishCount + ", hostPic=" + hostPic + ", classAddr=" + classAddr
				+ ", classPicId=" + classPicId + ", classCours=" + classCours +"]";
	}
	
	
	

}
