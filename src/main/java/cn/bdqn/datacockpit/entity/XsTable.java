package cn.bdqn.datacockpit.entity;

import java.util.Date;

public class XsTable {
    private Long id;

    private String name;

    private String area;

    private Date times;

    private Integer fNums;

    private Integer rNums;

    private Integer tNums;

    private Integer shows;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Date getTimes() {
        return times;
    }

    public void setTimes(Date times) {
        this.times = times;
    }

    public Integer getfNums() {
        return fNums;
    }

    public void setfNums(Integer fNums) {
        this.fNums = fNums;
    }

    public Integer getrNums() {
        return rNums;
    }

    public void setrNums(Integer rNums) {
        this.rNums = rNums;
    }

    public Integer gettNums() {
        return tNums;
    }

    public void settNums(Integer tNums) {
        this.tNums = tNums;
    }

    public Integer getShows() {
        return shows;
    }

    public void setShows(Integer shows) {
        this.shows = shows;
    }
}