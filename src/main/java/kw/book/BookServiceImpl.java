package kw.book;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("bookService")
public class BookServiceImpl implements BookService {
	@Resource(name="bookDAO")
	private BookDAO bookDAO;
	
	public void createBook(BookVO book) {
		bookDAO.createBook(book);
	}
	
	public BookVO retrieveBook(Map<String, String> bookParam) {
		return bookDAO.retrieveBook(bookParam);
	}
	
	public List<Map<String, String>> retrieveBookList(){
		return bookDAO.retrieveBookList();
	}
	
	public void updateBook(BookVO bookVO) {
		bookDAO.updateBook(bookVO);
	}
	
	public void updateBookCountMinus(Map<String, String> bookParam) {
		bookDAO.updateBookCountMinus(bookParam);
	}
	
	public void updateBookCountPlus(Map<String, String> bookParam) {
		bookDAO.updateBookCountPlus(bookParam);
	}
}
