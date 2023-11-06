package dao;

import vo.OrdersVO;
import vo.PaymentVO;
import vo.SettleVO;

public interface IPaymentDao {

	
	public int paymentAmount(PaymentVO paymentVO);
	
	public int paymentInfo(PaymentVO paymentVO);

	public int settleInfo(SettleVO settleVO);
	
	
}
