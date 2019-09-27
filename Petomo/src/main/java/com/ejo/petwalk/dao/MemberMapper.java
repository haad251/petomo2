package com.ejo.petwalk.dao;

import com.ejo.petwalk.vo.MemberVO;
import com.ejo.petwalk.vo.SitterVO;

public interface MemberMapper {
    public MemberVO selectMember(MemberVO member) throws Exception;
	public MemberVO duplcheck(MemberVO member);
	public int signup(MemberVO member);
	public MemberVO login(MemberVO member);
	public MemberVO idpwchck(MemberVO member);
	public SitterVO idpwchckSitter(SitterVO sitter);
	public int memberupdate(MemberVO member);
	public int deleteAccount(MemberVO member);
}
