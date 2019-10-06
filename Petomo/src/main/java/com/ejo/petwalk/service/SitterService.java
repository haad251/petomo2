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
		return dao.updateSitter(sitter);
	}
	
	public SitterVO selectOneSitter(String st_id){
		return dao.selectOneSitter(st_id);
	}


	public int insertSitterImage(FileVO sitterFile){
		return dao.insertSitterImage(sitterFile);
	}

	public int deleteSitterImage(SitterVO sitter){
		return dao.deleteSitterImage(sitter);
	}
	
	public List<SitterVO> selectAllSitter(){
		List<SitterVO> result = dao.selectAllSitter();
		return result;
	}
	
	public FileVO selectSitterProfileImg(SitterVO sitter){
		return dao.selectSitterProfileImg(sitter);
	}

	public SitterVO duplcheck(SitterVO sitter) {
		return dao.selectOneSitter(sitter.getSt_id());
	}

	public List<SitterVO> selectAllSitterByLoc(String st_loc1) {
		List<SitterVO> result = dao.selectAllSitterByLoc(st_loc1);
		return result;
	}
	
	
	
	
}
