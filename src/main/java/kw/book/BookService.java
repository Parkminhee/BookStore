package kw.book;

import java.util.List;
import java.util.Map;

public interface BookService {
	public void createBook(BookVO book);
	public BookVO retrieveBook(Map<String, String> bookParam);
	public List<Map<String, String>> retrieveBookList();
	public void updateBook(BookVO bookVO);
	public void updateBookCountMinus(Map<String, String> bookParam);
	public void updateBookCountPlus(Map<String, String> bookParam);
}
