package eManage.model;

public class SalesBean {
	
	private int transaction_id;
	private String transaction_date;
	private String product_name;
	private String product_quantity;
	private int product_sell_price;
	private int product_amount;
	public boolean valid;
	
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getTransaction_date() {
		return transaction_date;
	}
	public void setTransaction_date(String transaction_date) {
		this.transaction_date = transaction_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(String product_quantity) {
		this.product_quantity = product_quantity;
	}
	public int getProduct_sell_price() {
		return product_sell_price;
	}
	public void setProduct_sell_price(int productsellprice) {
		this.product_sell_price = productsellprice;
	}
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int amount) {
		this.product_amount = amount;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}

}
