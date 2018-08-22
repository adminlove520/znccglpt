package se.zust.controller;

import net.sf.json.JSONObject;
import org.springframework.web.bind.annotation.*;
import se.zust.entity.User;
import se.zust.service.UserService;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/ssm")
//@Scope("prototype")
public class UserController {

	Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService service;

  	//首页
  	@RequestMapping(value="/index",method=RequestMethod.GET)
    public String index(){
    	return "智能仓储管理系统";
    }
  	@RequestMapping(value="/产品中心",method=RequestMethod.GET)
    public String production(){
    	return "产品中心";
    }
  	@RequestMapping(value="/账户开通",method=RequestMethod.GET)
    public String register(){
    	return "账户开通";
    }
  	//注册页面
    @RequestMapping(value="/账户开通2",method=RequestMethod.GET)
    public String register2(@ModelAttribute("user") User user){
    	return "账户开通2";
    }
    //注册处理
	@RequestMapping(value="/doRegister",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject doregister(@RequestParam(value = "username",required = false)String username,
										   @RequestParam(value = "password",required = false)String password,
										   @RequestParam(value = "realname",required = false)String realname,
										   @RequestParam(value = "phonumber",required = false)String phonumber,
										   HttpServletRequest request){
		JSONObject jsonObject = new JSONObject();
		User user1 = service.selectUserByName(username);
		if(user1 != null) {
			jsonObject.put("result", 1); //该用户已注册
		}
		else{
			User user2 = new User() ;
			user2.setUsername(username);
			user2.setPassword(password);
			user2.setRealname(realname);
			user2.setPhonumber(phonumber);
			user2.setType(0);
			user2.setDirector(null);
			service.addUser(user2);
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			jsonObject.put("result", 0); //注册成功
		}
		return jsonObject;
	}
	//开通成功
	@RequestMapping(value="/账户开通3",method=RequestMethod.GET)
	public String register3(){
		return "账户开通3";
	}
	//开通失败
	@RequestMapping(value="/账户开通4",method=RequestMethod.GET)
	public String register4(){
		return "账户开通4";
	}
  	//登录页面
  	@RequestMapping(value="/进入系统",method=RequestMethod.GET)
    public String login(@ModelAttribute("login") User user){
  	    return "进入系统";
    }
	//登录处理
	@RequestMapping(value="/doLogin",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject doLogin(@RequestParam(value = "username",required = false)String username,
                              @RequestParam(value = "password",required = false)String password,
                              @RequestParam(value = "type",required = false)int type){
        JSONObject jsonObject = new JSONObject();
		User user = service.selectUserByName(username);
		if(user == null){
			jsonObject.put("result", 1); //该用户未注册
		}
		else if(!user.getPassword().equals(password)){
			jsonObject.put("result", 2); //用户名或密码错误
		}
		else if(user.getType() != type){
			jsonObject.put("result", 3); //权限错误
		}
		else{
			jsonObject.put("result", 0); //登录成功
			jsonObject.put("type",type);
		}
		return jsonObject;
	}
	//进入主页
	@RequestMapping(value="/znccglpt")
    public String znccglpt(){
    	return "znccglpt";
    }
  	//个人中心页面
  	@RequestMapping(value="/znccglpt_center")
    public String usercenter(){
    	return "znccglpt_center";
    }
  	//个人信息更新
  	@RequestMapping(value="/doUpdate",method=RequestMethod.POST)
    public String doUpdate(User user,HttpServletRequest request){
		service.updateUser(user);
		request.setAttribute("user", user);
		String updateerror="55";
		request.getSession().setAttribute("updateerror", updateerror);
    	return "znccglpt_center";
    }
    //用户管理页面
  	@RequestMapping(value="/用户管理",method=RequestMethod.GET)
    public String usermanage(@RequestParam String username,HttpServletRequest request){
  		User user = service.selectUserByName(username);
  		List<User> users = service.selectUserByDirector(username);
    	request.setAttribute("users", users);
    	request.getSession().setAttribute("user", user);
    	return "用户管理";
    }
    //用户增加
  	@RequestMapping(value="/用户增加",method=RequestMethod.GET)
    public String adduser(@ModelAttribute("user") User user){
    	return "用户增加";
    }
  	//增加处理
	@RequestMapping(value="/doAddUser",method=RequestMethod.POST)
    public String doAddUser(User user,User user2,@RequestParam String username,HttpServletRequest request){
		user=service.selectUserByName(username);
		logger.info(username);
		if(user!=null) {                                       //待插入的用户已存在
			logger.info("fail");
			String adderror="1";
			request.getSession().setAttribute("adderror", adderror);
			return "用户增加";
		}
		else {                                                 //待插入的用户不存在
			service.addNormalUser(user2);
			logger.info("success");
			String adderror="0";
			request.getSession().setAttribute("adderror", adderror);
            return "用户增加";
		}
    }
	//用户删除
  	@RequestMapping(value="/用户删除")
    public String deleteuser(@ModelAttribute("deletenormaluser") User user){
    	return "用户删除";
    }
  	//删除梳理
  	@RequestMapping(value="/doDeleteUser",method=RequestMethod.POST)
    public String doDeleteUser(@RequestParam int id,@RequestParam String director,HttpServletRequest request){
  		User user=service.selectUserById(id);
  		if(user!=null) {                                                       //要删除的ID号存在
  			if(user.getDirector().equals(director)&&user.getType()==1) {       //该ID的权限为用户，且上家为当前登录的管理员
  	  			service.deleteNormalUser(id);
  	  		    String deleteerror="0";
				request.getSession().setAttribute("deleteerror", deleteerror);
				logger.info(deleteerror);
				return "用户删除";
  			}
  			else {                                                              //该ID的权限不为用户，或上家不为当前登录的管理员	
  				String deleteerror="1";
  				request.getSession().setAttribute("deleteerror", deleteerror); 
  				logger.info(deleteerror);
  				return "用户删除";
  			}
  		}
  		else {                                                                  //要删除的ID号不存在
  			String deleteerror="2";
			request.getSession().setAttribute("deleteerror", deleteerror);  
			logger.info(deleteerror);
  			return "用户删除";
  		}
    }

    //测试
  	@RequestMapping(value="/test")
    public String test(){
    	return "个人中心（原件备份）";
    }

}
