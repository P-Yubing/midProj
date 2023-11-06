package dao;

import common.MyBatisDao;
import vo.PaymentVO;
import vo.SettleVO;

public class PaymentDaoImpl extends MyBatisDao implements IPaymentDao{

	private static IPaymentDao paymentDao;
	
	private PaymentDaoImpl(){}
	
	public static IPaymentDao getInstance() {
		if(paymentDao == null) paymentDao = new PaymentDaoImpl();
		return paymentDao;
	}
	
	@Override
	public int paymentAmount(PaymentVO paymentVO) {
		
		int cnt = insert("payment.paymentamount", paymentVO);
		
		return cnt;
	}

	@Override
	public int paymentInfo(PaymentVO paymentVO) {

		int cnt = insert("payment.paymentInfo", paymentVO);
		
		return cnt;
	}
	
	@Override
	public int settleInfo(SettleVO settleVO) {
		
		int cnt = insert("payment.settleInfo", settleVO);
		
		return cnt;
	}

	
}
