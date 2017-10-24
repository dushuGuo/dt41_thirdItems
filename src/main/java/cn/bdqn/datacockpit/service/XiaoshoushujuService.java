/**
 * Project Name:dt41_thirdItems
 * File Name:XiaoshoushujuService.java
 * Package Name:cn.bdqn.datacockpit.service
 * Date:2017年10月20日下午3:39:53
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service;

import java.util.List;
import java.util.Map;

import cn.bdqn.datacockpit.entity.Xiaoshoushuju;

/**
 * Description: <br/>
 * Date: 2017年10月20日 下午3:39:53 <br/>
 * 
 * @author luoMT
 * @version
 * @see
 */
public interface XiaoshoushujuService {
    List<Xiaoshoushuju> selectXiaoShouBiao(Map<String, Object> map);
}
