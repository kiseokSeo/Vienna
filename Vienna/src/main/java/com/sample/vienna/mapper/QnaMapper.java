package com.sample.vienna.mapper;

import java.util.List;

import com.sample.vienna.domain.ComBoardVO;

public interface QnaMapper {

	public List<ComBoardVO> qnaList(ComBoardVO comBoardVal);
	
	public void qnaInsert(ComBoardVO comBoardVal);
	
}
