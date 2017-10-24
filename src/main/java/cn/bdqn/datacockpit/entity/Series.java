/**
 * Project Name:susu
 * File Name:Series.java
 * Package Name:com.java.pojo
 * Date:2017年10月19日下午3:41:30
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.entity;

import java.util.List;

/**
 * Description: <br/>
 * Date: 2017年10月19日 下午3:41:30 <br/>
 * 
 * @author luoMT
 * @version
 * @see
 */
public class Series {
    public String name;

    public String type;

    public List<Integer> data;

    public Series(String name, String type, List<Integer> data) {
        super();
        this.name = name;
        this.type = type;
        this.data = data;
    }

    public Series() {

        super();
        // Auto-generated constructor stub

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Integer> getData() {
        return data;
    }

    public void setData(List<Integer> data) {
        this.data = data;
    }

}
