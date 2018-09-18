package se.zust.controller;

import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ssm")
@Api(description = "用户页面接口")
public class UserController {

	@ApiOperation(value = "主页",notes = "网站主页")
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(){
		return "智能仓储管理系统";
	}

	@ApiOperation(value = "产品中心",notes = "产品中心页面")
	@RequestMapping(value="/产品中心",method=RequestMethod.GET)
	public String production(){
		return "产品中心";
	}

	@ApiOperation(value = "账户开通",notes = "账户开通页面（选购产品）")
	@RequestMapping(value="/账户开通",method=RequestMethod.GET)
	public String register(){
		return "账户开通";
	}

	@ApiOperation(value = "账户开通",notes = "账户开通页面（注册账号）")
	@RequestMapping(value="/账户开通2",method=RequestMethod.GET)
	public String register2(){
		return "账户开通2";
	}

	@ApiOperation(value = "账户开通",notes = "账户开通页面（注册成功）")
	@RequestMapping(value="/账户开通3",method=RequestMethod.GET)
	public String register3(){
		return "账户开通3";
	}

	@ApiOperation(value = "账户开通",notes = "账户开通页面（注册失败）")
	@RequestMapping(value="/账户开通4",method=RequestMethod.GET)
	public String register4(){
		return "账户开通4";
	}

	@ApiOperation(value = "进入系统",notes = "系统登录页面")
	@RequestMapping(value="/进入系统",method=RequestMethod.GET)
	public String login(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "进入系统";
	}

	@ApiOperation(value = "系统框架",notes = "系统框架页面")
	@RequestMapping(value="/znccglpt",method=RequestMethod.GET)
	public String znccglpt(){
		return "znccglpt";
	}

	@ApiOperation(value = "系统主页",notes = "智能仓储管理平台系统主页")
	@RequestMapping(value="/znccglpt_index",method=RequestMethod.GET)
	public String znccglpt_index(){
		return "znccglpt_index";
	}

	@ApiOperation(value = "个人中心",notes = "个人中心页面")
	@RequestMapping(value="/znccglpt_center",method=RequestMethod.GET)
	public String usercenter(){
		return "znccglpt_center";
	}

	/*
	在jsp中使用post提交dataform表单数据
	如果使用method=RequestMethod.GET
	会出现Request method 'POST' not supported
	 */
	@ApiOperation(value = "个人资料",notes = "个人资料展示页面")
	@RequestMapping(value="/znccglpt_userinfo")
	public String userinfo(){
		return "znccglpt_userinfo";
	}

	@ApiOperation(value = "用户信息管理",notes = "对当前管理员名下的用户进行管理")
	@RequestMapping(value="/znccglpt_usermanage")
	public String usermanage(){
		return "znccglpt_usermanage";
	}

}
