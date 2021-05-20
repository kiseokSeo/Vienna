package com.sample.vienna.service;

import java.util.List;

import com.sample.vienna.domain.ComBoardVO;

public interface QnaService {

	public List<ComBoardVO> qnaList(ComBoardVO comBoardVal);
	
	public void qnaInsert(ComBoardVO comBoardVal);

	
	
}
