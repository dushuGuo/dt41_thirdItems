/**
 * Project Name:DataCockpit
 * File Name:TablecolumninfoService.java
 * Package Name:cn.bdqn.datacockpit.service
 * Date:2017年8月25日上午11:42:33
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.bdqn.datacockpit.service;

import java.util.List;

import cn.bdqn.datacockpit.entity.Tablecolumninfo;

/**
 * Description:	   <br/>
 * Date:     2017年8月25日 上午11:42:33 <br/>
 * @author   caoS
 * @version  
 * @see 	 
 */
public interface TablecolumninfoService {
    List<Tablecolumninfo> selectAllTablecolumninfo();
    
    int deleteByPrimaryKey(Integer id);

    int insert(Tablecolumninfo record);

    int insertSelective(Tablecolumninfo record);

    Tablecolumninfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tablecolumninfo record);

    int updateByPrimaryKey(Tablecolumninfo record);
    
    /**
     * 增加方法
     * @param tableName
     * @return
     */
    List<Tablecolumninfo> selectView(String tableName);
}

