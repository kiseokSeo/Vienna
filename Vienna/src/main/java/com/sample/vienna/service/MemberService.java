package com.sample.vienna.service;

import java.util.List;

import com.sample.vienna.domain.MemberVO;

public interface MemberService {

	public List<MemberVO> login(MemberVO memberVal);
	
	public void keepLogin(MemberVO memberVal);
	
	public List<MemberVO> checkUserWithSessionKey(MemberVO memberVal);

   public Integer idCheck(MemberVO memberVal);
   
   public void insertMember(MemberVO memberVal);
}
