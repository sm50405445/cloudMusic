package org.web.DTO;

public class CartDTO {

	private int cartId;
	private String username;
	private String goodsName;
	private int goodsPrice;
	private String goodsimg;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}
	public CartDTO(int cartId, String username, String goodsName, int goodsPrice) {
		super();
		this.cartId = cartId;
		this.username = username;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
	}
	public CartDTO(int cartId, String username, String goodsName, int goodsPrice, String goodsimg) {
		super();
		this.cartId = cartId;
		this.username = username;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsimg = goodsimg;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsimg() {
		return goodsimg;
	}
	public void setGoodsimg(String goodsimg) {
		this.goodsimg = goodsimg;
	}
	
	
}
