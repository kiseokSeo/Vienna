package com.sample.vienna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.vienna.domain.ComBoardVO;
import com.sample.vienna.mapper.NoticeMapper;
import com.sample.vienna.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public List<ComBoardVO> noticeList(ComBoardVO comBoardVal) {
		return mapper.noticeList(comBoardVal);
	}

	@Override
	public void noticeInsert(ComBoardVO comBoardVal) {
		mapper.noticeInsert(comBoardVal);
	}
	
}
