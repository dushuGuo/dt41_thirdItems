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
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcUtil {
    private static ApplicationContext context = null;

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
    public static int createTable(JdbcTemplate jt, String tableName, Map<String, Object> map,
            Map<String, Object> mapChina) {
        StringBuffer sb = new StringBuffer("");
        sb.append("CREATE TABLE `" + tableName + "` (");
        sb.append(" `id` int(11) NOT NULL AUTO_INCREMENT ,");
        Set<String> set = map.keySet();

        for (String key : set) {

            if (key.equals("shows")) {
                sb.append("`" + key + "` int(2) default " + map.get("shows") + ",");
            } else if (map.get(key).equals("1")) {
                sb.append("`" + key + "` varchar(255) COMMENT '" + mapChina.get(key) + "',");
            } else if (map.get(key).equals("3")) {
                sb.append("`" + key + "` float  COMMENT '" + mapChina.get(key) + "',");
            } else if (map.get(key).equals("2")) {
                sb.append("`" + key + "` int(10)  COMMENT '" + mapChina.get(key) + "',");
            } else if (map.get(key).equals("0")) {
                sb.append("`times` date ,");
            }
        }
        // sb.append(" `tbName` varchar(255) DEFAULT '',");
        sb.append(" PRIMARY KEY (`id`))");
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
