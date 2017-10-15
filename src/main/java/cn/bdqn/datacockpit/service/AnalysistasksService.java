/**
 * Project Name:DataCockpit
 * File Name:AnalysistasksService.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年8月25日上午11:39:55
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.bdqn.datacockpit.service;

import java.util.List;

import cn.bdqn.datacockpit.entity.Analysistasks;
import cn.bdqn.datacockpit.entity.Datarelation;

/**
 * Description:	   <br/>
 * Date:     2017年8月25日 上午11:39:55 <br/>
 * @author   caoS
 * @version  
 * @see 	 
 */
public interface AnalysistasksService {
    //增加分析任务，设置算法
    int insertAnalysistasks(Analysistasks analysistasks);
        
    //删除分析任务
    int deleteAnalysistasks(Integer id);
        
    //查询分析任务,多表查询，判断任务是否重复（关系和算法），查询显示
    List<Analysistasks> getAnalysistasks(Analysistasks analysistasks);

    Datarelation getDataTable(int parseInt);
}

