package com.gls.winter.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gls.winter.BoardService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	@Autowired
	UserServiceImpl service;
	@Autowired
	BoardService boardService;
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "login";
//	}
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(String t, Model model) {

//		/* 구글code 발행 */
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//
//		System.out.println("구글:" + url);
//
//		model.addAttribute("google_url", url);

		return "login";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback", method = RequestMethod.GET)
	public String googleCallback(HttpSession session, Model model, @RequestParam(required = false) HttpServletRequest request)
			throws IOException {
		System.out.println("googleCallback: Google login success");
		model.addAttribute("list", boardService.getBoardList());
		
		return "list"; 
	}

	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String loginCheck(HttpSession session, UserVO vo, HttpServletRequest request) {
		String returnURL = "";
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		session.setAttribute("userid", userid);
		session.setAttribute("username", username);
		System.out.println(username);
		
		UserVO loginvo = service.getUser(vo);
		if (loginvo != null) {
			System.out.println("로그인 성공!");
			session.setAttribute("login", loginvo);
			
			returnURL = "redirect:/board/list";
		} else {
			System.out.println("로그인 실패!");
			returnURL = "redirect:/login/login";
		}
		return returnURL;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		session.removeAttribute("userid");
		session.removeAttribute("username");
		return "redirect:/login/login";
	}

}
