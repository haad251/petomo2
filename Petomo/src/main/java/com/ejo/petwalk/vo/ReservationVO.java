package com.ejo.petwalk.vo;

public class ReservationVO {
	private String res_id,st_id,service_id,mb_id,res_start,res_end,res_status,
					res_amount,res_review,res_rate,res_memo;

	public ReservationVO(String res_id, String st_id, String service_id, String mb_id, String res_start, String res_end,
			 String res_status, String res_amount, String res_review, String res_rate,
			String res_memo) {
		super();
		this.res_id = res_id;
		this.st_id = st_id;
		this.service_id = service_id;
		this.mb_id = mb_id;
		this.res_start = res_start;
		this.res_end = res_end;
		this.res_status = res_status;
		this.res_amount = res_amount;
		this.res_review = res_review;
		this.res_rate = res_rate;
		this.res_memo = res_memo;
	}

	public ReservationVO() {
		super();
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	public String getService_id() {
		return service_id;
	}

	public void setService_id(String service_id) {
		this.service_id = service_id;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getRes_start() {
		return res_start;
	}

	public void setRes_start(String res_start) {
		this.res_start = res_start;
	}

	public String getRes_end() {
		return res_end;
	}

	public void setRes_end(String res_end) {
		this.res_end = res_end;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	public String getRes_amount() {
		return res_amount;
	}

	public void setRes_amount(String res_amount) {
		this.res_amount = res_amount;
	}

	public String getRes_review() {
		return res_review;
	}

	public void setRes_review(String res_review) {
		this.res_review = res_review;
	}

	public String getRes_rate() {
		return res_rate;
	}

	public void setRes_rate(String res_rate) {
		this.res_rate = res_rate;
	}

	public String getRes_memo() {
		return res_memo;
	}

	public void setRes_memo(String res_memo) {
		this.res_memo = res_memo;
	}

	@Override
	public String toString() {
		return "ReservationVO [res_id=" + res_id + ", st_id=" + st_id + ", service_id=" + service_id + ", mb_id="
				+ mb_id + ", res_start=" + res_start + ", res_end=" + res_end  
				+ ", res_status=" + res_status + ", res_amount=" + res_amount + ", res_review=" + res_review
				+ ", res_rate=" + res_rate + ", res_memo=" + res_memo + "]";
	}

	


	
}
