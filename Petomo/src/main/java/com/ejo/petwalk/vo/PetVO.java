package com.ejo.petwalk.vo;

public class PetVO {
	private String pet_id,mb_id,pet_name,pet_sex,pet_birth,pet_weight,pet_type,pet_breed,pet_neuter,pet_status;

	public PetVO(String pet_id, String mb_id, String pet_name, String pet_sex, String pet_birth, String pet_weight,
			String pet_type, String pet_breed, String pet_neuter, String pet_status) {
		super();
		this.pet_id = pet_id;
		this.mb_id = mb_id;
		this.pet_name = pet_name;
		this.pet_sex = pet_sex;
		this.pet_birth = pet_birth;
		this.pet_weight = pet_weight;
		this.pet_type = pet_type;
		this.pet_breed = pet_breed;
		this.pet_neuter = pet_neuter;
		this.pet_status = pet_status;
	}

	public PetVO() {
		super();
	}

	public String getPet_id() {
		return pet_id;
	}

	public void setPet_id(String pet_id) {
		this.pet_id = pet_id;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public String getPet_sex() {
		return pet_sex;
	}

	public void setPet_sex(String pet_sex) {
		this.pet_sex = pet_sex;
	}

	public String getPet_birth() {
		return pet_birth;
	}

	public void setPet_birth(String pet_birth) {
		this.pet_birth = pet_birth;
	}

	public String getPet_weight() {
		return pet_weight;
	}

	public void setPet_weight(String pet_weight) {
		this.pet_weight = pet_weight;
	}

	public String getPet_type() {
		return pet_type;
	}

	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}

	public String getPet_breed() {
		return pet_breed;
	}

	public void setPet_breed(String pet_breed) {
		this.pet_breed = pet_breed;
	}

	public String getPet_neuter() {
		return pet_neuter;
	}

	public void setPet_neuter(String pet_neuter) {
		this.pet_neuter = pet_neuter;
	}

	public String getPet_status() {
		return pet_status;
	}

	public void setPet_status(String pet_status) {
		this.pet_status = pet_status;
	}

	@Override
	public String toString() {
		return "Pet [pet_id=" + pet_id + ", mb_id=" + mb_id + ", pet_name=" + pet_name + ", pet_sex=" + pet_sex
				+ ", pet_birth=" + pet_birth + ", pet_weight=" + pet_weight + ", pet_type=" + pet_type + ", pet_breed="
				+ pet_breed + ", pet_neuter=" + pet_neuter + ", pet_status=" + pet_status + "]";
	}
	
	
}
