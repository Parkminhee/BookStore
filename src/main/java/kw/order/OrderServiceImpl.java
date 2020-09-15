package kw.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;
	
	public void createOrder(Map<String, String> orderParam) {
		orderDAO.createOrder(orderParam);
	}
	
	public List<Map<String, String>> retrieveOrderListForCustomer(Map<String, String> orderParam){
		return orderDAO.retrieveOrderListForCustomer(orderParam);
	}
	
	public List<Map<String, String>> retrieveOrderListForManage(){
		return orderDAO.retrieveOrderListForManage();
	}
}
