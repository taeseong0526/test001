package product;

public class pdDTO {
	private String pdcode;
	private String pdname;
	private int pdprice;
	private int stock;
	private String pdsize;
	
	public String getPdcode() {
		return pdcode;
	}
	public void setPdcode(String pdcode) {
		this.pdcode = pdcode;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPdsize() {
		return pdsize;
	}
	public void setPdsize(String pdsize) {
		this.pdsize = pdsize;
	}
    // 기본생성자
    public pdDTO() {
        // TODO Auto-generated constructor stub
    }
 
    // 매개변수가 있는 생성자
    public pdDTO(String pdcode, String pdname, int pdprice, int stock, String pdsize) {
        this.pdcode = pdcode;
        this.pdname = pdname;
        this.pdprice = pdprice;
        this.stock = stock;
        this.pdsize = pdsize;
    }

 
    @Override
    public String toString() {
        return "pdDTO [pdcode=" + pdcode + ", pdname=" + pdname + ", pdprice=" + pdprice + ", stock=" + stock + ", pdsize=" + pdsize
                + "]";
    }
	
}
