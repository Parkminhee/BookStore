package kw.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kw.book.BookService;
import kw.cart.CartService;

@Controller
public class OrderController {
	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="cartService")
	private CartService cartService;
	
	@Resource(name="bookService")
	private BookService bookService;
	
	@RequestMapping(value="/kw/order/createOrder.do", method=RequestMethod.GET)
	public ModelAndView createOrder(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> orderParam = new HashMap<String, String>();
		Map<String, String> bookParam = new HashMap<String, String>();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String bookNum = request.getParameter("bookNum");
		String orderCount = request.getParameter("orderCount");
		String orderPrice = request.getParameter("orderPrice");
		String fromCart = request.getParameter("fromCart");
		
		orderParam.put("id", id);
		orderParam.put("bookNum", bookNum);
		orderParam.put("orderCount", orderCount);
		orderParam.put("orderPrice", orderPrice);
		
		orderService.createOrder(orderParam);
		
		if(fromCart != null) {
			Map<String, String> cartParam = new HashMap<String, String>();
			String cartNum = request.getParameter("cartNum");
				
			cartParam.put("cartNum", cartNum);
			cartService.deleteCart(cartParam);
		}
		
		bookParam.put("bookNum", bookNum);
		bookParam.put("bookCount", orderCount);
		bookService.updateBookCountMinus(bookParam);
		
		mv.setViewName("redirect:/kw/order/retrieveOrderListForCustomer.do");
		
		return mv;
	}
	
	@RequestMapping(value="/kw/order/retrieveOrderListForCustomer.do", method=RequestMethod.GET)
	public ModelAndView retrieveOrderListForCustomer(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		Map<String, String> orderParam = new HashMap<String, String>();
		
		orderParam.put("id", id);
		
		List<Map<String, String>> orderList = orderService.retrieveOrderListForCustomer(orderParam);
		
		mv.addObject("orderList", orderList);
		mv.setViewName("/order/orderListForCustomer");
		
		return mv;
	}
	
	@RequestMapping(value="/kw/order/retrieveOrderListForManage.do", method=RequestMethod.GET)
	public ModelAndView retrieveOrderListForManage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		Map<String, String> orderParam = new HashMap<String, String>();
		
		List<Map<String, String>> orderList = orderService.retrieveOrderListForManage();
		
		mv.addObject("orderList", orderList);
		mv.setViewName("/order/orderListForManage");
		
		return mv;
	}
}
