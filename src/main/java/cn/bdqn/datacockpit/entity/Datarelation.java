package cn.bdqn.datacockpit.entity;

public class Datarelation {
    private Integer id;

    private String name;

    private Integer cid;
    
    private String cname;

    private Integer tid1;
    
    private String tid1name;

    private Integer tid2;
    
    private String tid2name;

    private Integer col1;
    
    private String col1name;

    private Integer col2;
    
    private String col2name;

    private Integer state;

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

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getTid1() {
        return tid1;
    }

    public void setTid1(Integer tid1) {
        this.tid1 = tid1;
    }

    public Integer getTid2() {
        return tid2;
    }

    public void setTid2(Integer tid2) {
        this.tid2 = tid2;
    }

    public Integer getCol1() {
        return col1;
    }

    public void setCol1(Integer col1) {
        this.col1 = col1;
    }

    public Integer getCol2() {
        return col2;
    }

    public void setCol2(Integer col2) {
        this.col2 = col2;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getTid1name() {
		return tid1name;
	}

	public void setTid1name(String tid1name) {
		this.tid1name = tid1name;
	}

	public String getTid2name() {
		return tid2name;
	}

	public void setTid2name(String tid2name) {
		this.tid2name = tid2name;
	}

	public String getCol1name() {
		return col1name;
	}

	public void setCol1name(String col1name) {
		this.col1name = col1name;
	}

	public String getCol2name() {
		return col2name;
	}

	public void setCol2name(String col2name) {
		this.col2name = col2name;
	}
    
}