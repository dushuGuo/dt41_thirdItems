/**
 * Project Name:dt41_thirdItems
 * File Name:Xiaoshoushuju.java
 * Package Name:cn.bdqn.datacockpit.entity
 * Date:2017年10月20日下午3:07:56
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.entity;

/**
 * Description: <br/>
 * Date: 2017年10月20日 下午3:07:56 <br/>
 * 
 * @author luoMT
 * @version
 * @see
 */
/**
 * 
 * Description: <br/>
 * date: 2017年10月20日 下午3:14:38 <br/>
 *
 * @authorluoMT
 * @version 对应数据库中8Xiaoshoushuju表
 */
public class Xiaoshoushuju {
    @Override
    public String toString() {
        return "Xiaoshoushuju [id=" + id + ", xiangmumingcheng=" + xiangmumingcheng + ", suozaiquyu=" + suozaiquyu
                + ", daofangrenshu=" + daofangrenshu + ", times=" + times + ", tuidingrenshu=" + tuidingrenshu
                + ", renchourenshu=" + renchourenshu + ", shows=" + shows + "]";
    }

    private Integer id;

    private String xiangmumingcheng;

    private String suozaiquyu;

    private Integer daofangrenshu;

    private String times;

    private Integer tuidingrenshu;

    private Integer renchourenshu;

    private Integer shows;

    public Xiaoshoushuju() {

        super();
        // Auto-generated constructor stub

    }

    public Xiaoshoushuju(Integer id, String xiangmumingcheng, String suozaiquyu, Integer daofangrenshu, String times,
            Integer tuidingrenshu, Integer renchourenshu, Integer shows) {
        super();
        this.id = id;
        this.xiangmumingcheng = xiangmumingcheng;
        this.suozaiquyu = suozaiquyu;
        this.daofangrenshu = daofangrenshu;
        this.times = times;
        this.tuidingrenshu = tuidingrenshu;
        this.renchourenshu = renchourenshu;
        this.shows = shows;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXiangmumingcheng() {
        return xiangmumingcheng;
    }

    public void setXiangmumingcheng(String xiangmumingcheng) {
        this.xiangmumingcheng = xiangmumingcheng;
    }

    public String getSuozaiquyu() {
        return suozaiquyu;
    }

    public void setSuozaiquyu(String suozaiquyu) {
        this.suozaiquyu = suozaiquyu;
    }

    public Integer getDaofangrenshu() {
        return daofangrenshu;
    }

    public void setDaofangrenshu(Integer daofangrenshu) {
        this.daofangrenshu = daofangrenshu;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }

    public Integer getTuidingrenshu() {
        return tuidingrenshu;
    }

    public void setTuidingrenshu(Integer tuidingrenshu) {
        this.tuidingrenshu = tuidingrenshu;
    }

    public Integer getRenchourenshu() {
        return renchourenshu;
    }

    public void setRenchourenshu(Integer renchourenshu) {
        this.renchourenshu = renchourenshu;
    }

    public Integer getShows() {
        return shows;
    }

    public void setShows(Integer shows) {
        this.shows = shows;
    }
}
