package com.model2.mvc.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.KakaoAPI;
import com.model2.mvc.service.user.UserService;

//==> ȸ������ Controller
@Controller
@RequestMapping("/user/*")
public class UserController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	// setter Method ���� ����
	@Autowired
	private KakaoAPI kakao;

	public UserController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "addUser", method = RequestMethod.GET)
	public String addUser() throws Exception {

		System.out.println("/user/addUser : GET");

		return "redirect:/user/addUserView.jsp";
	}

	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) throws Exception {

		System.out.println("/user/addUser : POST");
		// Business Logic
		userService.addUser(user);

		return "redirect:/user/loginView.jsp";
	}

	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@RequestParam("userId") String userId, Model model) throws Exception {

		System.out.println("/user/getUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);

		return "forward:/user/getUser.jsp";
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
	public String updateUser(@RequestParam("userId") String userId, Model model) throws Exception {

		System.out.println("/user/updateUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);

		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception {

		System.out.println("/user/updateUser : POST");
		// Business Logic
		userService.updateUser(user);

		String sessionId = ((User) session.getAttribute("user")).getUserId();
		if (sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}

		return "redirect:/user/getUser?userId=" + user.getUserId();
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() throws Exception {

		System.out.println("/user/logon : GET");

		return "redirect:/user/loginView.jsp";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {

		System.out.println("/user/login : POST");
		// Business Logic
		User dbUser = userService.getUser(user.getUserId());

		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
			session.setAttribute("kakaoLoginCheck", false);
		}

		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {

		//1. īī�� �α��� ������ ��ū�� �޾ƿ��� 
		String access_Token = kakao.getAccessToken(code);
		//2. ��ū�������� īī������ �������� ��������
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);

		//3.�޾ƿ� �������� set���ֱ�  (notnull������ password�� ���Ƿ� �־��ֱ�)
		User user = new User();
		user.setUserId((String) userInfo.get("id"));
		user.setPassword("4444");
		user.setUserName((String) userInfo.get("nickname"));
		user.setEmail((String) userInfo.get("email"));

		//4.�޾ƿ� ���� ���̵� �ߺ� üũ 
		boolean result = userService.checkDuplication(user.getUserId());
		System.out.println(result);
		
		//5.�޾ƿ� �������̵� ������ īī�� �������� insert
		if (result) {
			userService.addUser(user);
		}
		//6.īī�� �α��� ���� ���Ǽ��� (ȸ��)
		if (user != null) {
			session.setAttribute("user", user);
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("kakaoLoginCheck", true);
		}

		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		System.out.println("/user/logout : POST");

		if ((Boolean) session.getAttribute("kakaoLoginCheck")) {
			kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		}
		session.invalidate();

		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "checkDuplication", method = RequestMethod.POST)
	public String checkDuplication(@RequestParam("userId") String userId, Model model) throws Exception {

		System.out.println("/user/checkDuplication : POST");
		// Business Logic
		boolean result = userService.checkDuplication(userId);
		// Model �� View ����
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplication.jsp";
	}

	@RequestMapping(value = "listUser")
	public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/user/listUser : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic ����
		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/listUser.jsp";
	}
}