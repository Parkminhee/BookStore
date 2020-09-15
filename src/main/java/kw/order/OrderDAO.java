package kw.order;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void createOrder(Map<String, String> orderParam) {
		sqlSession.insert("order.createOrder", orderParam);
	}
	
	public List<Map<String, String>> retrieveOrderListForCustomer(Map<String, String> orderParam){
		return sqlSession.selectList("order.retrieveOrderListForCustomer", orderParam);
	}
	
	public List<Map<String, String>> retrieveOrderListForManage(){
		return sqlSession.selectList("order.retrieveOrderListForManage");
	}
}
