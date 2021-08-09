package com.sample.vienna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.vienna.domain.MemberVO;
import com.sample.vienna.mapper.MemberMapper;
import com.sample.vienna.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> login(MemberVO memberVal) {
		return mapper.login(memberVal);
	}
	
	@Override
	public List<MemberVO> checkUserWithSessionKey(MemberVO memberVal) {
		return mapper.checkUserWithSessionKey(memberVal);
	}

	@Override
	public void keepLogin(MemberVO memberVal) {
		mapper.keepLogin(memberVal);
	}
	
   @Override
   public Integer idCheck(MemberVO memberVal) {
      return mapper.idCheck(memberVal);
   }

   @Override
   public void insertMember(MemberVO memberVal) {
      mapper.insertMember(memberVal);
   }
}
