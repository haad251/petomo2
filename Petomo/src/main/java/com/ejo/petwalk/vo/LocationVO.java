package com.ejo.petwalk.vo;

public class LocationVO {
	public String loc_id,res_id,loc_long,loc_lat,loc_time,loc_action;

	public LocationVO(String loc_id, String res_id, String loc_long, String loc_lat, String loc_time, String loc_action) {
		super();
		this.loc_id = loc_id;
		this.res_id = res_id;
		this.loc_long = loc_long;
		this.loc_lat = loc_lat;
		this.loc_time = loc_time;
		this.loc_action = loc_action;
	}

	public LocationVO() {
		super();
	}

	public String getLoc_id() {
		return loc_id;
	}

	public void setLoc_id(String loc_id) {
		this.loc_id = loc_id;
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getLoc_long() {
		return loc_long;
	}

	public void setLoc_long(String loc_long) {
		this.loc_long = loc_long;
	}

	public String getLoc_lat() {
		return loc_lat;
	}

	public void setLoc_lat(String loc_lat) {
		this.loc_lat = loc_lat;
	}

	public String getLoc_time() {
		return loc_time;
	}

	public void setLoc_time(String loc_time) {
		this.loc_time = loc_time;
	}

	public String getLoc_action() {
		return loc_action;
	}

	public void setLoc_action(String loc_action) {
		this.loc_action = loc_action;
	}

	@Override
	public String toString() {
		return "Location [loc_id=" + loc_id + ", res_id=" + res_id + ", loc_long=" + loc_long + ", loc_lat=" + loc_lat
				+ ", loc_time=" + loc_time + ", loc_action=" + loc_action + "]";
	}
	
	
}
