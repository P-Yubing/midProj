package service;

import vo.OrdersVO;

public interface IOrdersService {

	public OrdersVO getOrder(OrdersVO ordersVO);
	
	int paymentAmount(OrdersVO ordersVO);

	public OrdersVO getOrdersAmount(OrdersVO ordersVO);

	
	
}
