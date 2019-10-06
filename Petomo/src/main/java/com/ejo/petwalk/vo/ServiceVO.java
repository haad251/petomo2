package com.ejo.petwalk.vo;

public class ServiceVO {
	private String service_id, service_name, service_price, service_time, service_info,service_type;

	public ServiceVO(String service_id, String service_name, String service_price, String service_time,
			String service_info,String service_type) {
		super();
		this.service_id = service_id;
		this.service_name = service_name; 
		this.service_price = service_price;
		this.service_time = service_time;
		this.service_info = service_info; 
		this.service_type = service_type; 
	}

	public ServiceVO() {
		super();
	}

	public String getService_id() {
		return service_id;
	}

	public void setService_id(String service_id) {
		this.service_id = service_id;
	}

	public String getService_name() {
		return service_name;
	}

	public void setService_name(String service_name) {
		this.service_name = service_name;
	}

	public String getService_price() {
		return service_price;
	}

	public void setService_price(String service_price) {
		this.service_price = service_price;
	}

	public String getService_time() {
		return service_time;
	}

	public void setService_time(String service_time) {
		this.service_time = service_time;
	}

	public String getService_info() {
		return service_info;
	}

	public void setService_info(String service_info) {
		this.service_info = service_info;
	}
	
	

	public String getService_type() {
		return service_type;
	}

	public void setService_type(String service_type) {
		this.service_type = service_type;
	}

	@Override
	public String toString() {
		return "ServiceVO [service_id=" + service_id + ", service_name=" + service_name + ", service_price="
				+ service_price + ", service_time=" + service_time + ", service_info=" + service_info
				+ ", service_type=" + service_type + "]";
	}

	
	
	
	
}
