package model;

import java.util.Date;

public class item {
	private String name;
	private String img;
	private double price;
	private double discount;
	Date date = new Date();

	public item(String name, String img, double price, double discount, Date date) {
		super();
		this.name = name;
		this.img = img;
		this.price = price;
		this.discount = discount;
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
