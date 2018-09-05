package se.zust.controller;

import net.sf.json.JSONObject;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import se.zust.entity.User;
import se.zust.service.UserService;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	//系统框架
	@RequestMapping(value="/znccglpt")
    public String znccglpt(){
    	return "znccglpt";
    }
	//系统主页
	@RequestMapping(value="/znccglpt_index")
	public String znccglpt_index(){
		return "znccglpt_index";
	}
  	//个人中心
  	@RequestMapping(value="/znccglpt_center")
    public String usercenter(){
    	return "znccglpt_center";
    }
	//个人信息
	@RequestMapping(value="/znccglpt_userinfo")
	public String userinfo(){
		return "znccglpt_userinfo";
	}
	//个人信息展示
	@RequestMapping(value="/doSelect",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject doSelect(@RequestParam(value = "username",required = false)String username){
		JSONObject jsonObject = new JSONObject();
		User user = service.selectUserByName(username);
		jsonObject.put("user",user);
		return jsonObject;
	}
	//个人信息更新
	private static final String USERPHOTO_DIRECTORY = "picture\\userphoto";
	@RequestMapping(value="/doUpdate",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject doUpdate(@RequestParam(value = "file", required = false) MultipartFile file,
							   int id,String username,String password,String realname,String phonumber,String type,String director,String userdescribe,
							   HttpServletRequest request, HttpServletResponse response){
		JSONObject jsonObject = new JSONObject();
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setRealname(realname);
		user.setPhonumber(phonumber);
		if(type.equals("管理员")){
			user.setType(0);
		}
		if(type.equals("用户")){
			user.setType(1);
		}
		if(director.equals("无")){
			user.setDirector("");
		}
		else{
			user.setDirector(director);
		}
		user.setUserdescribe(userdescribe);
		service.updateUser(user);

		//本地上传头像名称
		String imgName = file.getOriginalFilename();
		//本地头像后缀
		String suffix = imgName.substring(imgName.lastIndexOf(".") + 1);
		//本地头像文件名（以时间戳形式保存）
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
		//数据库保存路径
		String imgurl = File.separator + USERPHOTO_DIRECTORY + File.separator + date + "." + suffix;
		//父文件夹路径  D:\\MyProjectTest\\znccglpt\\智能仓储管理平台\\target\\智能仓储管理平台\\picture\\userphoto
		String parentPath = request.getSession().getServletContext().getRealPath("./") + USERPHOTO_DIRECTORY;
		//完整路径
		String filePath = new String();

		// 如果目录不存在则创建
		File uploadDir = new File(parentPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		//判断文件是否为空
		if (!file.isEmpty()) {
			try {
				//文件的完整保存路径  D:\\MyProjectTest\\znccglpt\\智能仓储管理平台\\target\\智能仓储管理平台\\picture\\userphoto\\userphoto1.gif
				filePath = request.getSession().getServletContext().getRealPath("/") + USERPHOTO_DIRECTORY + File.separator + date + "." + suffix;
				//转存文件
				file.transferTo(new File(filePath));
				service.updateUserPhoto(id,imgurl);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		jsonObject.put("user",user);
		jsonObject.put("imgurl",imgurl); //数据库保存路径
		jsonObject.put("parentPath",parentPath); //父文件夹路径
		jsonObject.put("filePath",filePath); //本地完整保存路径
		return jsonObject;
	}
	//用户管理
	@RequestMapping(value="/znccglpt_usermanage")
	public String usermanage(){
		return "znccglpt_usermanage";
	}
	//用户管理展示
	@RequestMapping(value="/doSelectByDirector",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject doSelectByDirector(@RequestParam(value = "username",required = false)String username){
		JSONObject jsonObject = new JSONObject();
		List list = service.selectUserByDirector(username);
		jsonObject.put("list",list);
		return jsonObject;
	}
	//用户查询
	@RequestMapping(value="/doSelectByIdOrUserName",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject doSelectByIdOrUserName(@RequestParam(value = "searchword",required = false)String searchword,
											 @RequestParam(value = "username",required = false)String username){
		JSONObject jsonObject = new JSONObject();
		List list = service.selectByIdOrUserName(searchword,username);
		jsonObject.put("list",list);
		return jsonObject;
	}
	//用户新增
	@RequestMapping(value="/doAddNormalUser",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject doAddNormalUser(@RequestParam(value = "file", required = false) MultipartFile file,
									  String username,String password,String realname,String phonumber,String type,String director,
									  HttpServletRequest request, HttpServletResponse response){
		JSONObject jsonObject = new JSONObject();
		User user = new User() ;
		if(service.selectUserByName(username) != null) {
			jsonObject.put("result", 1); //该用户已注册
		}
		else{
			user.setUsername(username);
			user.setPassword(password);
			user.setRealname(realname);
			user.setPhonumber(phonumber);
			if(type.equals("管理员")){
				user.setType(0);
			}
			if(type.equals("用户")){
				user.setType(1);
			}
			if(director.equals("无")){
				user.setDirector("");
			}
			else{
				user.setDirector(director);
			}
			service.addUser(user);

			//本地上传头像名称
			String imgName = file.getOriginalFilename();
			//本地头像后缀
			String suffix = imgName.substring(imgName.lastIndexOf(".") + 1);
			//本地头像文件名
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
			String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
			//数据库保存路径
			String imgurl = File.separator + USERPHOTO_DIRECTORY + File.separator + date + "." + suffix;
			//父文件夹路径  D:\\MyProjectTest\\znccglpt\\智能仓储管理平台\\target\\智能仓储管理平台\\picture\\userphoto
			String parentPath = request.getSession().getServletContext().getRealPath("./") + USERPHOTO_DIRECTORY;
			//完整路径
			String filePath = new String();

			// 如果目录不存在则创建
			File uploadDir = new File(parentPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			//判断文件是否为空
			if (!file.isEmpty()) {
				try {
					//文件的完整保存路径  D:\\MyProjectTest\\znccglpt\\智能仓储管理平台\\target\\智能仓储管理平台\\picture\\userphoto\\userphoto1.gif
					filePath = request.getSession().getServletContext().getRealPath("/") + USERPHOTO_DIRECTORY + File.separator + date + "." + suffix;
					//转存文件
					file.transferTo(new File(filePath));
					//获取新增用户的ID
					int id = service.selectUserByName(username).getId();
					service.updateUserPhoto(id,imgurl);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			jsonObject.put("result", 0); //注册成功
			jsonObject.put("user",user);
			jsonObject.put("imgurl",imgurl); //数据库保存路径
			jsonObject.put("parentPath",parentPath); //父文件夹路径
			jsonObject.put("filePath",filePath); //本地完整保存路径
		}
		return jsonObject;
	}
	//用户删除
	@RequestMapping(value="/doDelete",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject doDelete(@RequestParam(value = "id",required = false)int id){
		JSONObject jsonObject = new JSONObject();
		User user = service.selectUserById(id);
		if(user == null){
			jsonObject.put("result",1);
		}
		else{
			service.deleteNormalUser(id);
			jsonObject.put("result",0);
		}
		return jsonObject;
	}
}
