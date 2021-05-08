package com.sample.vienna.mapper;

import java.util.List;

import com.sample.vienna.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> boardList(BoardVO boardVal);
	
	public void boardInsert(BoardVO boardVal);
	
}
