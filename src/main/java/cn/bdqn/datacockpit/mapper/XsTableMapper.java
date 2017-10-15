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
    
    int getTableList(String tableName);
      

}