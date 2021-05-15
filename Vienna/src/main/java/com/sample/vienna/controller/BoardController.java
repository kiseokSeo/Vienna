package com.sample.vienna.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.vienna.domain.BoardVO;
import com.sample.vienna.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/board")
	public String boardMain(HttpServletRequest request, Model model) {
				
		return "board/board";
	}
	
	@RequestMapping(value = "/boardList", method = RequestMethod.POST)
	@ResponseBody
	public Object boardList(HttpServletRequest request, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		BoardVO boardVal = new BoardVO();
		boardVal.setTitle((String) request.getParameter("title"));
		boardVal.setContent((String) request.getParameter("content"));
		boardVal.setWriter((String) request.getParameter("writer"));

        map.put("boardList", boardService.boardList(boardVal));
        return map;
	}
	
	@RequestMapping("/boardRegister")
	public String boardRegister(HttpServletRequest request, Model model) {
		return "board/boardRegister";
	}

	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public String boardInsert(HttpServletRequest request, Model model) {
		// 荑쇰━ �떒�뿉�꽌 �궗�슜�븷 媛� �뀑�똿
		BoardVO boardVal = new BoardVO();
		
		boardVal.setTitle((String) request.getParameter("title"));
		boardVal.setContent((String) request.getParameter("content"));
		boardVal.setWriter((String) request.getParameter("writer"));
		
		
		boardService.boardInsert(boardVal);
		
		return "board/boardRegister";
	}

	
}
