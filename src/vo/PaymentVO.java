 package vo;

import java.sql.Date;

public class PaymentVO {
	
	private String payId;
	private String payDate;
	private String payAmount;
	private String ordersId;
	private String payName;
	
	private String classId;
	
	public PaymentVO() {}

	public PaymentVO(String payDate, String payAmount, String payName) {
		super();
		this.payDate = payDate;
		this.payAmount = payAmount;
		this.payName = payName;
	}
	
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(String payAmount) {
		this.payAmount = payAmount;
	}
	public String getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}
	

}
