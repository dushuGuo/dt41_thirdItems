/**
 * Project Name:DataCockpit
 * File Name:InfoServiceImpl.java
 * Package Name:service.impl
 * Date:2017年8月21日下午1:16:25
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.Info;
import cn.bdqn.datacockpit.mapper.InfoMapper;
import cn.bdqn.datacockpit.service.InfoService;

/**
 * Description: <br/>
 * Date: 2017年8月21日 下午1:16:25 <br/>
 * 
 * @author caoS
 * @version
 * @see
 */
@Service
public class InfoServiceImpl implements InfoService {

    @Autowired
    InfoMapper infoMapper;

    @Override
    public List<Info> selectAllInfo() {
        return infoMapper.selectAllInfo();
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int flag = infoMapper.deleteByPrimaryKey(id);
        return flag;
    }

    @Override
    public int insert(Info record) {
        int flag = infoMapper.insert(record);
        return flag;
    }

    @Override
    public int insertSelective(Info record) {
        int flag = infoMapper.insertSelective(record);
        return flag;
    }

    @Override
    public Info selectByPrimaryKey(Integer id) {
        return infoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Info record) {
        int flag = infoMapper.updateByPrimaryKeySelective(record);
        return flag;
    }

    @Override
    public int updateByPrimaryKey(Info record) {
        int flag = infoMapper.updateByPrimaryKey(record);
        return flag;
    }

    @Override
    public Integer selectMaxId() {
        return infoMapper.selectMaxId();
    }

}
