package com.ejo.petwalk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.MemberMapper;
import com.ejo.petwalk.vo.FileVO;
import com.ejo.petwalk.vo.MemberVO;
import com.ejo.petwalk.vo.PetVO;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.SitterVO;

@Service
public class MemberService {

	@Autowired
	MemberMapper dao;

	public MemberVO selectMember(MemberVO member) {
		return dao.selectMember(member);
	}

	public MemberVO duplcheck(MemberVO member) {
		return dao.duplcheck(member);
	}

	public int signup(MemberVO member) {
		return dao.signup(member);
	}

	public MemberVO login(MemberVO member) {
		return dao.login(member);
	}
	
	public MemberVO idpwchck(MemberVO member) {
		return dao.idpwchck(member);
	}
	
	public SitterVO idpwchckSitter(SitterVO sitter) {
		return dao.idpwchckSitter(sitter);
	}

	public int memberupdate(MemberVO member) {
		return dao.memberupdate(member);
	}

	public int deleteAccount(MemberVO member) {
		return dao.deleteAccount(member);
	}

	public MemberVO dogIdCheck(PetVO pet) {
		return dao.selectDogId(pet);
	}

	public int petSignup(PetVO pet) {
		return dao.insertPet(pet);
	}

	public List<PetVO> dogList(PetVO pet) {
		return dao.selectDogByMemberId(pet);
	}

	public int insertMemberImage(FileVO memberFile){
		return dao.insertMemberImage(memberFile);
	}

	public int deleteMemberImage(MemberVO member){
		return dao.deleteMemberImage(member);
	}

	public FileVO selectMemberProfileImg(MemberVO member){
		return dao.selectMemberProfileImg(member);
	}

	public int deletePet(PetVO pet) {
		return dao.deletePet(pet);
	}

	public List<MemberVO> selectAllMember() {
		return dao.selectAllMember();
	}

	public String streamchck(MemberVO member) {
		return dao.selectStreamId();
	}




}
