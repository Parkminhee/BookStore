package kw.book;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void createBook(BookVO book) {
		sqlSession.insert("book.createBook", book);
	}
	
	public BookVO retrieveBook(Map<String, String> bookParam) {
		return sqlSession.selectOne("book.retrieveBook", bookParam);
	}
	
	public List<Map<String, String>> retrieveBookList(){
		return sqlSession.selectList("book.retrieveBookList");
	}
	
	public void updateBook(BookVO bookVO) {
		sqlSession.update("book.updateBook", bookVO);
	}
	
	public void updateBookCountMinus(Map<String, String> bookParam) {
		sqlSession.update("book.updateBookCountMinus", bookParam);
	}
	
	public void updateBookCountPlus(Map<String, String> bookParam) {
		sqlSession.update("book.updateBookCountPlus", bookParam);
	}
}
