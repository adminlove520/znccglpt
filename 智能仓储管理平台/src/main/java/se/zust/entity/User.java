package se.zust.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="用户信息")
public class User {
	@ApiModelProperty("id")
    private int id;
	@ApiModelProperty("用户名")
    private String username;
	@ApiModelProperty("密码")
    private String password;
	@ApiModelProperty("真实姓名")
    private String realname;
	@ApiModelProperty("联系方式")
    private String phonumber;
	@ApiModelProperty("权限")
    private int type;
	@ApiModelProperty("上级")
    private String director;
	@ApiModelProperty("个人介绍")
    private String userdescribe;
	@ApiModelProperty("头像")
    private String imgurl;
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPhonumber() {
		return phonumber;
	}
	public void setPhonumber(String phonumber) {
		this.phonumber = phonumber;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getUserdescribe() {
		return userdescribe;
	}
	public void setUserdescribe(String userdescribe) {
		this.userdescribe = userdescribe;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
}
