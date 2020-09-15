package kw.order;

import java.io.Serializable;

public class OrderVO implements Serializable{
	private int orderNum;
	private int bookNum;
	private String id;
	private int orderCount;
	private int orderPrice;
	private String orderYN;
	private String orderDate;
	
	public OrderVO() {
		super();
	}
	
	public OrderVO(int orderNum, int bookNum, String id,
			int orderCount, int orderPrice, String orderYN, String orderDate) {
		super();
		this.orderNum = orderNum;
		this.bookNum = bookNum;
		this.id = id;
		this.orderCount = orderCount;
		this.orderPrice = orderPrice;
		this.orderYN = orderYN;
		this.orderDate = orderDate;
	}
	
	public int getOrderNum() {
		return orderNum;
	}
	public int getBookNum() {
		return bookNum;
	}
	public String getId() {
		return id;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public String getOrderYN() {
		return orderYN;
	}
	public String getOrderDate() {
		return orderDate;
	}
	
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public void setOrderYN(String orderYN) {
		this.orderYN = orderYN;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
}
