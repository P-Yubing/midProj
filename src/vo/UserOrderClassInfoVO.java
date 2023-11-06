package vo;

public class UserOrderClassInfoVO {
	
	private String userId;
	private String classId;
	private String className;
	private String classHost;
	private String ordersQty;
	private String ordersDate;
	private int ordersAmount;
	
	public UserOrderClassInfoVO() {
		// TODO Auto-generated constructor stub
	}
	public UserOrderClassInfoVO(String userId) {
		// TODO Auto-generated constructor stub
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

	public String getClassHost() {
		return classHost;
	}

	public void setClassHost(String classHost) {
		this.classHost = classHost;
	}

	public String getOrdersQty() {
		return ordersQty;
	}

	public void setOrdersQty(String ordersQty) {
		this.ordersQty = ordersQty;
	}

	public String getOrdersDate() {
		return ordersDate;
	}

	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}

	public int getOrdersAmount() {
		return ordersAmount;
	}

	public void setOrdersAmount(int ordersAmount) {
		this.ordersAmount = ordersAmount;
	}



	@Override
	public String toString() {
		return "UserOrderClassInfo [userId=" + userId + ", classId=" + classId + ", className=" + className
				+ ", classHost=" + classHost + ", ordersQty=" + ordersQty + ", ordersDate=" + ordersDate
				+ ", ordersAmount=" + ordersAmount + "]";
	}
	
	
	
}
