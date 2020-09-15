package kw.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookController {
	@Resource(name="bookService")
	private BookService bookService;
	
	@RequestMapping(value="/kw/book/createBook.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createBook(@ModelAttribute BookVO bookVO) {
		ModelAndView mv = new ModelAndView();
		String bookName = bookVO.getBookName();
		
		if(bookName == null) {
			mv.setViewName("/stock/stockRegisterC");
		}
		else {
			bookService.createBook(bookVO);
			mv.addObject("bookList", bookService.retrieveBookList());
			mv.setViewName("redirect:/kw/book/retrieveBookListForManage.do");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/kw/book/updateBook.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateBook(@ModelAttribute BookVO bookVO, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> bookParam = new HashMap<String, String>();
		String bookName = bookVO.getBookName();
		
		if(bookName == null) {
			HttpSession session = request.getSession();
			String bookNum = request.getParameter("bookNum");

			bookParam.put("bookNum", bookNum);
			
			BookVO book = bookService.retrieveBook(bookParam);
			
			mv.addObject("book", book);
			mv.setViewName("stock/stockRegisterU");
		}
		else {
			bookService.updateBook(bookVO);
			mv.addObject("bookList", bookService.retrieveBookList());
			mv.setViewName("redirect:/kw/book/retrieveBookListForManage.do");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/kw/book/retrieveBookListForManage.do", method=RequestMethod.GET)
	public ModelAndView retrieveBookListForManage() {
		ModelAndView mv = new ModelAndView();
		List<Map<String, String>> bookList = bookService.retrieveBookList();
		
		mv.addObject("bookList", bookList);
		mv.setViewName("stock/stockList");
		return mv;
	}
	
	@RequestMapping(value="/kw/book/retrieveBookListForCustomer.do", method=RequestMethod.GET)
	public ModelAndView retrieveBookListForCustomer() {
		ModelAndView mv = new ModelAndView();
		List<Map<String, String>> bookList = bookService.retrieveBookList();
		
		mv.addObject("bookList", bookList);
		mv.setViewName("book/bookList");
		return mv;
	}
	
	@RequestMapping(value="/kw/book/retrieveBook.do", method=RequestMethod.GET)
	public ModelAndView retrieveBook(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Map<String, String> bookParam = new HashMap<String, String>();
		
		String bookNum = request.getParameter("bookNum");
		bookParam.put("bookNum", bookNum);
		
		BookVO book = bookService.retrieveBook(bookParam);
		mv.addObject("book", book);
		mv.setViewName("book/bookDetail");
		
		return mv;
	}
}
