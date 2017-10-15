package cn.bdqn.datacockpit.mapper;

import java.util.List;

import cn.bdqn.datacockpit.entity.Analysistasks;

public interface AnalysistasksMapper {

	//增加分析任务，设置算法
	int insertAnalysistasks(Analysistasks analysistasks);
	
	//删除分析任务
	int deleteAnalysistasks(Integer id);
	
	//查询分析任务,多表查询，判断任务是否重复（关系和算法），查询显示
	List<Analysistasks> getAnalysistasks(Analysistasks analysistasks);
}
