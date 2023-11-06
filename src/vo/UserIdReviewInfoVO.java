package vo;

public class UserIdReviewInfoVO {
	
	private String className; //클래스 이름
	private String orderDate; //클래스 수업날짜
	private String orderId; //주문아이디
	private String payDate;//결제 날짜
	private String payId; //결제아이디
	private String userId; //유저아이디
	
	public UserIdReviewInfoVO() {
		// TODO Auto-generated constructor stub
	}
	public UserIdReviewInfoVO(String userId) {
		// TODO Auto-generated constructor stub
	}
	public UserIdReviewInfoVO(String className, String orderDate, String orderId, String payDate, String payId,
			String userId) {
		super();
		this.className = className;
		this.orderDate = orderDate;
		this.orderId = orderId;
		this.payDate = payDate;
		this.payId = payId;
		this.userId = userId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "UserIdReviewInfoVO [className=" + className + ", orderDate=" + orderDate + ", orderId=" + orderId
				+ ", payDate=" + payDate + ", payId=" + payId + ", userId=" + userId + "]";
	}
	
	
}
