/**
 * Project Name:DataCockpit
 * File Name:UserinfoService.java
 * Package Name:service
 * Date:2017年8月21日下午1:57:45
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.bdqn.datacockpit.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.bdqn.datacockpit.entity.Userinfo;

/**
 * Description: <br/>
 * Date: 2017年8月21日 下午1:57:45 <br/>
 * 
 * @author caoS
 * @version
 * @see
 */
public interface UserinfoService {

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

    // 利用邮箱或者手机号取出对应手机号信息
    String selectByPanduan(String phone);

    List<Map<String, Object>> selectByPhone(String phone);

    /**
     * shiro通过电话号查询用户
     * 
     * @param userName
     * @return
     */
    public Userinfo getByPhoneOrEmail(String phone);

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
