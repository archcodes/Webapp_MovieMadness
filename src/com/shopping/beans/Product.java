package com.shopping.beans;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private double price;
	private String details;
	private String category;

	public Product(int i, String productName, double productPrice,
			String description, String category) {
		super();
		this.id = i;
		this.name = productName;
		this.price = productPrice;
		this.details = description;
		this.category = category;
	}

	public Product() {
	}
        
        public Product(int productId, String productName, double productPrice) {
		super();
		this.id = productId;
		this.name = productName;
                this.price = productPrice;
	}
        
        public Product(int productId, String productName, double productPrice, String category) {
		super();
		this.id = productId;
		this.name = productName;
                this.price = productPrice;
                this.category = category;
	}
        
        public Product(String category) {
		super();
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
