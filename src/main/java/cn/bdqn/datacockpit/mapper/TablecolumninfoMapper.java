package cn.bdqn.datacockpit.mapper;

import java.util.List;

import cn.bdqn.datacockpit.entity.Tablecolumninfo;

public interface TablecolumninfoMapper {
    List<Tablecolumninfo> selectAllTablecolumninfo();
    
    int deleteByPrimaryKey(Integer id);

    int insert(Tablecolumninfo record);

    int insertSelective(Tablecolumninfo record);

    Tablecolumninfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tablecolumninfo record);

    int updateByPrimaryKey(Tablecolumninfo record);
    
    /**
     * 增加方法
     * @param tableName
     * @return
     */
    List<Tablecolumninfo> selectView(String tableName);
}