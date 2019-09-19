package com.ejo.petwalk.dao;


import java.util.ArrayList;

import com.ejo.petwalk.vo.FileVO;
import com.ejo.petwalk.vo.SitterVO;

public interface SitterMapper {
	
	public int updateSitter(SitterVO sitter) throws Exception;
	public SitterVO selectOneSitter(SitterVO st) throws Exception;
	public ArrayList<SitterVO> selectAllSitter() throws Exception; // ������ �������� Manager�� ��� sitter�� ����� ������ �� ����ϴ� �޼��� 
	public int insertSitterImage(FileVO sitterFile) throws Exception;
    public SitterVO selectSitter(SitterVO sitter) throws Exception;

}
