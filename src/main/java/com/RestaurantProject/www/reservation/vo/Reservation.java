package com.RestaurantProject.www.reservation.vo;

public class Reservation {
	private int rvnum;
	private String subid;
	private String subname;
	private int subloyalty;
	private String aptime;
	private String selectfood;
	private int quantity;
	private int totalprice;
	
	public Reservation(){}

	public Reservation(int rvnum, String subid, String subname, int subloyalty, String aptime, String selectfood,
			int quantity, int totalprice) {
		super();
		this.rvnum = rvnum;
		this.subid = subid;
		this.subname = subname;
		this.subloyalty = subloyalty;
		this.aptime = aptime;
		this.selectfood = selectfood;
		this.quantity = quantity;
		this.totalprice = totalprice;
	}

	public int getRvnum() {
		return rvnum;
	}

	public void setRvnum(int rvnum) {
		this.rvnum = rvnum;
	}

	public String getSubid() {
		return subid;
	}

	public void setSubid(String subid) {
		this.subid = subid;
	}

	public String getSubname() {
		return subname;
	}

	public void setSubname(String subname) {
		this.subname = subname;
	}

	public int getSubloyalty() {
		return subloyalty;
	}

	public void setSubloyalty(int subloyalty) {
		this.subloyalty = subloyalty;
	}

	public String getAptime() {
		return aptime;
	}

	public void setAptime(String aptime) {
		this.aptime = aptime;
	}

	public String getSelectfood() {
		return selectfood;
	}

	public void setSelectfood(String selectfood) {
		this.selectfood = selectfood;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	@Override
	public String toString() {
		return "Reservation [rvnum=" + rvnum + ", subid=" + subid + ", subname=" + subname + ", subloyalty="
				+ subloyalty + ", aptime=" + aptime + ", selectfood=" + selectfood + ", quantity=" + quantity
				+ ", totalprice=" + totalprice + "]";
	}
	
	

}
