package com.ejo.petwalk.dao;


import java.util.ArrayList;

import com.ejo.petwalk.vo.FileVO;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.SitterVO;

public interface SitterMapper {
	
	public int updateSitter(SitterVO sitter);
	public SitterVO selectOneSitter(String st_id);
	public ArrayList<SitterVO> selectAllSitter(); // ������ �������� Manager�� ��� sitter�� ����� ������ �� ����ϴ� �޼��� 
	public int insertSitterImage(FileVO sitterFile);
	public int deleteSitterImage(SitterVO sitter);
    public SitterVO loginSitter(SitterVO sitter);
	public int insertSitter(SitterVO sitter);
	public FileVO selectSitterProfileImg(SitterVO sitter);
	
}
