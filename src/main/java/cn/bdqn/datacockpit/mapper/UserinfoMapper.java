package cn.bdqn.datacockpit.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.bdqn.datacockpit.entity.Userinfo;

public interface UserinfoMapper {

    List<Userinfo> selectAllUserinfo();

    int deleteByPrimaryKey(Integer id);

    int insert(Userinfo record);

    /**
     * wb 审核通过，往Userinfo表里添加一个用户对象
     */
    int insertSelective(Userinfo record);

    Userinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKey(Userinfo record);

    int selectByMaxId();

    /**
     * shiro通过电话号查询用户
     * 
     * @param userName
     * @return
     */
    public Userinfo getByPhoneOrEmail(String phone);

    // 利用邮箱或者手机号取出对应手机号信息
    String selectByPanduan(String phone);

    List<Map<String, Object>> selectByPhone(String phone);

    /**
     * shiro通过电话号查询角色信息
     * 
     * @param userName
     * @return
     */
    public Set<String> getRoles(String phone);

    /**
     * shiro通过电话号查询权限信息
     * 
     * @param userName
     * @return
     */
    public Set<String> getPermissions(String phone);
}
