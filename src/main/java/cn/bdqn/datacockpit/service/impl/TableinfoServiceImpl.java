/**
 * Project Name:DataCockpit
 * File Name:TableinfoServiceImpl.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年8月25日上午10:53:43
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.Tableinfo;
import cn.bdqn.datacockpit.mapper.TableinfoMapper;
import cn.bdqn.datacockpit.service.TableinfoService;

/**
 * Description: <br/>
 * Date: 2017年8月25日 上午10:53:43 <br/>
 * 
 * @author yuanX
 * @version
 * @see
 */
@Service
public class TableinfoServiceImpl implements TableinfoService {
    @Autowired
    private TableinfoMapper tm;

    @Override
    public List<Tableinfo> selectAll(Integer id) {

        // Auto-generated method stub
        return tm.selectAll(id);
    }

    @Override
    public int insert(Tableinfo record) {

        return tm.insert(record);
    }

    @Override
    public Tableinfo selectByPrimaryKey(Integer id) {
        return tm.selectByPrimaryKey(id);
    }

    @Override
    public Tableinfo selectPrimaryKey(Tableinfo record) {

        return tm.selectPrimaryKey(record);
    }

}
