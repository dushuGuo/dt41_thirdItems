/**
 * Project Name:DataCockpit
 * File Name:ExcelBins.java
 * Package Name:cn.bdqn.datacockpit.entity
 * Date:2017年8月30日上午1:47:25
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.entity;

/**
 * Description: <br/>
 * Date: 2017年8月30日 上午1:47:25 <br/>
 * 
 * @author yuanX
 * @version
 * @see
 */
public class ExcelBins {
    private String binsId;

    private String ording;

    private String phone;

    private String message;

    private String money;

    public ExcelBins() {
    }

    public ExcelBins(String binsId, String ording, String phone, String message, String money) {
        super();
        this.binsId = binsId;
        this.ording = ording;
        this.phone = phone;
        this.message = message;
        this.money = money;
    }

    public String getBinsId() {
        return binsId;
    }

    public void setBinsId(String binsId) {
        this.binsId = binsId;
    }

    public String getOrding() {
        return ording;
    }

    public void setOrding(String ording) {
        this.ording = ording;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return binsId + "," + ording + "," + phone + "," + message + "," + money;
    }
}
