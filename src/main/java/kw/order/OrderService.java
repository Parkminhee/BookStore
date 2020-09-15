package kw.order;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public void createOrder(Map<String, String> orderParam);
	public List<Map<String, String>> retrieveOrderListForCustomer(Map<String, String> orderParam);
	public List<Map<String, String>> retrieveOrderListForManage();
}
