/**
 * Project Name:adminlte
 * File Name:DatatableResult.java
 * Package Name:cn.bdqn.lesson.datatable
 * Date:2017年8月22日上午8:30:05
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 */

package cn.bdqn.datacockpit.datatable;

import cn.bdqn.datacockpit.result.BaseResult;

/**
 * Description: <br/>
 * Date: 2017年8月22日 上午8:30:05 <br/>
 * 
 * @author junwen.bao@airintelli.com
 * @version
 * @see
 */
public class DatatableResult<T> extends BaseResult<T> {
    private int draw;

    private int recordsTotal;

    private int recordsFiltered;

    private String error;

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
