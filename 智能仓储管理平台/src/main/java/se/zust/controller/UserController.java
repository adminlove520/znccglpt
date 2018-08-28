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

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
  	@RequestMapping(value="/doUpdate",method=RequestMethod.POST)
	@ResponseBody
    public JSONObject doUpdate(@RequestParam(value = "id",required = false)int id,
							   @RequestParam(value = "username",required = false)String username,
							   @RequestParam(value = "password",required = false)String password,
							   @RequestParam(value = "realname",required = false)String realname,
							   @RequestParam(value = "phonumber",required = false)String phonumber,
							   @RequestParam(value = "type",required = false)int type,
							   @RequestParam(value = "director",required = false)String director,
							   @RequestParam(value = "userdescribe",required = false)String userdescribe,
							   @RequestParam(value = "imgurl",required = false)String imgurl,
							   @RequestParam(value = "imgname",required = false)String imgname) throws IOException {
		JSONObject jsonObject = new JSONObject();
		User user = new User() ;
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setRealname(realname);
		user.setPhonumber(phonumber);
		user.setType(type);
		user.setDirector(director);
		user.setUserdescribe(userdescribe);
		//如果用户有上传头像
		if(imgname != ""){
			String suffix = imgname.substring(imgname.lastIndexOf(".") + 1);
			//头像存放路径	D:\\MyProjectTest\\znccglpt\\智能仓储管理平台\\src\\main\\webapp\\picture\\userphoto\\用户ID_用户名.文件后缀
			String strName = "\\picture\\userphoto\\"+id+"_"+username+"."+ suffix; //src链接地址
			String strPath = "D:\\MyProjectTest\\znccglpt\\智能仓储管理平台\\src\\main\\webapp"+strName; //完整路径
			File file = new File(strPath);
			if(!file.getParentFile().exists()) { //判断父目录路径是否存在
				try{
					file.getParentFile().mkdirs(); //不存在则创建父目录
					file.createNewFile();
				}catch (IOException e){
					e.printStackTrace();
				}
			}
			else{
				if(file.exists()){ //判断子文件是否存在，已存在则删除再创建
					file.delete();
				}
				file.createNewFile();
			}

//			FileInputStream fi = new FileInputStream("C:\\Users\\ucmed\\Desktop\\d500402762d0f703d99bf96b03fa513d2697c56b.gif");
			FileInputStream fi = new FileInputStream("C:\\Users\\ucmed\\Desktop\\图片\\"+imgname);
			FileOutputStream fo = new FileOutputStream(strPath);
			byte[] by = new byte[1024];
			int len = 0;
			while((len = fi.read(by)) != -1){
				fo.write(by,0,len);
			}
			fi.close();
			fo.close();

			jsonObject.put("来源",imgurl);
			jsonObject.put("目标",strPath);



			user.setImgurl(strName);
		}
		service.updateUser(user);
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
	public JSONObject doAddNormalUser(@RequestParam(value = "username",required = false)String username,
									  @RequestParam(value = "password",required = false)String password,
									  @RequestParam(value = "realname",required = false)String realname,
									  @RequestParam(value = "phonumber",required = false)String phonumber,
									  @RequestParam(value = "type",required = false)int type,
									  @RequestParam(value = "director",required = false)String director){
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
			user2.setType(type);
			user2.setDirector(director);
			service.addUser(user2);
			jsonObject.put("result", 0); //注册成功
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


    //测试
  	@RequestMapping(value="/test")
    public String test(){
    	return "test";
    }

}
