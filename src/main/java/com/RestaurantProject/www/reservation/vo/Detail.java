package com.RestaurantProject.www.reservation.vo;

/**
 * 리플 정보 VO
 */
public class Detail {
	int detailnum;				//리플번호
	int rvnum;				    //본문 글번호
	String id;					//작성자 ID
	String detail;				//리플내용
	String inputdate;			//작성날짜
	
	public Detail() {}
	public Detail(int detailnum, int rvnum, String id, String detail, String inputdate) {
		this.detailnum = detailnum;
		this.rvnum = rvnum;
		this.id = id;
		this.detail = detail;
		this.inputdate = inputdate;
	}
	public int getdetailnum() {
		return detailnum;
	}

	public void setdetailnum(int detailnum) {
		this.detailnum = detailnum;
	}

	public int getrvnum() {
		return rvnum;
	}

	public void setrvnum(int rvnum) {
		this.rvnum = rvnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getdetail() {
		return detail;
	}

	public void setdetail(String detail) {
		this.detail = detail;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "Detail [detailnum=" + detailnum + ", rvnum=" + rvnum + ", id=" + id + ", detail=" + detail
				+ ", inputdate=" + inputdate + "]";
	}
}
