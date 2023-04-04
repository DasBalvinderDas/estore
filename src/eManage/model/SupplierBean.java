package eManage.model;

public class SupplierBean {
	
	private int supplier_id;
	private String supplier_name;
	private String supplier_address;
	private String supplier_contact_num;
	private String supplier_description;
	public boolean valid;
	
	public int getSupplier_id() {
		return supplier_id;
	}
	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	public String getSupplier_address() {
		return supplier_address;
	}
	public void setSupplier_address(String supplier_address) {
		this.supplier_address = supplier_address;
	}
	public String getSupplier_contact_num() {
		return supplier_contact_num;
	}
	public void setSupplier_contact_num(String supplier_contact_num) {
		this.supplier_contact_num = supplier_contact_num;
	}
	public String getSupplier_description() {
		return supplier_description;
	}
	public void setSupplier_description(String supplier_description) {
		this.supplier_description = supplier_description;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}

}
