/**
 * Project Name:dt41_thirdItems
 * File Name:XiaoshoubiaoController.java
 * Package Name:cn.bdqn.datacockpit.controller
 * Date:2017年10月20日下午3:44:26
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.datacockpit.entity.Echarts;
import cn.bdqn.datacockpit.entity.Series;
import cn.bdqn.datacockpit.entity.Xiaoshoushuju;
import cn.bdqn.datacockpit.service.XiaoshoushujuService;

/**
 * Description: <br/>
 * Date: 2017年10月20日 下午3:44:26 <br/>
 * 
 * @author luoMT
 * @version
 * @see
 */
@Controller
public class XiaoshoubiaoController {
    @Autowired
    private XiaoshoushujuService xService;

    @RequestMapping("/selectXiaoShouBiao")
    @ResponseBody
    public Echarts selectXiaoShouBiao(Integer shows, String begintime, String endtime, String times,
            Integer daofangrenshu) {

        // 用mapjihe 装需要查询的时间段数据
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("shows", shows);
        map.put("begintime", begintime);
        map.put("endtime", endtime);
        List<Xiaoshoushuju> lists = xService.selectXiaoShouBiao(map);
        // 将数据库的数据进行封装，再以对象的形式返回给页面
        List<String> category = new ArrayList<String>();
        List<Integer> index = new ArrayList<Integer>();
        List<Integer> index1 = new ArrayList<Integer>();
        List<Integer> index2 = new ArrayList<Integer>();
        String gettimes = null;
        Integer getDaofangrenshu = null;
        Integer tuidingrenshu = null;
        Integer renchourenshu = null;
        for (int i = 0; i < lists.size(); i++) {
            Xiaoshoushuju xSXiaoshoushuju = lists.get(i);
            gettimes = xSXiaoshoushuju.getTimes();
            getDaofangrenshu = xSXiaoshoushuju.getDaofangrenshu();

            category.add(gettimes);
            index.add(getDaofangrenshu);

        }
        List<String> legend = new ArrayList<String>(Arrays.asList(new String[] { "到访人数" }));// 数据分组
        List<Series> series = new ArrayList<Series>();
        series.add(new Series("到访人数", "line", index));
        Echarts data = new Echarts(legend, category, series);
        System.out.println("所有数据" + data);
        return data;
    }
}
