/**
 * Project Name:dt41_thirdItems
 * File Name:AdminTilesService.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年10月19日下午3:25:25
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.bdqn.datacockpit.entity.Tableinfo;

/**
 * Description: <br/>
 * Date: 2017年10月19日 下午3:25:25 <br/>
 * 
 * @author huMZ
 * @version
 * @see
 */
public interface AdminTilesService {

    /**
     * 
     * Description:新建数据表 <br/>
     *
     * @author huMZ
     * @param attr
     * @param No1Id
     * @param req
     * @param tbName
     * @param tid
     * @return
     */
    public abstract Map<String, String> creats(String[] attr, String No1Id, HttpServletRequest req, String tbName,
            Tableinfo tid);

}
