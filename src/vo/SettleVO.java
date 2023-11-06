package vo;

public class SettleVO {
	
	private String settleId;
	private String classId;
	private String payId;
	private String settleAmount;
	
	private String classCategory;
	private String className;
	private String payAmount;
	private String userId;
	
	
	public SettleVO() {
		
	}
	
	public SettleVO(String settleId, String classId, String payId,String settleAmount) {
		super();
		this.settleId = settleId;
		this.classId = classId;
		this.payId = payId;
		this.settleAmount = settleAmount;
		
	}

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(String payAmount) {
		this.payAmount = payAmount;
	}

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

	public String getSettleId() {
		return settleId;
	}

	public void setSettleId(String settleId) {
		this.settleId = settleId;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getSettleAmount() {
		return settleAmount;
	}

	public void setSettleAmount(String settleAmount) {
		this.settleAmount = settleAmount;
	}
	
	

}
