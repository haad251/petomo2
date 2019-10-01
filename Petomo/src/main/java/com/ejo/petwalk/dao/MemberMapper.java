package com.ejo.petwalk.dao;

import java.util.List;

import com.ejo.petwalk.vo.MemberVO;
import com.ejo.petwalk.vo.PetVO;
import com.ejo.petwalk.vo.SitterVO;

public interface MemberMapper {
    public MemberVO selectMember(MemberVO member);
	public MemberVO duplcheck(MemberVO member);
	public int signup(MemberVO member);
	public MemberVO login(MemberVO member);
	public MemberVO idpwchck(MemberVO member);
	public SitterVO idpwchckSitter(SitterVO sitter);
	public int memberupdate(MemberVO member);
	public int deleteAccount(MemberVO member);
	public MemberVO selectDogId(PetVO pet);
	public int insertPet(PetVO pet);
	public List<PetVO> selectDogByMemberId(PetVO pet);
}
