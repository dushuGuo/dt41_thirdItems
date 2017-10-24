package cn.bdqn.datacockpit.entity;

import org.springframework.stereotype.Component;

@Component
public class Tablecolumninfo {
    private Integer id;

    private Integer tid;

    private String columnname;

    private String columntype;

    private String physicalcolumnname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getColumnname() {
        return columnname;
    }

    public void setColumnname(String columnname) {
        this.columnname = columnname;
    }

    public String getColumntype() {
        return columntype;
    }

    public void setColumntype(String columntype) {
        this.columntype = columntype;
    }

    public String getPhysicalcolumnname() {
        return physicalcolumnname;
    }

    public void setPhysicalcolumnname(String physicalcolumnname) {
        this.physicalcolumnname = physicalcolumnname;
    }
}