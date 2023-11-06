package dao;

import vo.OrdersVO;
import vo.PaymentVO;


public interface IOrdersDao {

	public OrdersVO getOrder(OrdersVO  ordersVO);
	
	public int paymentAmount(OrdersVO  ordersVO);
	
	public OrdersVO getOrdersAmount(OrdersVO ordersVO);

	
	
}
