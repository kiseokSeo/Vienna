package com.sample.vienna.service;

import java.util.List;

import com.sample.vienna.domain.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList(BoardVO boardVal);
	
	public void boardInsert(BoardVO boardVal);
	
}
