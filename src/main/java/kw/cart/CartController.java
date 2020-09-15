package kw.cart;

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

@Controller
public class CartController {
	@Resource(name="bookService")
	private BookService bookService;
	
	@Resource(name="cartService")
	private CartService cartService;
	
	@RequestMapping(value="/kw/cart/createCart.do", method=RequestMethod.GET)
	public ModelAndView createCart(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		String bookNum = request.getParameter("bookNum");
		String cartPrice = request.getParameter("cartPrice");
		String cartCount = request.getParameter("cartCount");
		String id = (String)session.getAttribute("id");
		
		Map<String, String> cartParam = new HashMap<String, String>();
		Map<String, String> bookParam = new HashMap<String, String>();

		cartParam.put("id", id);
		cartParam.put("bookNum", bookNum);
		
		int checkCount = cartService.checkCart(cartParam);
		
		cartParam.put("cartPrice", cartPrice);
		cartParam.put("cartCount", cartCount);
		
		if(checkCount == 0) {
			cartService.createCart(cartParam);
		}
		else {
			String cartNum = Integer.toString(cartService.retrieveCart(cartParam));
			cartParam.put("cartNum", cartNum);
			
			cartService.updateCart(cartParam);
		}
		
		bookParam.put("bookNum", bookNum);
		bookParam.put("bookCount", cartCount);
		bookService.updateBookCountMinus(bookParam);
		
		mv.setViewName("redirect:/kw/cart/retrieveCartList.do");
		
		return mv;
	}
	
	@RequestMapping(value="/kw/cart/retrieveCartList.do", method=RequestMethod.GET)
	public ModelAndView retrieveCartList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		Map<String, String> cartParam = new HashMap<String, String>();
		
		cartParam.put("id", id);
		
		List<Map<String, String>> cartList = cartService.retrieveCartList(cartParam);
		
		mv.addObject("cartList", cartList);
		mv.setViewName("/cart/cartList");
		return mv;
	}
	
	@RequestMapping(value="/kw/cart/deleteCart.do", method=RequestMethod.GET)
	public ModelAndView deleteCart(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> cartParam = new HashMap<String, String>();
		Map<String, String> bookParam = new HashMap<String, String>();
		
		String cartNum = request.getParameter("cartNum");
		String bookNum = request.getParameter("bookNum");
		String bookCount = request.getParameter("bookCount");
		
		cartParam.put("cartNum", cartNum);
		cartService.deleteCart(cartParam);
		
		bookParam.put("bookNum", bookNum);
		bookParam.put("bookCount", bookCount);
		
		bookService.updateBookCountPlus(bookParam);
		
		mv.setViewName("redirect:/kw/cart/retrieveCartList.do");
		
		return mv;
	}
}
