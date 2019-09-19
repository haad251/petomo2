package com.ejo.petwalk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.MemberMapper;
import com.ejo.petwalk.vo.MemberVO;
import com.ejo.petwalk.vo.SitterVO;

@Service
public class MemberService {

	@Autowired
	MemberMapper dao;

	public MemberVO selectMember(MemberVO member) throws Exception {
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

	public int memberupdate(MemberVO member) {
		return dao.memberupdate(member);
	}
}
