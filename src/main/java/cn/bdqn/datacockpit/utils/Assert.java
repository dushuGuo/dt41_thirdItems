/**
 * Project Name:auction_room
 * File Name:Assert.java
 * Package Name:cskj.java.utils
 * Date:2017年8月15日下午4:07:24
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.utils;

/**
 * Description: <br/>
 * Date: 2017年8月15日 下午4:07:24 <br/>
 * 
 * @author zhangJZ
 * @version
 * @see
 */
public class Assert {

    public static void isTrue(boolean exp, String message) throws Exception {
        if (!exp) {
            throw new Exception(message);// 当exp不为真时给出错误信息，存在异常中
        }
    }

    public static void isFalse(boolean exp, String message) throws Exception {
        if (exp) {
            throw new Exception(message);// 当exp为真时给出错误信息，存在异常中
        }
    }
}
