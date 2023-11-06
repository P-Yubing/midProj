package vo;

public class OrdersVO {
	
	private String ordersId;
	private String classId;
	private String userId;
	private String ordersQty;
	private String ordersDate;
	private int ordersAmount;

	

	public OrdersVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public OrdersVO(String ordersQty) {
		super();
		this.ordersQty = ordersQty;
	}
	
	public int getOrdersAmount() {
	    return ordersAmount;
	}

	public void setOrdersAmount(int ordersAmount) {
	    this.ordersAmount = ordersAmount;
	}

	public String getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(String orders_id) {
		this.ordersId = orders_id;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String class_id) {
		this.classId = class_id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String user_id) {
		this.userId = user_id;
	}
	public String getOrdersQty() {
		return ordersQty;
	}
	public void setOrdersQty(String orders_qty) {
		this.ordersQty = orders_qty;
	}
	public String getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(String orders_date) {
		this.ordersDate = orders_date;
	}
	
	
	

}
