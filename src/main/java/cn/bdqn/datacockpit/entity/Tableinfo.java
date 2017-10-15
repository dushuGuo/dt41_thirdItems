package cn.bdqn.datacockpit.entity;


public class Tableinfo {
    private Integer id;

    private String name;

    private String updatetime;

    private String physicaltablename;

    private Integer cid;

    private Integer state;

    private String showtype;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getPhysicaltablename() {
        return physicaltablename;
    }

    public void setPhysicaltablename(String physicaltablename) {
        this.physicaltablename = physicaltablename;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getShowtype() {
        return showtype;
    }

    public void setShowtype(String showtype) {
        this.showtype = showtype;
    }

    @Override
    public String toString() {
        return "Tableinfo [id=" + id + ", name=" + name + ", updatetime=" + updatetime + ", physicaltablename="
                + physicaltablename + ", cid=" + cid + ", state=" + state + ", showtype=" + showtype + "]";
    }

}