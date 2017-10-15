/**
 * Project Name:DataCockpit
 * File Name:DatarelationServiceImpl.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年8月25日上午11:59:50
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.bdqn.datacockpit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.Datarelation;
import cn.bdqn.datacockpit.mapper.DatarelationMapper;
import cn.bdqn.datacockpit.service.DatarelationService;

/**
 * Description:	   <br/>
 * Date:     2017年8月25日 上午11:59:50 <br/>
 * @author   caoS
 * @version  
 * @see 	 
 */
@Service
public class DatarelationServiceImpl implements DatarelationService {
    
    @Autowired
    DatarelationMapper datarelation;
    
    @Override
    public List<Datarelation> selectAlldatarelation() {
        return datarelation.selectAlldatarelation();
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int flag=datarelation.deleteByPrimaryKey(id);
        return flag;
    }

    @Override
    public int insert(Datarelation record) {
        int flag=datarelation.insert(record);
        return flag;
    }

    @Override
    public int insertSelective(Datarelation record) {
        int flag=datarelation.insertSelective(record);
        return flag;
    }

    @Override
    public Datarelation selectByPrimaryKey(Integer id) {
        return datarelation.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Datarelation record) {
        int flag=datarelation.updateByPrimaryKeySelective(record);
        return flag;
    }

    @Override
    public int updateByPrimaryKey(Datarelation record) {
        int flag=datarelation.updateByPrimaryKey(record);
        return flag;
    }

	@Override
	public List<Datarelation> selectByCid(Integer cid) {
		return  datarelation.selectByCid(cid);
	}

}

