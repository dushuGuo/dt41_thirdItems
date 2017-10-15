package cn.bdqn.datacockpit.entity;
/**
 * 分析任务
 * @author Administrator
 *
 */
public class Analysistasks {

	private Integer id;

    private Integer cid;

    private Integer did;
    
    private Integer arithmeticid;

    private String rule;

    private Datarelation datarelation;
    
	public Datarelation getDatarelation() {
		return datarelation;
	}

	public void setDatarelation(Datarelation datarelation) {
		this.datarelation = datarelation;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public Integer getArithmeticid() {
		return arithmeticid;
	}

	public void setArithmeticid(Integer arithmeticid) {
		this.arithmeticid = arithmeticid;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	@Override
	public String toString() {
		return "Analysistasks [id=" + id + ", cid=" + cid + ", did=" + did
				+ ", arithmeticid=" + arithmeticid + ", rule=" + rule
				+ ", datarelation=" + datarelation + "]";
	}
    
    

}
