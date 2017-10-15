/**
 * Project Name:DataCockpit
 * File Name:XsTableService.java
 * Package Name:cn.bdqn.datacockpit.service
 * Date:2017年8月25日下午4:03:02
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service;

import java.util.List;

import cn.bdqn.datacockpit.entity.XsTable;

/**
 * Description: <br/>
 * Date: 2017年8月25日 下午4:03:02 <br/>
 * 
 * @author yuanX
 * @version
 * @see
 */
public interface XsTableService {
    List<XsTable> selectAll();
    int getTableList(String tableName);
}
