package kw.book;

import java.io.Serializable;

public class BookVO implements Serializable {
	private int bookNum;
	private String bookName;
	private String bookWriter;
	private String bookPublish;
	private int bookPrice;
	private int bookCount;
	
	public BookVO() {
		super();
	}
	
	public BookVO(int bookNum, String bookName, String bookWriter, String bookPublish, int bookPrice, int bookCount) {
		super();
		this.bookNum = bookNum;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.bookPublish = bookPublish;
		this.bookPrice = bookPrice;
		this.bookCount = bookCount;
	}

	public int getBookNum() {
		return bookNum;
	}
	
	public String getBookName() {
		return bookName;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public String getBookPublish() {
		return bookPublish;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public int getBookCount() {
		return bookCount;
	}
	
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public void setBookPublish(String bookPublish) {
		this.bookPublish = bookPublish;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
}
