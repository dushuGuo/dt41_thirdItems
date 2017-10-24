/**
 * Project Name:dt41_thirdItems
 * File Name:XiaoshoushujuService.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年10月20日下午3:32:03
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.Xiaoshoushuju;
import cn.bdqn.datacockpit.mapper.XiaoshoushujuMapper;
import cn.bdqn.datacockpit.service.XiaoshoushujuService;

/**
 * Description: <br/>
 * Date: 2017年10月20日 下午3:32:03 <br/>
 * 
 * @author luoMT
 * @version
 * @see
 */
@Service
public class XiaoshoushujuServiceImpl implements XiaoshoushujuService {
    @Autowired
    private XiaoshoushujuMapper xMapper;

    /**
     * 
     * Description: <br/>
     * 查询销售数据表的所有内容
     * 
     * @authorluoMT
     * @return
     */
    public List<Xiaoshoushuju> selectXiaoShouBiao(Map<String, Object> map) {
        return xMapper.selectXiaoShouBiao(map);
    }
}
