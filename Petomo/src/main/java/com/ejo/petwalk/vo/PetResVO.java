package com.ejo.petwalk.vo;

public class PetResVO {
	private String pet_id, res_id;

	public PetResVO(String pet_id, String res_id) {
		super();
		this.pet_id = pet_id;
		this.res_id = res_id;
	}

	public PetResVO() {
		super();
	}

	public String getPet_id() {
		return pet_id;
	}

	public void setPet_id(String pet_id) {
		this.pet_id = pet_id;
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	@Override
	public String toString() {
		return "PetResVO [pet_id=" + pet_id + ", res_id=" + res_id + "]";
	}
	
	
}
