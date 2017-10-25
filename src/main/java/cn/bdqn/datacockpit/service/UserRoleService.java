package cn.bdqn.datacockpit.service;

import cn.bdqn.datacockpit.entity.UserRole;

public interface UserRoleService {
    int deleteByUid(int id);

    int insertSelective(UserRole record);
}
