package com.sample.vienna.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.vienna.domain.ComBoardVO;
import com.sample.vienna.service.QnaService;

@Controller
@RequestMapping("/qna")

public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/qnaBoard")
	public String qnaBoardMain(HttpServletRequest request, Model model) {
		return "board/qnaBoard";
		
	}
	@RequestMapping(value = "/qnaList", method = RequestMethod.POST)
	@ResponseBody
	public Object qnaboardList(HttpServletRequest request, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ComBoardVO comBoardVal = new ComBoardVO();
		
		comBoardVal.setTitle((String) request.getParameter("title"));
		comBoardVal.setContents((String) request.getParameter("contents"));
		comBoardVal.setCBy((String) request.getParameter("createBy"));

        map.put("qnaList", qnaService.qnaList(comBoardVal));
        return map;
	}
	
	@RequestMapping("/qnaBoardRegister")
	public String noticeRegister(HttpServletRequest request, Model model) {
		return "board/qnaBoardRegister";
	}

	@RequestMapping(value = "/qnaInsert", method = RequestMethod.POST)
	public String boardInsert(HttpServletRequest request, Model model) {
		ComBoardVO comBoardVal = new ComBoardVO();
		
		comBoardVal.setTitle((String) request.getParameter("title"));
		comBoardVal.setContents((String) request.getParameter("contents"));
		comBoardVal.setCBy((String) request.getParameter("createBy"));
		
		
		qnaService.qnaInsert(comBoardVal);
		
		return "board/qnaBoardRegister";
	}

	
}
