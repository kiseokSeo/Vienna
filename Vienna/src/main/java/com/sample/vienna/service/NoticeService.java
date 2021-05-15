package com.sample.vienna.service;

import java.util.List;

import com.sample.vienna.domain.ComBoardVO;

public interface NoticeService {

	public List<ComBoardVO> noticeList(ComBoardVO comBoardVal);
	
	public void noticeInsert(ComBoardVO comBoardVal);
	
}
