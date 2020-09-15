package kw.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="/kw/user/goMain.do", method=RequestMethod.GET)
	public ModelAndView goMain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/common/main");
		
		return mv;
	}
	
	@RequestMapping(value="/kw/user/goLogin.do", method=RequestMethod.GET)
	public ModelAndView goLogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/login");
		
		return mv;
	}
	
	@RequestMapping(value="/kw/user/createUser.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createUser(@ModelAttribute UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		String id = userVO.getId();
		
		if(id == null) {
			mv.setViewName("/user/userC");
		}
		else {
			userService.createUser(userVO);
			mv.setViewName("/user/login");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/kw/user/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> idCheck(HttpServletRequest request){
		String paramId = request.getParameter("id");
		UserVO userVO = userService.retrieveUser(paramId);
		String checkMsg = "<font color='green' size='3px;'><i class='fa fa-check'>&nbsp;사용 가능한 아이디입니다.</i></font>@true";
		
		if(userVO != null) {
			checkMsg = "<font color='green' size='3px;'><i class='fa fa-check'>&nbsp;이미 사용중인 아이디입니다.</i></font>@false";
		}
		
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type", "text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<String>(checkMsg, responseHeader, HttpStatus.OK);
		
		return resultMsg;
	}
	
	@RequestMapping(value="/kw/user/retrievePostByDong.do")
	@ResponseBody
	public ResponseEntity<List<Map<String, String>>> retrievePostByDong(HttpServletRequest request){
		String paramDong = request.getParameter("dong");
		Map<String, String> param = new HashMap<String, String>();
		param.put("dong", paramDong);
		
		List<Map<String, String>> post = userService.retrievePostByDong(param);
		JSONArray jsonPostArr = new JSONArray();
		JSONObject jsonObj = null;
		
		for(int i = 0; i < post.size(); i++) {
			jsonObj = new JSONObject();
			
			String zipcode = post.get(i).get("ZIPCODE");
			String sido = post.get(i).get("SIDO");
			String gugun = post.get(i).get("GUGUN");
			String dong = post.get(i).get("DONG");
			String bunji = post.get(i).get("BUNJI");
			
			jsonObj.put("zipcode", zipcode);
			jsonObj.put("sido", sido);
			jsonObj.put("gugun", gugun);
			jsonObj.put("dong", dong);
			jsonObj.put("bunji", bunji);
			
			jsonPostArr.add(jsonObj);
		}
		
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type", "text/javascript;charset=UTF-8");
		
		ResponseEntity resultMsg = new ResponseEntity<List<Map<String, String>>>(jsonPostArr, responseHeader, HttpStatus.OK);
		return resultMsg;
	}
	
	@RequestMapping(value="/kw/user/ajaxLoginCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, String> ajaxLoginCheck(HttpServletRequest request,
												@RequestParam(value="id", required=false) String id,
												@RequestParam(value="pw", required=false) String pw){
		boolean check = false;
		check = userService.loginCheck(id, pw);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		
		if(check) {
			resultMap.put("loginYn", "success");
		}
		else {
			resultMap.put("loginYn", "fail");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value="/kw/user/login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest request, @ModelAttribute UserVO user) {
		HttpSession session = request.getSession();
		UserVO userVO = userService.retrieveSessionInfo(user.getId());
		
		String id = userVO.getId();
		String grade = userVO.getGrade();
		
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		session.setMaxInactiveInterval(-1);		// 세션 무한대
		
		return "redirect:/kw/user/goMain.do";
	}
	
	@RequestMapping(value="/kw/user/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("grade");
		session.invalidate();
		
		return "redirect:/kw/user/goMain.do";
	}
	
	@RequestMapping(value="/kw/user/updateUser.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateUser(HttpServletRequest request, @ModelAttribute UserVO userVO) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String flag = userVO.getName();
		
		UserVO user = userService.retrieveUser(id);
		
		if(flag == null) {
			mv.addObject("user", user);
			mv.setViewName("/user/userU");
		}
		else {
			String userId = user.getId();
			userVO.setId(userId);
			
			userService.updateUser(userVO);
			mv.setViewName("redirect:/kw/user/goMain.do");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/kw/user/retrieveUserListForManage.do", method=RequestMethod.GET)
	public ModelAndView retrieveUserListForManage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<Map<String, String>> userList = userService.retrieveUserList();
		
		mv.addObject("userList", userList);
		mv.setViewName("/user/userList");
		
		return mv;
	}
}
