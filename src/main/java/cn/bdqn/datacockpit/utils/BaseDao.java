package cn.bdqn.datacockpit.utils;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.Statement;

/**
 * @ClassName BaseDao
 * @Description TODO(数据连接基本类)
 * @author wzciou
 * @Date 2017年7月13日 下午9:19:57
 * @version 2.0.0
 */
public class BaseDao {

    // 建立连接
    protected Connection conn = null;

    // 操作SQL的对象
    protected PreparedStatement ps = null;

    // 结果集
    ResultSet rs = null;

    /**
     * @Description (获取连接)
     * @return
     */
    public Connection getConnection() {
        try {
            // 通过连接池来获取连接对象
            conn = JdbcUtils_40.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * @Description (查询 sql--SQL语句 params参数列表)
     * @param sql
     * @param params
     * @return
     */
    public ResultSet executeQuery(String sql, Object... params) {
        // 获取连接
        this.getConnection();
        try {
            // 获取PreparedStatement对象，通过连接对象获取
            ps = conn.prepareStatement(sql);
            // 判断参数列表是否为空
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    // 设置占位符
                    ps.setObject(i + 1, params[i]);
                }
            }
            // 执行查询并返回结果集
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 返回结果集
        return rs;
    }

    /**
     * @Description (增加删除改)
     * @param sql
     * @param list2
     * @return
     */
    public int executeUpdate(String sql, List<String> list2) {
        // 影响行数
        int updateNum = 0;
        // 获取连接
        this.getConnection();

        try {
            // 获取PreparedStatement对象，通过conn
            ps = conn.prepareStatement(sql);
            // 判断参数列表是否为空
            if (list2 != null) {
                // 设置占位符
                // 重写拼接
                /*
                 * for (int i = 0; i < params.length; i++) { ps.setObject(i + 1,
                 * params[i]); }
                 */

                for (int i = 0; i < list2.size(); i++) {
                    ps.setObject(i + 1, list2.get(i));
                }

            }
            // 执行，增，删除，修改
            updateNum = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭连接
            this.closeConnection();
        }
        // 返回影响行数
        return updateNum;
    }

    /**
     * @Description (执行新增并返回自增主键，新增失败返回0)
     * @param sql
     * @param params
     * @return
     */
    public int executeInsertKey(String sql, Object... params) {
        // 影响行数
        int updateNum = 0;
        // 获取连接
        this.getConnection();
        try {
            // 获取PreparedStatement对象
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            // 判断参数列表是否为空
            if (params != null) {
                // 设置占位符
                for (int i = 0; i < params.length; i++) {
                    ps.setObject(i + 1, params[i]);
                }
            }
            // 执行，增，删除，修改
            updateNum = ps.executeUpdate();
            if (updateNum == 1) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭连接
            this.closeConnection();
        }
        // 返回影响行数
        return updateNum;
    }

    /**
     * @param <T>
     * @Description (查询 sql--SQL语句 params参数列表,要求表的字段与属性名一致,字段名可以有-和_,属性名不能有-和_)
     * @param clazz
     * @param sql
     * @param params
     * @return
     * @throws Exception
     */
    public <T> List<T> executeQueryObject(Class<T> clazz, String sql, Object... params) throws Exception {
        // 调用查询的方法得到rs
        this.executeQuery(sql, params);
        // 创建list用于返回
        List<T> list = new ArrayList<T>();
        // 获取实体类的属性
        Field[] fields = clazz.getDeclaredFields();
        // 获取数据库表信息
        ResultSetMetaData metaData = rs.getMetaData();
        // 遍历结果集
        while (rs.next()) {
            // 创建实体的实例
            T newInstance = clazz.newInstance();
            // 遍历实体的属性
            for (Field field : fields) {
                // 数据库表信息
                for (int i = 0; i < metaData.getColumnCount(); i++) {
                    // 对表中的字段名去-_,用于匹配实体的属性
                    String fieldName = metaData.getColumnName(i + 1).replaceAll("[-_]", "");
                    // 匹配字段名和属性名
                    if (fieldName.equalsIgnoreCase(field.getName().replaceAll("[-_]", ""))) {
                        // 获取字段的值
                        Object object = rs.getObject(metaData.getColumnName(i + 1));
                        if (object == null) {// 如果字段的值为空，则不进行后续操作
                            continue;
                        }
                        boolean flag = field.isAccessible();
                        field.setAccessible(true);
                        // 对属性赋值
                        field.set(newInstance, object);
                        field.setAccessible(flag);
                    }
                }
            }
            list.add(newInstance);
        }
        this.closeConnection();
        return list;
    }

    /**
     * @Description (查询 sql--SQL语句 params参数列表,得到的map中的key为段名去掉了-和_,并且全部为小写)
     * @param sql
     * @param params
     * @return
     * @throws Exception
     */
    public <T> List<Map<String, Object>> executeQueryMap(String sql, Object... params) throws Exception {
        // 调用查询的方法得到rs
        this.executeQuery(sql, params);
        // 创建list用于返回
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        // 获取数据库表信息
        ResultSetMetaData metaData = rs.getMetaData();
        // 遍历结果集
        while (rs.next()) {
            // 创建map集合用于保存行数据
            Map<String, Object> map = new HashMap<String, Object>();
            // 数据库表信息
            for (int i = 0; i < metaData.getColumnCount(); i++) {
                // 对表中的字体名去-_,用于匹配实体的属性
                String fieldName = metaData.getColumnName(i + 1).replaceAll("[-_]", "").toLowerCase();
                // 获取字段的值
                Object object = rs.getObject(metaData.getColumnName(i + 1));
                map.put(fieldName, object);
            }
            list.add(map);
        }
        this.closeConnection();
        return list;
    }

    /**
     * @Description (关闭连接)
     */
    public void closeConnection() {
        try {
            if (rs != null)
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (ps != null)
                ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 不用关闭Connection，此时Connection交给JdbcUtils来处理
    }

    /**
     * 
     * @param 查询表数据 ,传入table表名
     */
    public List<List<Object>> getExcel(String tableName) {
        // 通过传入的table名来查询表
        String sql = "SELECT * FROM " + tableName;
        ResultSet rs = new BaseDao().executeQuery(sql);
        List<List<Object>> list = new ArrayList<List<Object>>();
        try {
            // 取出每行数据
            int j = 0;
            while (rs.next()) {
                // 取出每行当中每一列的数据
                List l = new ArrayList<Object>();
                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    l.add(rs.getObject(i));
                }
                list.add(l);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Map<String, Object>> getTableList(String tableName) {
        String sql = "SELECT * FROM " + tableName;
        ResultSet rs = new BaseDao().executeQuery(sql);
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        try {
            ResultSetMetaData md = rs.getMetaData(); // 获得结果集结构信息,元数据
            int columnCount = md.getColumnCount(); // 获得列数
            while (rs.next()) {
                Map<String, Object> rowData = new HashMap<String, Object>();
                for (int i = 1; i <= columnCount; i++) {
                    rowData.put(md.getColumnName(i), rs.getObject(i));
                }
                list.add(rowData);
            }
        } catch (SQLException e) {

            e.printStackTrace();

        }
        return list;

    }

    /**
     * 
     * @param 查询表数据 ,传入-List<Object>(数据类型)-table表名
     */
    public void setExcel(List<String> list2, String tableName) {
        StringBuffer sql = new StringBuffer("INSERT INTO " + tableName + " VALUES(?");
        // 拼接占位符
        for (Object object : list2) {
            sql.append(",?");
        }
        sql.append(",?)");
        // 主键自增
        list2.add(0, null);
        // 数据是否存在（0存在，1删除）
        list2.add(list2.size(), "0");

        int executeUpdate = new BaseDao().executeUpdate(sql.toString(), list2);

        System.err.println(sql);

        System.err.println(executeUpdate);

    }

}
