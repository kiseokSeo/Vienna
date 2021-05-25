package com.sample.vienna.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.vienna.domain.MemberVO;
import com.sample.vienna.service.MemberService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	MemberService memberService;

	@RequestMapping("/main")
	public String boardList() {
		return "main/main";
	}

	@RequestMapping("/login")
	public String loginPage() {
		return "main/login";
	}

	@RequestMapping(value="/loginProcess", method=RequestMethod.POST)
	public String loginProcess(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		String returnURL ="";
        if ( session.getAttribute("login") !=null ){
            // 기존에 login이란 세션 값이 존재한다면
            session.removeAttribute("login");// 기존값을 제거해 준다.
        }
        HashMap<String, Object> map = new HashMap<String, Object>();
		MemberVO memberVal = new MemberVO();
		memberVal.setId((String) request.getParameter("id"));
		memberVal.setPass((String) request.getParameter("pass"));

		System.out.println("111");
        map.put("login", memberService.login(memberVal));
        System.out.println("222");
         
        // 로그인이 성공하면 UserVO 객체를 반환함.
        //MemberVO vo = memberService.login(memberVal)
        if ( map.get("login") !=null ){// 로그인 성공
        	System.out.println("333");
        	
            session.setAttribute("login", map.get("login"));// 세션에 login인이란 이름으로 MemberVO 객체를 저장해 놈.
            returnURL ="redirect:/main/main";// 로그인 성공시 메인페이지로 바로 이동하도록 하고
        }else {// 로그인에 실패한 경우
            returnURL ="redirect:/main/login";// 로그인 폼으로 다시 가도록 함
        }
         
        return returnURL;
	}
	// 로그아웃 하는 부분
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.invalidate();// 세션 전체를 날려버림
//      session.removeAttribute("login"); // 하나씩 하려면 이렇게 해도 됨.
        return "redirect:/main/main";// 로그아웃 후 게시글 목록으로 이동하도록...함
    }
}
