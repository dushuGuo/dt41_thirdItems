/**
 * Project Name:adminlte
 * File Name:Column.java
 * Package Name:cn.bdqn.lesson.datatable
 * Date:2017年8月22日上午8:52:05
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 */

package cn.bdqn.datacockpit.datatable;

/**
 * Description: <br/>
 * Date: 2017年8月22日 上午8:52:05 <br/>
 * 
 * @author junwen.bao@airintelli.com
 * @version
 * @see
 */
public class Column {
    private String data;

    private String name;

    private boolean searchable;

    private boolean orderable;

    private Search search = new Search();

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isSearchable() {
        return searchable;
    }

    public void setSearchable(boolean searchable) {
        this.searchable = searchable;
    }

    public boolean isOrderable() {
        return orderable;
    }

    public void setOrderable(boolean orderable) {
        this.orderable = orderable;
    }

    public Search getSearch() {
        return search;
    }

    public void setSearch(Search search) {
        this.search = search;
    }

    @Override
    public String toString() {
        return "Column [data=" + data + ", name=" + name + ", searchable=" + searchable + ", orderable=" + orderable
                + ", search=" + search.toString() + "]";
    }

}
