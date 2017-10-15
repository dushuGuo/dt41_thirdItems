/**
 * Project Name:adminlte
 * File Name:Search.java
 * Package Name:cn.bdqn.lesson.datatable
 * Date:2017年8月22日上午8:52:20
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 */

package cn.bdqn.datacockpit.datatable;

/**
 * Description: <br/>
 * Date: 2017年8月22日 上午8:52:20 <br/>
 * 
 * @author junwen.bao@airintelli.com
 * @version
 * @see
 */
public class Search {
    private String value;

    private boolean regex;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isRegex() {
        return regex;
    }

    public void setRegex(boolean regex) {
        this.regex = regex;
    }

    @Override
    public String toString() {
        return "Search [value=" + value + ", regex=" + regex + "]";
    }

}
