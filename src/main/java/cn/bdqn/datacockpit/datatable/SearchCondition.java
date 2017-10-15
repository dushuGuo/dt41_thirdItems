/**
 * Project Name:adminlte
 * File Name:SearchCondition.java
 * Package Name:cn.bdqn.lesson.datatable
 * Date:2017年8月22日上午8:51:36
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 */

package cn.bdqn.datacockpit.datatable;

import java.util.ArrayList;
import java.util.List;

/**
 * Description: <br/>
 * Date: 2017年8月22日 上午8:51:36 <br/>
 * 
 * @author junwen.bao@airintelli.com
 * @version
 * @see
 */
public class SearchCondition {
    private int draw;

    private List<Column> columns = new ArrayList<Column>();

    private List<Order> order = new ArrayList<Order>();

    private int start = 0;

    private int length = 10;

    private Search search = new Search();

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public List<Column> getColumns() {
        return columns;
    }

    public void setColumns(List<Column> columns) {
        this.columns = columns;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public Search getSearch() {
        return search;
    }

    public void setSearch(Search search) {
        this.search = search;
    }
}
