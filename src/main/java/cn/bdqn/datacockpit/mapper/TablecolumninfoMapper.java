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
     * 
     * @param tableName
     * @return
     */
    List<Tablecolumninfo> selectView(String tableName);

    /**
     * 
     * Description: 根据表id查询表字段<br/>
     *
     * @author huMZ
     * @param tid
     * @return
     */
    List<Tablecolumninfo> selectColumnName(Integer tid);

    /**
     * 
     * Description:根据表id查询表字段数据类型 <br/>
     *
     * @author huMZ
     * @param tid
     * @return
     */
    List<Tablecolumninfo> selectColumnType(Integer tid);

    /**
     * 
     * Description:根据表id查询表字段信息 <br/>
     *
     * @author huMZ
     * @param tid
     * @return
     */
    List<Tablecolumninfo> selectColumnInfo(Integer tid);
}