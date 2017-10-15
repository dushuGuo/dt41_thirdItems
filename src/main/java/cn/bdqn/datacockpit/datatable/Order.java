/**
 * Project Name:adminlte
 * File Name:Order.java
 * Package Name:cn.bdqn.lesson.datatable
 * Date:2017年8月22日上午8:52:13
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 */

package cn.bdqn.datacockpit.datatable;

/**
 * Description: <br/>
 * Date: 2017年8月22日 上午8:52:13 <br/>
 * 
 * @author junwen.bao@airintelli.com
 * @version
 * @see
 */
public class Order {
    private int column;

    private String dir;

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    @Override
    public String toString() {
        return "Order [column=" + column + ", dir=" + dir + "]";
    }
}
