package se.zust.controller;

import io.swagger.annotations.*;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import se.zust.entity.User;
import se.zust.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/ssm")
@Api(description = "用户接口")
public class UserApiController {

    @Autowired
    private UserService service;

    @ApiOperation(value = "用户注册",notes = "管理员账号注册")
    @ApiResponses(value = { @ApiResponse(code = 200, message = "注册成功")})
    @RequestMapping(value="/doRegister",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject doregister(@ApiParam(value = "用户名",required = true) @RequestParam(value = "username",required = true)String username,
                                 @ApiParam(value = "密码",required = true) @RequestParam(value = "password",required = true)String password,
                                 @ApiParam(value = "真实姓名",required = true) @RequestParam(value = "realname",required = true)String realname,
                                 @ApiParam(value = "联系方式",required = true) @RequestParam(value = "phonumber",required = true)String phonumber,
                                 HttpServletRequest request){
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
            user.setType(0);
            user.setDirector(null);
            service.addUser(user);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            jsonObject.put("result", 0); //注册成功
        }
        return jsonObject;
    }

    @ApiOperation(value = "用户登录",notes = "用户、管理员登录")
    @ApiResponses(value = { @ApiResponse(code = 200, message = "登录成功")})
    @RequestMapping(value="/doLogin",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject doLogin(@ApiParam(value = "用户名",required = true) @RequestParam(value = "username",required = true)String username,
                              @ApiParam(value = "密码",required = true) @RequestParam(value = "password",required = true)String password,
                              @ApiParam(value = "验证码",required = true) @RequestParam(value = "vcode",required = true)String vcode,
                              @ApiParam(value = "权限",required = true) @RequestParam(value = "type",required = true)int type,
                              HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        User user = service.selectUserByName(username);
        if(user == null){
            jsonObject.put("result", 1); //该用户未注册
        }
        else if(!user.getPassword().equals(password)){
            jsonObject.put("result", 2); //用户名或密码错误
        }
        else if(!vcode.equals(request.getSession().getAttribute("vcode"))){
            jsonObject.put("result", 3); //验证码错误
        }
        else if(user.getType() != type){
            jsonObject.put("result", 4); //权限错误
        }
        else{
            jsonObject.put("result", 0); //登录成功
            jsonObject.put("type",type);
        }
        return jsonObject;
    }

    @ApiOperation(value = "个人资料展示",notes = "根据用户名显示当前登录用户的个人资料")
    @ApiResponses(value = { @ApiResponse(code = 200, message = "获取成功")})
    @RequestMapping(value="/doSelect",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject doSelect(@ApiParam(value = "用户名",required = true) @RequestParam(value = "username",required = true)String username){
        JSONObject jsonObject = new JSONObject();
        User user = service.selectUserByName(username);
        jsonObject.put("user",user);
        return jsonObject;
    }

    @ApiOperation(value = "个人资料更新",notes = "修改当前用户个人资料，或者管理员修改名下用户信息")
    @ApiResponses(value = { @ApiResponse(code = 200, message = "修改成功")})
    @RequestMapping(value="/doUpdate",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject doUpdate(@ApiParam(value = "头像文件",required = false) @RequestParam(value = "file", required = false) MultipartFile file,
                               @ApiParam(value = "id",required = true) @RequestParam(value = "id", required = true)int id,
                               @ApiParam(value = "用户名",required = true) @RequestParam(value = "username", required = true)String username,
                               @ApiParam(value = "密码",required = true) @RequestParam(value = "password", required = true)String password,
                               @ApiParam(value = "真实姓名",required = true) @RequestParam(value = "realname", required = true)String realname,
                               @ApiParam(value = "联系方式",required = true) @RequestParam(value = "phonumber", required = true)String phonumber,
                               @ApiParam(value = "权限",required = true) @RequestParam(value = "type", required = true)String type,
                               @ApiParam(value = "上级",required = true) @RequestParam(value = "director", required = true)String director,
                               @ApiParam(value = "个人介绍",required = false) @RequestParam(value = "userdescribe", required = false)String userdescribe,
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

        updatePhoto(username,file,id,request);

        jsonObject.put("user",user);
        return jsonObject;
    }

    @ApiOperation(value = "用户管理",notes = "获取当前管理员账号创建的用户账号信息")
    @ApiResponses(value = { @ApiResponse(code = 200, message = "获取成功")})
    @RequestMapping(value="/doSelectByDirector",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject doSelectByDirector(@ApiParam(value = "用户名",required = true) @RequestParam(value = "username",required = true)String username){
        JSONObject jsonObject = new JSONObject();
        List list = service.selectUserByDirector(username);
        jsonObject.put("list",list);
        return jsonObject;
    }

    @ApiOperation(value = "用户查询",notes = "根据ID/用户名/真实姓名查询当前管理员账号创建的用户账号信息")
    @ApiResponses(value = { @ApiResponse(code = 200, message = "查询成功")})
    @RequestMapping(value="/doSelectByIdOrUserName",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject doSelectByIdOrUserName(@ApiParam(value = "搜索关键词",required = false) @RequestParam(value = "searchword",required = false)String searchword,
                                             @ApiParam(value = "用户名",required = true) @RequestParam(value = "username",required = true)String username){
        JSONObject jsonObject = new JSONObject();
        if(searchword == null){
            //searchword == null    用于在swagger2传值判断搜索词是否为空
            searchword = "";
        }
        List list = service.selectByIdOrUserName(searchword,username);
        jsonObject.put("list",list);
        return jsonObject;
    }

    @ApiOperation(value = "用户新增",notes = "当前管理员账号创建用户账号")
    @ApiResponses(value = { @ApiResponse(code = 200, message = "新增成功")})
    @RequestMapping(value="/doAddNormalUser",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject doAddNormalUser(@ApiParam(value = "头像文件",required = false) @RequestParam(value = "file", required = false) MultipartFile file,
                                      @ApiParam(value = "用户名",required = true) @RequestParam(value = "username", required = true)String username,
                                      @ApiParam(value = "密码",required = true) @RequestParam(value = "password", required = true)String password,
                                      @ApiParam(value = "真实姓名",required = true) @RequestParam(value = "realname", required = true)String realname,
                                      @ApiParam(value = "联系方式",required = true) @RequestParam(value = "phonumber", required = true)String phonumber,
                                      @ApiParam(value = "权限",required = true) @RequestParam(value = "type", required = true)String type,
                                      @ApiParam(value = "上级",required = true) @RequestParam(value = "director", required = true)String director,
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

            updatePhoto(username,file,-1,request);

            jsonObject.put("result", 0); //注册成功
            jsonObject.put("user",user);
        }
        return jsonObject;
    }

    @ApiOperation(value = "用户删除",notes = "根据ID删除用户账号")
    @ApiResponses(value = { @ApiResponse(code = 200, message = "删除成功")})
    @RequestMapping(value="/doDelete",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject doDelete(@ApiParam(value = "id",required = true) @RequestParam(value = "id",required = true)int id){
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

    //将头像保存功能提取为函数
    private static final String USERPHOTO_DIRECTORY = "picture\\userphoto";
    private void updatePhoto(String username,MultipartFile file,int id,HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        //判断文件是否为空
        if(file == null || file.getSize() == 0){
			/*
			file == null			用于在swagger2传值判断头像是否为空
			file.getSize() == 0 	用于在formdata传值时判断头像是否为空
			*/
        }
        else{
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

            //保存头像至本地
            try {
                //文件的完整保存路径  D:\\MyProjectTest\\znccglpt\\智能仓储管理平台\\target\\智能仓储管理平台\\picture\\userphoto\\userphoto1.gif
                filePath = request.getSession().getServletContext().getRealPath("/") + USERPHOTO_DIRECTORY + File.separator + date + "." + suffix;
                //转存文件
                file.transferTo(new File(filePath));

				/*
				对传过来的id进行判断
				若id为-1，说明此id不存在，需要重新获取新添加用户的id并保存头像至该新用户资料中
				若id不为-1，说明此id存在，则直接保存头像至此id的用户资料中
				 */
                if(id == -1){
                    //获取新增用户的id
                    id = service.selectUserByName(username).getId();
                    service.updateUserPhoto(id,imgurl);
                }
                else{
                    service.updateUserPhoto(id,imgurl);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            jsonObject.put("imgurl",imgurl); //数据库保存路径
            jsonObject.put("parentPath",parentPath); //父文件夹路径
            jsonObject.put("filePath",filePath); //本地完整保存路径
        }
    }
}
