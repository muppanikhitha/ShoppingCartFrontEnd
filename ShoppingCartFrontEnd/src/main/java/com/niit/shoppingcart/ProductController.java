package com.niit.shoppingcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;

@Controller
public class ProductController {
	@Autowired(required=true)
	 private ProductDAO productDAO;
	@Autowired(required=true)
	private CategoryDAO categoryDAO;
	@Autowired(required=true)
	private SupplierDAO supplierDAO;
	
	
	
	
	
	
	
	
	
	
	
	
	

}
