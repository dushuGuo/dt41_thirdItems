/**
 * Project Name:DataCockpit
 * File Name:DatarelationService.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年8月25日上午11:40:40
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.bdqn.datacockpit.service;

import java.util.List;

import cn.bdqn.datacockpit.entity.Datarelation;

/**
 * Description:	   <br/>
 * Date:     2017年8月25日 上午11:40:40 <br/>
 * @author   caoS
 * @version  
 * @see 	 
 */
public interface DatarelationService {
    List<Datarelation> selectAlldatarelation();
    
    int deleteByPrimaryKey(Integer id);

    int insert(Datarelation record);

    int insertSelective(Datarelation record);

    Datarelation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Datarelation record);

    int updateByPrimaryKey(Datarelation record);
    
    List<Datarelation> selectByCid(Integer cid);
}

