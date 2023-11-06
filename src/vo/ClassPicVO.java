package vo;

public class ClassPicVO {
	
	private String classPicId;
	private String classId;
	private String fileStreCours;
	private String classPicName;
	
	
	public String getClassPicId() {
		return classPicId;
	}
	public void setClassPicId(String classPicId) {
		this.classPicId = classPicId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getFileStreCours() {
		return fileStreCours;
	}
	public void setFileStreCours(String fileStreCours) {
		this.fileStreCours = fileStreCours;
	}
	public String getClassPicName() {
		return classPicName;
	}
	public void setClassPicName(String classPicName) {
		this.classPicName = classPicName;
	}
	@Override
	public String toString() {
		return "ClassPicVO [classPicId=" + classPicId + ", classId=" + classId + ", fileStreCours=" + fileStreCours
				+ ", classPicName=" + classPicName + "]";
	}

	
	

}
