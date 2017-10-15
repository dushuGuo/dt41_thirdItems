package cn.bdqn.datacockpit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.Result;
import cn.bdqn.datacockpit.mapper.ResultMapper;
import cn.bdqn.datacockpit.service.ResultService;
@Service
public class ResultServicImpl implements ResultService {
	@Autowired
	private ResultMapper resultMapper;

	//增加任务结果
	public int insertResult(Result result) {
		
		return resultMapper.insertResult(result);
	}

	//修改任务结果
	public int updateResult(Result result) {
		
		return resultMapper.updateResult(result);
	}

	//查询任务结果
	public List<Result> getResult(int aid) {
		
		return resultMapper.getResult(aid);
	}

}
