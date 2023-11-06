package dao;

import common.MyBatisDao;
import vo.OrdersVO;
import vo.PaymentVO;


public class OrdersDaoImpl  extends MyBatisDao implements IOrdersDao {

	private static IOrdersDao ordersDao;
	
	private OrdersDaoImpl(){}
	
	public static IOrdersDao getInstance() {
		if(ordersDao == null) ordersDao = new OrdersDaoImpl();
		return ordersDao;
	}
	
	@Override
	public int paymentAmount(OrdersVO ordersVO) {
		
		int cnt = insert("orders.paymentamount", ordersVO);
		
		return cnt;
	}
	@Override
	public OrdersVO getOrder(OrdersVO ordersVO) {

		OrdersVO ov = selectOne("orders.getOrder", ordersVO);
		
		return ov;	
		
	}
	@Override
	public OrdersVO getOrdersAmount(OrdersVO ordersVO) {
		
		OrdersVO ov = selectOne("orders.getOrdersAmount", ordersVO);	
		
		return ov;
	}


	
	
	
}
