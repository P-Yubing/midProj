package service;

import vo.OrdersVO;
import vo.PaymentVO;

public interface IPaymentService {

	public int paymentAmount(PaymentVO paymentVO);
	
	public int paymentInfo(PaymentVO paymentVO);
	
	
	

}
