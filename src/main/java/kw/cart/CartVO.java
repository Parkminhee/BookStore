package kw.cart;

import java.io.Serializable;

public class CartVO implements Serializable{
	private int cartNum;
	private String id;
	private int bookNum;
	private int cartCount;
	private int cartPrice;
	private String cartRegDate;
	
	public CartVO() {
		super();
	}
	
	public CartVO(int cartNum, String id, int bookNum,
			int cartCount, int cartPrice, String cartRegDate) {
		super();
		this.cartNum = cartNum;
		this.id = id;
		this.bookNum = bookNum;
		this.cartCount = cartCount;
		this.cartPrice = cartPrice;
		this.cartRegDate = cartRegDate;
	}
	
	public int getCartNum() {
		return cartNum;
	}
	public String getId() {
		return id;
	}
	public int getBookNum() {
		return bookNum;
	}
	public int getCartCount() {
		return cartCount;
	}
	public int getCartPrice() {
		return cartPrice;
	}
	public String getCartRegDate() {
		return cartRegDate;
	}
	
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}
	public void setCartRegDate(String cartRegDate) {
		this.cartRegDate = cartRegDate;
	}
}
