package cn.bdqn.datacockpit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.mapper.UserRoleMapper;
import cn.bdqn.datacockpit.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    private UserRoleMapper userRoleMapper;

    /**
     * 删除管理员时删除对应的关系
     */
    @Override
    public int deleteByUid(int id) {
        return userRoleMapper.deleteByUid(id);
    }

}
