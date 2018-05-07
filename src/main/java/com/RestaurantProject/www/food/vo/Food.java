package com.RestaurantProject.www.food.vo;

public class Food {
	private int foodnum;
	private String fname;
	private int price;
	private int cost;
	private String cookingdate;
	private String foodtype;
	private int foodsales;
	private String originalfile;
	private String savedfile;
	
	public Food(){}
	public Food(int foodnum, String fname, int price, int cost, String cookingdate, String foodtype, int foodsales,
			String originalfile, String savedfile) {
		this.foodnum = foodnum;
		this.fname = fname;
		this.price = price;
		this.cost = cost;
		this.cookingdate = cookingdate;
		this.foodtype = foodtype;
		this.foodsales = foodsales;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
	}
	public int getFoodnum() {
		return foodnum;
	}
	public void setFoodnum(int foodnum) {
		this.foodnum = foodnum;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getCookingdate() {
		return cookingdate;
	}
	public void setCookingdate(String cookingdate) {
		this.cookingdate = cookingdate;
	}
	public String getFoodtype() {
		return foodtype;
	}
	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}
	public int getFoodsales() {
		return foodsales;
	}
	public void setFoodsales(int foodsales) {
		this.foodsales = foodsales;
	}
	public String getOriginalfile() {
		return originalfile;
	}
	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}
	public String getSavedfile() {
		return savedfile;
	}
	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}
	@Override
	public String toString() {
		return "Food [foodnum=" + foodnum + ", fname=" + fname + ", price=" + price + ", cost=" + cost
				+ ", cookingdate=" + cookingdate + ", foodtype=" + foodtype + ", foodsales=" + foodsales
				+ ", originalfile=" + originalfile + ", savedfile=" + savedfile + "]";
	}
	
	
}
