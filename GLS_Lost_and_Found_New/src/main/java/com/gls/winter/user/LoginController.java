package com.gls.winter.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.gls.winter.user.model.GoogleOAuthRequest;
import com.gls.winter.user.model.GoogleOAuthResponse;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	@Autowired
	UserServiceImpl service;
	
	final static String GOOGLE_AUTH_BASE_URL = "https://accounts.google.com/o/oauth2/v2/auth";
	final static String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
	final static String GOOGLE_REVOKE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/revoke";
	
	@Value("${api.client_id}")
	String clientId;
	@Value("${api.client_secret}")
	String clientSecret;
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "login";
//	}
	@RequestMapping(value="/google", method=RequestMethod.GET)
	public String google(RedirectAttributes rttr, Model model) {
		String url = "redirect:https://accounts.google.com/o/oauth2/v2/auth?client_id=60396027837-iev9qsg4ud3cb4plotgs65c6co5q9si9.apps.googleusercontent.com&redirect_uri=http://localhost:8080/winter/login/oauth2callback&response_type=code&scope=email%20profile%20openid&access_type=offline";
		return url;
	}
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
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
		public String googleAuth(Model model, @RequestParam(value = "code") String authCode, HttpServletRequest request,
				HttpSession session, UserVO vo, RedirectAttributes redirectAttributes) throws Exception {
			System.out.println("googleCallback: Google login success");

			// HTTP Request를 위한 RestTemplate
			RestTemplate restTemplate = new RestTemplate();

			// Google OAuth Access Token 요청을 위한 파라미터 세팅
			GoogleOAuthRequest googleOAuthRequestParam = new GoogleOAuthRequest();
			googleOAuthRequestParam.setClientId("60396027837-iev9qsg4ud3cb4plotgs65c6co5q9si9.apps.googleusercontent.com");
			googleOAuthRequestParam.setClientSecret("cpEdqia-vtMSKvCFQYmrmnMe");
			googleOAuthRequestParam.setCode(authCode);
			googleOAuthRequestParam.setRedirectUri("http://localhost:8080/winter/login/oauth2callback");
			googleOAuthRequestParam.setGrantType("authorization_code");

			// JSON 파싱을 위한 기본값 세팅
			// 요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
			ObjectMapper mapper = new ObjectMapper();
			mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
			mapper.setSerializationInclusion(Include.NON_NULL);

			// AccessToken 발급 요청
			ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam,
					String.class);

			// Token Request
			GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
			});

			// ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
			String jwtToken = result.getIdToken();
			String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
					.queryParam("id_token", jwtToken).toUriString();

			String resultJson = restTemplate.getForObject(requestUrl, String.class);

			Map<String, String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>() {
			});
			model.addAllAttributes(userInfo);
			model.addAttribute("token", result.getAccessToken()); // 토큰 token에 저장!!

			UserVO checkvo = new UserVO();
			
			checkvo.setUserid(userInfo.get("email"));
			checkvo.setEmail(userInfo.get("email"));
			checkvo.setUsername(userInfo.get("family_name"));
			System.out.println(userInfo.get("family_name"));
			
			String returnURL = "";
			UserVO loginvo = service.getUser(checkvo); //로그인 체크하기 위해
			
			
			if (session.getAttribute("login") != null) { // 이미 로그인 되어있는지
				session.removeAttribute("login");
			}
			
			if (loginvo != null) { // 로그인 성공. 이미 구글 id로 db에 저장됨
				System.out.println("구글 ID로 로그인 성공!");
				session.setAttribute("login", loginvo);
				
				returnURL = "redirect:/board/list";
			} else { // 로그인 실패
				System.out.println("구글 정보가 DB에 저장 안되어있음!");
				if (service.insertUser(checkvo) == 0) {
					System.out.println("구글 정보로 회원가입 실패! 왜일까?? ");
					returnURL = "redirect:/login/login";
				}
				else {
					System.out.println(checkvo.getUserid());
					System.out.println("회원가입 성공!!!");
					session.setAttribute("login", checkvo);
					returnURL = "redirect:/board/list";
				}
			}
			return returnURL;
//			String username = request.getParameter("Given Name");
////			String username = request.getParameter("username");
//			
////		session.setAttribute("userid", userid);
//			session.setAttribute("username", username);

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
