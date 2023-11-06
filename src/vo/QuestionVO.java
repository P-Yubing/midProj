package vo;

public class QuestionVO {

	private String queId;
	private String queContent;
	private String queDate;
	private String classId;
	private String userId;
	
	public QuestionVO() {}
	
	public QuestionVO(String queId, String queContent, String queDate, String classId, String userId) {
		super();
		this.queId = queId;
		this.queContent = queContent;
		this.queDate = queDate;
		this.classId = classId;
		this.userId = userId;
	}
	/**
	 * @return the queId
	 */
	public String getQueId() {
		return queId;
	}
	/**
	 * @param queId the queId to set
	 */
	public void setQueId(String queId) {
		this.queId = queId;
	}
	/**
	 * @return the queContent
	 */
	public String getQueContent() {
		return queContent;
	}
	/**
	 * @param queContent the queContent to set
	 */
	public void setQueContent(String queContent) {
		this.queContent = queContent;
	}
	/**
	 * @return the queDate
	 */
	public String getQueDate() {
		return queDate;
	}
	/**
	 * @param queDate the queDate to set
	 */
	public void setQueDate(String queDate) {
		this.queDate = queDate;
	}
	/**
	 * @return the classId
	 */
	public String getClassId() {
		return classId;
	}
	/**
	 * @param classId the classId to set
	 */
	public void setClassId(String classId) {
		this.classId = classId;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "QuestionVO [queId=" + queId + ", queContent=" + queContent + ", queDate=" + queDate + ", classId="
				+ classId + ", userId=" + userId + "]";
	}
	
	
	
	
	
	
}
