package service;

import dao.IOrdersDao;
import dao.OrdersDaoImpl;
import vo.OrdersVO;
import vo.PaymentVO;

public class OrdersServiceImpl implements IOrdersService{

	private IOrdersDao ordersDao;
	private static IOrdersService ordersService;
	
	private OrdersServiceImpl(){
		ordersDao = OrdersDaoImpl.getInstance();
	}
	
	public static IOrdersService getInstance() {
		if(ordersService == null) ordersService = new OrdersServiceImpl();
		return ordersService;
	}
	
	@Override
	public int paymentAmount(OrdersVO ordersVO) {
		
		return ordersDao.paymentAmount(ordersVO);
	}
	@Override
	public OrdersVO getOrder(OrdersVO ordersVO) {
		
		return ordersDao.getOrder(ordersVO);
	}
	
	@Override
	public OrdersVO getOrdersAmount(OrdersVO ordersVO) {
		
		return ordersDao.getOrdersAmount(ordersVO);
	}
}
