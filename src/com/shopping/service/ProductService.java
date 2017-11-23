package com.shopping.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.beans.Category;
import com.shopping.beans.Product;
import com.shopping.db.DBConnection;

public class ProductService {

	private List<Product> products = null;
        private List<Product> searchResults = null;
	private List<Category> categories = null;
	private List<String> subCategories = null;
        private List<String> category = null;
	private String categoryName;

	// Method to get all products available
	public List<Product> getAllProducts() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select id,name,price,category from Movies";
		products = new ArrayList<Product>();

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"),
                                        rs.getString("name"),
                                        rs.getDouble("price"),
                                           rs.getString("category"));
				products.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
	

		}

		return products;

	}

	// Method to get the required Product Details
	public Product getProductDetails(int productId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		Product p = new Product();
		sql = "select id,name,price,details,category,image from Movies where id = " + productId;

		try {
			ps = conn.prepareStatement(sql);
//			ps.setInt(1, productId);
			rs = ps.executeQuery();
                        while(rs.next()) {
//                            System.out.println("Movie Name: " + rs.getString(1));
//                            System.out.println("Movie ID: " + rs.getString(2));
                            p.setId(rs.getInt(1));
                            p.setName(rs.getString(2));
                            p.setPrice(rs.getDouble(3));
                            p.setDetails(rs.getString(4));
                            p.setCategory(rs.getString(5));
                        }
//			while (rs.next()) {
//				p.setProductId(productId);
//				p.setProductName(rs.getString(1));
//				p.setProductPrice(rs.getDouble(2));
//				p.setDescription(rs.getString(3));
//				p.setCategory(rs.getString(4));
//				p.setSubCategory(rs.getString(5));
//				p.setProductManufacturer(rs.getString(6));
//			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}


		}
		return p;
	}

	// Method to get all the available Categories
	public List<String> getAllCategories() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select distinct category from Movies";
		category = new ArrayList<String>();

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				String p = (rs.getString("category"));
				category.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

	
		}
		return category;
	}

        
        public List<Product> getAllActionMovies(String categoryString) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select id,name,price,category from Movies where category = \"" + categoryString + "\"";
                System.out.println(sql);
		products = new ArrayList<Product>();

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"),
                                        rs.getString("name"),
                                        rs.getDouble("price"),
                                        rs.getString("category"));
				products.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
		}

		return products;
	}
        
        public List<Product> searchAllProducts(String cardID) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select id,name,price from Search where cardID = \"" + 1234 + "\"";
		searchResults = new ArrayList<Product>();

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product(rs.getInt("id"),
                                        rs.getString("name"),
                                        rs.getDouble("price"));
				searchResults.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
	

		}

		return products;

	}

	// Method to get all the available Subcategories under a Category
	public List<String> getSubCategory(Category category) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "SELECT productSubCategory FROM subcategory s where s.productCategory = ? ";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, category.getProductCategory());
			rs = ps.executeQuery();
			subCategories = new ArrayList<String>();
			while (rs.next()) {
				subCategories.add(rs.getString("productSubCategory"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return subCategories;
	}

	// Method to get all the Products based on specified SubCategory
	public List<Product> getProductBySubCategory(String subCategory) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select productID,productName,productPrice,productSummary,productCategory,productManufacturer from products where productSubCategory=?";
		products = new ArrayList<Product>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subCategory);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2),
						rs.getDouble(3));
				products.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return products;
	}

	// Method to get all the Products based on specified SubCategory
	public List<Product> getProductByCategory(String category) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select id,name,price from Movies where category = " + category;
		products = new ArrayList<Product>();
		try {
			ps = conn.prepareStatement(sql);
//			ps.setString(1, category);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2),
						rs.getDouble(3));
				products.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		}
		return products;
	}

	// Method to get Product Category
	// based on Sub Category
	public String getCategoryBySubCategory(String subCategory) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select productCategory from subcategory where productSubCategory=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subCategory);
			rs = ps.executeQuery();
			while (rs.next()) {
				categoryName = rs.getString("productCategory");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return categoryName;
	}
}
