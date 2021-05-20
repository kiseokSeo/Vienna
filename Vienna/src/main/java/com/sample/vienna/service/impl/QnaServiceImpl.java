package com.sample.vienna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.vienna.domain.ComBoardVO;
import com.sample.vienna.mapper.QnaMapper;
import com.sample.vienna.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper mapper;
	
	@Override
	public List<ComBoardVO> qnaList(ComBoardVO comBoardVal) {
		return mapper.qnaList(comBoardVal);
	}

	@Override
	public void qnaInsert(ComBoardVO comBoardVal) {
		mapper.qnaInsert(comBoardVal);
	}
	
}
