package com.model2.mvc.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public void addUser( @RequestBody User user ) throws Exception {

		System.out.println("/user/json/addUser : POST");
		//Business Logic
		
		 userService.addUser(user);
		
	}
	
	@RequestMapping( value="json/updateUser", method=RequestMethod.POST )
	public void updateUser(@RequestBody User user 
								 ) throws Exception{

		System.out.println("/user/json/updateUser : POST");
		
		
		//Business Logic
		userService.updateUser(user);
		
		System.out.println("����");
	}
	
	@RequestMapping( value="json/checkDuplication/{userId}", method=RequestMethod.POST )
	public boolean checkDuplication( @PathVariable String userId , Model model ) throws Exception{
		
		System.out.println("/user/checkDuplication : POST");
		//Business Logic
		boolean result= true;
		result=userService.checkDuplication(userId);
	
		if(result) {
			System.out.println("���� �� �� �ִ� ���̵� �Դϴ�.");
		}else {
			System.out.println("�ߺ��� ���̵� �Դϴ�.");
		}
		return result;
	}
	
	@RequestMapping( value="json/listUser" , method=RequestMethod.GET )
	public Map<String , Object> listUser() throws Exception{
		
		System.out.println("/user/listUser : GET ");
		
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		map.put("resultPage",resultPage);

		return map;
	}
	
	@RequestMapping( value="json/listUser" , method=RequestMethod.POST )
	public Map<String , Object> listUser( @RequestBody Search search ) throws Exception{
		
		System.out.println("/user/json/listUser : POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		
		// Business logic ����
		Map<String , Object> map=userService.getUserList(search);
		System.out.println("����");
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		System.out.println("����");
		
		return map;
	}
	
}





