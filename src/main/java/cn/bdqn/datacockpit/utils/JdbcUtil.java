/**
 * Project Name:DataCockpit
 * File Name:JdbcUtil.java
 * Package Name:cn.bdqn.datacockpit.utils
 * Date:2017年8月27日下午12:31:39
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.utils;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.bdqn.datacockpit.entity.Tablecolumninfo;

public class JdbcUtil {
    private static ApplicationContext context = new ClassPathXmlApplicationContext("spring-common.xml");

    private static ChineseToPinYin cPinYin = new ChineseToPinYin();

    public static ApplicationContext getContext() {
        return context;
    }

    public static void setContext(ApplicationContext context) {
        JdbcUtil.context = context;
    }

    public static int insertObject(String tableName, List<Map<String, Object>> contents) {
        int re = 0;
        try {
            JdbcTemplate jt = (JdbcTemplate) context.getBean("jdbcTemplate");
            // 如果有某表
            if (getAllTableName(jt, tableName)) {
                // 保存数据
                re = saveObj(jt, tableName, contents);
            } /*
               * else { Map<String, Object> map = new HashMap<String, Object>();
               * Set<String> sets = new HashSet<String>(); sets =
               * contents.get(0).keySet(); for (String string : sets) {
               * map.put(string, "1"); } re = createTable(jt, tableName, map);
               * // 保存数据 re = saveObj(jt, tableName, contents); }
               */
        } catch (Exception e) {
            e.printStackTrace();
        }
        return re;
    }

    /**
     * 
     * Description: 将excel表中数据存入相应数据表中<br/>
     *
     * @author huMZ
     * @param tableName
     * @param contents
     * @return
     */
    public static int insertIntoTable(String tableName, List<Map<String, Object>> excelList) {
        JdbcTemplate jt = (JdbcTemplate) context.getBean("jdbcTemplate");
        int result = 0;
        for (int i = 0; i < excelList.size(); i++) {
            Map<String, Object> map = excelList.get(i);
            String sql = "insert into " + tableName + " set ";
            Set<String> set = map.keySet();
            for (String key : set) {
                if (map.get(key) instanceof Double) {
                    sql += cPinYin.getPingYin(key) + "=" + map.get(key) + ",";
                } else {
                    sql += cPinYin.getPingYin(key) + "='" + map.get(key) + "',";
                }
            }
            sql = sql.substring(0, sql.lastIndexOf(","));
            result = jt.update(sql);
        }
        return result;
    }

    /**
     * 保存方法，注意这里传递的是实际的表的名称
     */

    public static int saveObj(JdbcTemplate jt, String tableName, List<Map<String, Object>> contents) {
        int re = 0;
        try {
            for (int i = 0; i < contents.size(); i++) {
                Map<String, Object> map = contents.get(i);
                String sql = " insert into " + tableName + " (";
                Set<String> set = map.keySet();
                for (String key : set) {
                    sql += (key + ",");
                }
                sql += " tbName ) ";
                sql += " values ( ";
                for (String key : set) {
                    if (map.get(key) instanceof Integer) {
                        sql += (map.get(key) + ",");
                    } else {

                        sql += ("'" + map.get(key) + "',");
                    }
                }
                sql += ("'" + tableName + "' ) ");
                re = jt.update(sql);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return re;
    }

    public static List<Map<String, Object>> selectObj(JdbcTemplate jt, String tableName) {
        List<Map<String, Object>> re = new ArrayList<Map<String, Object>>();
        try {
            String sql = " select * from " + tableName;
            re = jt.queryForList(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return re;
    }

    /**
     * 根据表名称创建一张表
     * 
     * @param tableName
     */
    public static int createTable(JdbcTemplate jt, String tableName, List<Tablecolumninfo> list) {
        StringBuffer sb = new StringBuffer("");
        sb.append("CREATE TABLE `" + tableName + "` (");
        sb.append(" `id` int(11) NOT NULL AUTO_INCREMENT ,");
        for (Tablecolumninfo tablecolumninfo : list) {
            if (tablecolumninfo.getColumntype().equals("VARCHAR")) {
                sb.append("`" + cPinYin.getPingYin(tablecolumninfo.getColumnname()) + "` VARCHAR(200) comment '"
                        + tablecolumninfo.getColumnname() + "',");
            }
            if (tablecolumninfo.getColumntype().equals("INTEGER")) {
                sb.append("`" + cPinYin.getPingYin(tablecolumninfo.getColumnname()) + "` INT comment '"
                        + tablecolumninfo.getColumnname() + "',");
            }
            if (tablecolumninfo.getColumntype().equals("FLOAT")) {
                sb.append("`" + cPinYin.getPingYin(tablecolumninfo.getColumnname()) + "` FLOAT comment '"
                        + tablecolumninfo.getColumnname() + "',");
            }
        }
        sb.append("`show` int, PRIMARY KEY (`id`))");
        try {
            jt.update(sb.toString());
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 查询数据库是否有某表
     * 
     * @param cnn
     * @param tableName
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static boolean getAllTableName(JdbcTemplate jt, String tableName) throws Exception {
        Connection conn = jt.getDataSource().getConnection();
        ResultSet tabs = null;
        try {
            DatabaseMetaData dbMetaData = conn.getMetaData();
            String[] types = { "TABLE" };
            tabs = dbMetaData.getTables(null, null, tableName, types);
            if (tabs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            tabs.close();
            conn.close();
        }
        return false;
    }

}
