package cn.bdqn.datacockpit.mapper;

import java.util.List;

import cn.bdqn.datacockpit.entity.XsTable;

public interface XsTableMapper {
    int deleteByPrimaryKey(Long id);

    int insert(XsTable record);

    int insertSelective(XsTable record);

    List<XsTable> selectAll();

    XsTable selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(XsTable record);

    int updateByPrimaryKey(XsTable record);

    /**
     * 
     * Description: 查询表中多少字段<br/>
     *
     * @author huMZ
     * @param tableName
     * @return
     */
    int getTableList(String tableName);

    /**
     * 
     * Description: 查询表字段类型<br/>
     *
     * @author huMZ
     * @param tableName
     * @return
     */
    List<String> getColumnType(String tableName);

    /**
     * 
     * Description: 查询表字段名<br/>
     *
     * @author huMZ
     * @param tableName
     * @return
     */
    List<String> getColumnName(String tableName);
}