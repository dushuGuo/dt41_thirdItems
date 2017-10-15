package cn.bdqn.datacockpit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.Analysistasks;
import cn.bdqn.datacockpit.entity.Datarelation;
import cn.bdqn.datacockpit.mapper.AnalysistasksMapper;
import cn.bdqn.datacockpit.mapper.DatarelationMapper;
import cn.bdqn.datacockpit.service.AnalysistasksService;

@Service
public class AnalysistasksServiceImpl implements AnalysistasksService {
	@Autowired
	private AnalysistasksMapper analysistasksMapper;

	@Autowired
	private DatarelationMapper datarelationMapper;

	// 增加分析任务，设置算法
	public int insertAnalysistasks(Analysistasks analysistasks) {

		return analysistasksMapper.insertAnalysistasks(analysistasks);
	}

	// 删除分析任务
	public int deleteAnalysistasks(Integer id) {

		return analysistasksMapper.deleteAnalysistasks(id);
	}

	// 查询分析任务,多表查询，判断任务是否重复（关系和算法），查询显示
	public List<Analysistasks> getAnalysistasks(Analysistasks analysistasks) {
		List<Analysistasks> analysistasksList = analysistasksMapper.getAnalysistasks(analysistasks);
		return analysistasksList;
	}

	public Datarelation getDataTable(int parseInt) {
		Analysistasks analysistasks = new Analysistasks();
		analysistasks.setId(parseInt);
		List<Analysistasks> analysistasks2 = analysistasksMapper.getAnalysistasks(analysistasks);
		Datarelation selectByPrimaryKey = datarelationMapper.selectByPrimaryKey(analysistasks2.get(0).getDid());
		return selectByPrimaryKey;
	}

}
