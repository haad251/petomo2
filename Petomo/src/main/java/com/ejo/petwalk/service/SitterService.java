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
	
	public SitterVO loginSitter(SitterVO sitter){
		return dao.loginSitter(sitter);
	}
	
	public int insertSitter(SitterVO sitter){
		return dao.insertSitter(sitter);
	}
	
	public int updateSitter(SitterVO sitter){
		int result = dao.updateSitter(sitter);
		return result;
	}
	
	public SitterVO selectOneSitter(String st_id){
		SitterVO result = dao.selectOneSitter(st_id);
		return result;
	}


	public int insertSitterImage(FileVO sitterFile){
		int result = dao.insertSitterImage(sitterFile);
		return result;
	}

	
	public List<SitterVO> selectAllSitter(){
		List<SitterVO> result = dao.selectAllSitter();
		return result;
	}
	
}
