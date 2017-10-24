/**
 * Project Name:dt41_thirdItems
 * File Name:xiaoshoushujuMapper.java
 * Package Name:cn.bdqn.datacockpit.mapper
 * Date:2017年10月20日下午3:18:54
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.datacockpit.entity.Xiaoshoushuju;

/**
 * Description: <br/>
 * Date: 2017年10月20日 下午3:18:54 <br/>
 * 
 * @author luoMT
 * @version
 * @see
 */
public interface XiaoshoushujuMapper {
    /**
     * 
     * Description: <br/>
     * 查询销售数据表的所有数据
     * 
     * @authorluoMT
     * @return
     */
    List<Xiaoshoushuju> selectXiaoShouBiao(Map<String, Object> map);
}
