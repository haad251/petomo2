package com.ejo.petwalk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.SitterMapper;
import com.ejo.petwalk.vo.FileVO;
import com.ejo.petwalk.vo.SitterVO;

@Service
public class SitterService {

	@Autowired
	SitterMapper dao;
	
	public SitterVO selectSitter(SitterVO sitter) throws Exception{
		return dao.selectSitter(sitter);
	}
	
	public int updateSitter(SitterVO sitter) throws Exception{
		int result = dao.updateSitter(sitter);
		return result;
	}
	
	public SitterVO selectOneSitter(SitterVO st_id) throws Exception{
		SitterVO result = dao.selectOneSitter(st_id);
		return result;
	}


	public int insertSitterImage(FileVO sitterFile) throws Exception {
		int result = dao.insertSitterImage(sitterFile);
		return result;
	}

	
	public List<SitterVO> selectAllSitter() throws Exception{
		List<SitterVO> result = dao.selectAllSitter();
		return result;
	}
	
}
