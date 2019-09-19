package com.ejo.petwalk.vo;

public class FileVO {
	private String file_id, file_sav, file_org, file_type, file_no;

	public FileVO() {
		super();
	}

	public FileVO(String file_id, String file_sav, String file_org, String file_type, String file_no) {
		super();
		this.file_id = file_id;
		this.file_sav = file_sav;
		this.file_org = file_org;
		this.file_type = file_type;
		this.file_no = file_no;
	}

	public FileVO(String file_sav, String file_org, String file_type, String file_no) {
		super();
		this.file_sav = file_sav;
		this.file_org = file_org;
		this.file_type = file_type;
		this.file_no = file_no;
	}

	public String getFile_id() {
		return file_id;
	}

	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}

	public String getFile_sav() {
		return file_sav;
	}

	public void setFile_sav(String file_sav) {
		this.file_sav = file_sav;
	}

	public String getFile_org() {
		return file_org;
	}

	public void setFile_org(String file_org) {
		this.file_org = file_org;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public String getFile_no() {
		return file_no;
	}

	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}

	@Override
	public String toString() {
		return "FileVO [file_id=" + file_id + ", file_sav=" + file_sav + ", file_org=" + file_org + ", file_type="
				+ file_type + ", file_no=" + file_no + "]";
	}

	

	
	
}
