package pe.gob.munisjl.java.bean;

public class Chart2 {
	private String mes;
	private int fut;
	private int expediente;
	


	
	public Chart2(String mes, int fut, int expe) {
		super();
		this.mes = mes;
		this.fut = fut;
		this.expediente = expe;
	}
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}

	public int getFut() {
		return fut;
	}
	public void setFut(int fut) {
		this.fut = fut;
	}
	public int getExpe() {
		return expediente;
	}
	public void setExpe(int expe) {
		this.expediente = expe;
	}
	
	
	
}
