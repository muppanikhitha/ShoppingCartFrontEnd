package com.niit.shoppingcart;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;





@Controller
public class ProductController {
	@Autowired(required=true)
	 private ProductDAO productDAO;
	
	@Autowired
	Category category;
	@Autowired
	Supplier supplier;
	@Autowired
	Product product;
	@Autowired(required=true)
	private CategoryDAO categoryDAO;
	@Autowired(required=true)
	private SupplierDAO supplierDAO;
	//private String Path="D:\\ \\img";
	@RequestMapping(value="/product",method=RequestMethod.GET)
	public String listProducts(Model model){
		model.addAttribute("product", product);
		model.addAttribute("category", category);
		model.addAttribute("supplier", supplier);
		model.addAttribute("productList",this.productDAO.list());
		model.addAttribute("categoryList",this.categoryDAO.list());
		model.addAttribute("supplierList",this.supplierDAO.list());
		return "Product";

	}
	@RequestMapping(value="product/add",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product/*@RequestParam("image")MultipartFile file*/){
/*                  Category category=categoryDAO.getByName(product.getCategory().getCat_name());
               Supplier supplier=supplierDAO.getByName(product.getSupplier().getSup_name());
                  product.setCategory(category);
               product.setSupplier(supplier);*/
     /*          product.setCategory_id(category.getCat_id());
               product.setSupplier_id(supplier.getSup_id());*/
              if (productDAO.get(product.getPro_id()) == null) {
       			productDAO.save(product);
       		} else {
       			
       				productDAO.update(product);
       		}
          //        FileUtil.upload(Path, file, product.getId()+".jpg");           
                  return "redirect:/manageProducts";
	}
	 	
	@RequestMapping("product/remove/{pro_id}")
	public String removeProduct(@PathVariable("pro_id") String id)
	{
		System.out.println("in delete method");
		Product product=productDAO.get(id);
		ModelAndView mv = new ModelAndView("category");
	
	boolean flag=	productDAO.delete(product);
		if(flag==true){
			System.out.println("i am in delete operation");
		}
		else{
			mv.addObject("ErrorMessage", "could not delete the record");
		}
		return "redirect:/manageProducts";
		
	}
	@RequestMapping("product/edit/{pro_id}")
	public String removeProduct(@PathVariable("pro_id") String id,Model model){
		System.out.println(id);
		product=productDAO.get(id);
		ModelAndView mv = new ModelAndView();

		if (productDAO.get(product.getPro_id()) != null) {
			productDAO.update(product);
			System.out.println("i am in update");
			//log.debug("Ending  of the method update");
		} else {
			mv.addObject("ErrorMessage", "couldnot update the record");
		}
		return "redirect:/product";

	}
	/*@RequestMapping("product/get/{pro_id}")
	public String getSelectedProduct(@PathVariable("pro_id") String id,Model model,
		  RedirectAttributes redirectAttributes){
		   redirectAttributes.addFlashAttribute("selectedProduct", productDAO.get(id));
			return "Product";
	}*/
	
/*	@RequestMapping(value="/backtoHome",method=RequestMethod.GET)
	  Public String backtoHome(@ModelAttribute("selectedProduct")
	      final Object selectedProduct,final Model model)
	  {
		model.addAttribute("selectedProduct", selectedProduct)
		return "/home";
	  }
	*/

}