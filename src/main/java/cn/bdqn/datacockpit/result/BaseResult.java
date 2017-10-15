/**
 * Project Name:adminlte
 * File Name:BaseResult.java
 * Package Name:cn.bdqn.lesson.result
 * Date:2017年8月22日上午8:34:47
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 */

package cn.bdqn.datacockpit.result;

import java.util.ArrayList;
import java.util.List;

/**
 * Description: <br/>
 * Date: 2017年8月22日 上午8:34:47 <br/>
 * 
 * @author junwen.bao@airintelli.com
 * @version
 * @see
 */
public class BaseResult<T> {

    private List<T> data = new ArrayList<>();

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        if (data == null) {
            this.data.clear();
        } else {
            this.data = data;
        }
    }

    public void addData(T data) {
        this.data.add(data);
    }
}
