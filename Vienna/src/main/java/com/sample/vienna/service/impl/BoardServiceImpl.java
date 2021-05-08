package com.sample.vienna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.vienna.domain.BoardVO;
import com.sample.vienna.mapper.BoardMapper;
import com.sample.vienna.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> boardList(BoardVO boardVal) {
		return mapper.boardList(boardVal);
	}

	@Override
	public void boardInsert(BoardVO boardVal) {
		mapper.boardInsert(boardVal);
	}
	
}
