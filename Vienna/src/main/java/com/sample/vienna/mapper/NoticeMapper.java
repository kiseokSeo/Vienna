package com.sample.vienna.mapper;

import java.util.List;

import com.sample.vienna.domain.ComBoardVO;

public interface NoticeMapper {

	public List<ComBoardVO> noticeList(ComBoardVO comBoardVal);
	
	public void noticeInsert(ComBoardVO comBoardVal);
	
}
