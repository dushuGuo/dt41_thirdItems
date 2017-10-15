/**
 * Project Name:DataCockpit
 * File Name:InfoService.java
 * Package Name:service
 * Date:2017年8月21日下午1:15:57
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service;

import java.util.List;

import cn.bdqn.datacockpit.entity.Info;

/**
 * Description: <br/>
 * Date: 2017年8月21日 下午1:15:57 <br/>
 * 
 * @author caoS
 * @version
 * @see
 */
public interface InfoService {

    List<Info> selectAllInfo();

    int deleteByPrimaryKey(Integer id);

    int insert(Info record);

    int insertSelective(Info record);

    Info selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Info record);

    int updateByPrimaryKey(Info record);

    Integer selectMaxId();
}
