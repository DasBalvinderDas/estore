package eManage.model;

public class ProductBean {
	
	private int product_id;
	private String product_name;
	private String product_description;
	private String product_ori_price;
	private String product_sell_price;
	private String product_profit;
	private String product_quantity;
	private String product_supplier;
	public boolean valid;
	private int store_id;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_ori_price() {
		return product_ori_price;
	}
	public void setProduct_ori_price(String product_ori_price) {
		this.product_ori_price = product_ori_price;
	}
	public String getProduct_sell_price() {
		return product_sell_price;
	}
	public void setProduct_sell_price(String product_sell_price) {
		this.product_sell_price = product_sell_price;
	}
	public String getProduct_profit() {
		return product_profit;
	}
	public void setProduct_profit(String product_profit) {
		this.product_profit = product_profit;
	}
	public String getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(String product_quantity) {
		this.product_quantity = product_quantity;
	}
	public String getProduct_supplier() {
		return product_supplier;
	}
	public void setProduct_supplier(String product_supplier) {
		this.product_supplier = product_supplier;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	
}
