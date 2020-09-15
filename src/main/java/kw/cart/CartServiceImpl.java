package kw.cart;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("cartService")
public class CartServiceImpl implements CartService{
	@Resource(name="cartDAO")
	private CartDAO cartDAO;
	
	public void createCart(Map<String, String> cartParam) {
		cartDAO.createCart(cartParam);
	}
	
	public int checkCart(Map<String, String> cartParam) {
		return cartDAO.checkCart(cartParam);
	}
	
	public int retrieveCart(Map<String, String> cartParam){
		return cartDAO.retrieveCart(cartParam);
	}
	
	public List<Map<String, String>> retrieveCartList(Map<String, String> cartParam){
		return cartDAO.retrieveCartList(cartParam);
	}
	
	public void updateCart(Map<String, String> cartParam) {
		cartDAO.updateCart(cartParam);
	}
	
	public void deleteCart(Map<String, String> cartParam) {
		cartDAO.deleteCart(cartParam);
	}
}
