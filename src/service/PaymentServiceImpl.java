package service;

import dao.IPaymentDao;
import dao.PaymentDaoImpl;
import vo.PaymentVO;
import vo.SettleVO;

public class PaymentServiceImpl implements IPaymentService{

	private IPaymentDao paymentDao;
	private static IPaymentService paymentService;
	
	private PaymentServiceImpl(){
		
		paymentDao = PaymentDaoImpl.getInstance();
	}
	
	public static IPaymentService getInstance() {
		if(paymentService == null) paymentService = new PaymentServiceImpl();
		return paymentService;
	}
	
	@Override
	public int paymentAmount(PaymentVO paymentVO) {
		
		return paymentDao.paymentAmount(paymentVO);
	}

	@Override
	public int paymentInfo(PaymentVO paymentVO) {
		
		//처리전 payId : null인데, 처리 후 payId : 76
		int result = paymentDao.paymentInfo(paymentVO);	//76
		
		SettleVO settleVO = new SettleVO();
		settleVO.setClassId(paymentVO.getClassId());
		settleVO.setPayId(paymentVO.getPayId());//76
		settleVO.setSettleAmount(paymentVO.getPayAmount());
		
		result += paymentDao.settleInfo(settleVO);
		
		return result;
	}



	
}

