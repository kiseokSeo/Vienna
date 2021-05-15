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
import com.sample.vienna.service.NoticeService;

@Controller
@RequestMapping("/notice")

public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/noticeBoard")
	public String noticeBoardMain(HttpServletRequest request, Model model) {
		return "board/noticeBoard";
		
	}
	@RequestMapping(value = "/noticeList", method = RequestMethod.POST)
	@ResponseBody
	public Object noticeboardList(HttpServletRequest request, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ComBoardVO comBoardVal = new ComBoardVO();
		
		comBoardVal.setTitle((String) request.getParameter("title"));
		comBoardVal.setContents((String) request.getParameter("contents"));
		comBoardVal.setCBy((String) request.getParameter("CreateBy"));

        map.put("noticeList", noticeService.noticeList(comBoardVal));
        return map;
	}
	
	@RequestMapping("/noticeBoardRegister")
	public String noticeRegister(HttpServletRequest request, Model model) {
		return "board/noticeBoardRegister";
	}

	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public String boardInsert(HttpServletRequest request, Model model) {
		ComBoardVO comBoardVal = new ComBoardVO();
		
		comBoardVal.setTitle((String) request.getParameter("title"));
		comBoardVal.setContents((String) request.getParameter("contents"));
		comBoardVal.setCBy((String) request.getParameter("createBy"));
		
		
		noticeService.noticeInsert(comBoardVal);
		
		return "board/noticeBoardRegister";
	}

	
}
