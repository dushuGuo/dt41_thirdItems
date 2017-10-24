/**
 * Project Name:susu
 * File Name:Echarts.java
 * Package Name:com.java.pojo
 * Date:2017年10月19日下午3:39:23
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.entity;

import java.util.ArrayList;
import java.util.List;

//import org.springframework.http.HttpStatus.Series;

/**
 * Description: <br/>
 * Date: 2017年10月19日 下午3:39:23 <br/>
 * 
 * @author luoMT
 * @version
 * @see
 */
public class Echarts {
    public List<String> legend = new ArrayList<String>();// 数据分组

    public Echarts() {

        super();
    }

    public List<String> category = new ArrayList<String>();// 横坐标

    public List<Series> series = new ArrayList<Series>();// 纵坐标

    public Echarts(List<String> legendList, List<String> categoryList, List<Series> seriesList) {
        super();
        this.legend = legendList;
        this.category = categoryList;
        this.series = seriesList;
    }

    public List<String> getLegend() {
        return legend;
    }

    public void setLegend(List<String> legend) {
        this.legend = legend;
    }

    public List<String> getCategory() {
        return category;
    }

    public void setCategory(List<String> category) {
        this.category = category;
    }

    public List<Series> getSeries() {
        return series;
    }

    public void setSeries(List<Series> series) {
        this.series = series;
    }

}
