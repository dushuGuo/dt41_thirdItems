/**
 * Project Name:DataCockpit
 * File Name:XsTableServiceImpl.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年8月25日下午4:04:03
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.XsTable;
import cn.bdqn.datacockpit.mapper.XsTableMapper;
import cn.bdqn.datacockpit.service.XsTableService;

/**
 * Description: <br/>
 * Date: 2017年8月25日 下午4:04:03 <br/>
 * 
 * @author yuanX
 * @version
 * @see
 */
@Service
public class XsTableServiceImpl implements XsTableService {
    @Autowired
    private XsTableMapper xm;

    @Override
    public List<XsTable> selectAll() {

        return xm.selectAll();
    }

    @Override
    public int getTableList(String tableName) {
        // TODO Auto-generated method stub
        return xm.getTableList(tableName);
    }


}
