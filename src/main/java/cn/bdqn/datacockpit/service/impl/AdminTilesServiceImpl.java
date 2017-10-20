/**
 * Project Name:dt41_thirdItems
 * File Name:AdminTilesService.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年10月19日下午2:25:48
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.Tablecolumninfo;
import cn.bdqn.datacockpit.entity.Tableinfo;
import cn.bdqn.datacockpit.mapper.TablecolumninfoMapper;
import cn.bdqn.datacockpit.service.AdminTilesService;
import cn.bdqn.datacockpit.utils.ChineseToPinYin;
import cn.bdqn.datacockpit.utils.JdbcUtil;

/**
 * Description: <br/>
 * Date: 2017年10月19日 下午2:25:48 <br/>
 * 
 * @author huMZ
 * @version
 * @see
 */
@Service
public class AdminTilesServiceImpl implements AdminTilesService {
    @Autowired
    TablecolumninfoMapper tablecolumninfoMapper;

    @Autowired
    Tablecolumninfo tablecolumninfo;

    public void setTablecolumninfo(Tablecolumninfo tablecolumninfo) {
        this.tablecolumninfo = tablecolumninfo;
    }

    /**
     * 简单描述该方法的实现功能（可选）.
     * 
     * @see cn.bdqn.datacockpit.service.AdminTilesService#creats(java.lang.String[],
     *      java.lang.String, javax.servlet.http.HttpServletRequest,
     *      java.lang.String)
     */
    @Override
    public Map<String, String> creats(String[] attr, String No1Id, HttpServletRequest req, String tbName,
            Tableinfo tableinfo) {
        /*
         * // 获取表字段名,将其存储为字符串以便存入数据库 StringBuffer columnName = new
         * StringBuffer(); // 获取表字段数据类型,将其存储为字符串以便存入数据库 StringBuffer columnType
         * = new StringBuffer();
         */
        ChineseToPinYin ctp = new ChineseToPinYin();
        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, Object> mapChina = new HashMap<String, Object>();
        for (int i = 0; i < attr.length; i++) {
            if (i == 0) {
                // 存图形id
                map.put("shows", attr[0]);
            } else if (i == 1) {
                HttpSession session = req.getSession();
                // 拼接新建表名为用户id+表明（防止重名）
            } else if (2 * i - 1 <= attr.length && i >= 2) {
                // 存 字段名 和 字段类型
                map.put(ctp.getPingYin(attr[2 * i - 2]), attr[2 * i - 1]);
                mapChina.put(ctp.getPingYin(attr[2 * i - 2]), attr[2 * i - 2]);
                tablecolumninfo.setColumnname(attr[2 * i - 2]);
                tablecolumninfo.setTid(tableinfo.getId());
                if (attr[2 * i - 1].equals("1")) {
                    tablecolumninfo.setColumntype("String");
                } else if (attr[2 * i - 1].equals("2")) {
                    tablecolumninfo.setColumntype("Integer");
                } else {
                    tablecolumninfo.setColumntype("Double");
                }
                tablecolumninfoMapper.insert(tablecolumninfo);

            }
        }

        JdbcUtil creats = new JdbcUtil();
        ApplicationContext context = creats.getContext();
        context = new ClassPathXmlApplicationContext("spring-common.xml");
        JdbcTemplate jt = (JdbcTemplate) context.getBean("jdbcTemplate");
        creats.createTable(jt, tbName, map, mapChina);

        Map<String, String> maps = new HashMap<String, String>();
        maps.put("flag", "1");
        return maps;

    }
}
