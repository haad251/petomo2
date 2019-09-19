package com.ejo.petwalk.vo;

public class ReservationVO {
	private String res_id,sitter_id,service_id,mb_id,res_start,res_end,res_date,res_status,res_visit_type,res_home_pw,res_frontdoor_pw,res_hidden_place,res_amount,res_review,res_rate,res_memo1,res_memo2,res_memo3;

	public ReservationVO(String res_id, String sitter_id, String service_id, String mb_id, String res_start,
			String res_end, String res_date, String res_status, String res_visit_type, String res_home_pw,
			String res_frontdoor_pw, String res_hidden_place, String res_amount, String res_review, String res_rate,
			String res_memo1, String res_memo2, String res_memo3) {
		super();
		this.res_id = res_id;
		this.sitter_id = sitter_id;
		this.service_id = service_id;
		this.mb_id = mb_id;
		this.res_start = res_start;
		this.res_end = res_end;
		this.res_date = res_date;
		this.res_status = res_status;
		this.res_visit_type = res_visit_type;
		this.res_home_pw = res_home_pw;
		this.res_frontdoor_pw = res_frontdoor_pw;
		this.res_hidden_place = res_hidden_place;
		this.res_amount = res_amount;
		this.res_review = res_review;
		this.res_rate = res_rate;
		this.res_memo1 = res_memo1;
		this.res_memo2 = res_memo2;
		this.res_memo3 = res_memo3;
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

	public String getSitter_id() {
		return sitter_id;
	}

	public void setSitter_id(String sitter_id) {
		this.sitter_id = sitter_id;
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

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	public String getRes_visit_type() {
		return res_visit_type;
	}

	public void setRes_visit_type(String res_visit_type) {
		this.res_visit_type = res_visit_type;
	}

	public String getRes_home_pw() {
		return res_home_pw;
	}

	public void setRes_home_pw(String res_home_pw) {
		this.res_home_pw = res_home_pw;
	}

	public String getRes_frontdoor_pw() {
		return res_frontdoor_pw;
	}

	public void setRes_frontdoor_pw(String res_frontdoor_pw) {
		this.res_frontdoor_pw = res_frontdoor_pw;
	}

	public String getRes_hidden_place() {
		return res_hidden_place;
	}

	public void setRes_hidden_place(String res_hidden_place) {
		this.res_hidden_place = res_hidden_place;
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

	public String getRes_memo1() {
		return res_memo1;
	}

	public void setRes_memo1(String res_memo1) {
		this.res_memo1 = res_memo1;
	}

	public String getRes_memo2() {
		return res_memo2;
	}

	public void setRes_memo2(String res_memo2) {
		this.res_memo2 = res_memo2;
	}

	public String getRes_memo3() {
		return res_memo3;
	}

	public void setRes_memo3(String res_memo3) {
		this.res_memo3 = res_memo3;
	}

	@Override
	public String toString() {
		return "Reservation [res_id=" + res_id + ", sitter_id=" + sitter_id + ", service_id=" + service_id + ", mb_id="
				+ mb_id + ", res_start=" + res_start + ", res_end=" + res_end + ", res_date=" + res_date
				+ ", res_status=" + res_status + ", res_visit_type=" + res_visit_type + ", res_home_pw=" + res_home_pw
				+ ", res_frontdoor_pw=" + res_frontdoor_pw + ", res_hidden_place=" + res_hidden_place + ", res_amount="
				+ res_amount + ", res_review=" + res_review + ", res_rate=" + res_rate + ", res_memo1=" + res_memo1
				+ ", res_memo2=" + res_memo2 + ", res_memo3=" + res_memo3 + "]";
	}
}
