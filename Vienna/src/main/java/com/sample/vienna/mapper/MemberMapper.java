package com.sample.vienna.mapper;

import java.util.List;

import com.sample.vienna.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> login(MemberVO memberVal);
	
	public void keepLogin(MemberVO memberVal);
	
	public List<MemberVO> checkUserWithSessionKey(MemberVO memberVal);

}
