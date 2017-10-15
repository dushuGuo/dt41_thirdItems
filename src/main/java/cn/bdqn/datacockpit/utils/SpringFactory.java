/**
 * Project Name:DataCockpit
 * File Name:SpringFactory.java
 * Package Name:cn.bdqn.datacockpit.utils
 * Date:2017年8月27日下午12:47:32
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Description: <br/>
 * Date: 2017年8月27日 下午12:47:32 <br/>
 * 
 * @author yuanX
 * @version
 * @see
 */
public class SpringFactory implements ApplicationContextAware {
    private static ApplicationContext context;

    @SuppressWarnings("static-access")
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.context = applicationContext;
    }

    public static Object getObject(String id) {
        Object object = null;
        object = context.getBean(id);
        return object;
    }
}
