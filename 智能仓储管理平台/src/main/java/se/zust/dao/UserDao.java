package se.zust.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.User;

public interface UserDao {
    //这里以接口形式定义了数据库操作方法,我们只需
    //在Mybatis映射文件中对其进行映射就可以直接使用
    public void addUser(User user); //管理员、普通用户注册

    public User selectUserByName(String username);//根据管理员名查询 （登录）

    public List<User> selectUserByDirector(String director);//根据direcot查询 （检索管理员名下的用户表)

    public User selectUserById(int id);//根据Id查询

    public void deleteNormalUser(int id); //普通用户删除

    public void updateUser(User user);  //用户信息修改

    public List<User> selectByIdOrUserName(@Param(value = "searchword") String searchword,@Param(value = "director") String director);//用户信息修改

}
