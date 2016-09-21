package com.niit.shoppingcart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;

@Controller
public class CategoryController {
	private static Logger log=LoggerFactory.getLogger(CategoryController .class);
	@Autowired
private	CategoryDAO categoryDAO;
	@Autowired
	private	Category category;
	@RequestMapping(value="/categories",method=RequestMethod.GET)
	public String listCategories(Model model){
		log.debug("Starting of the method listCategories");
		model.addAttribute("category",category);
		model.addAttribute("categoryList",categoryDAO.list());
		log.debug("End of the method listCategories");
		return "category";
	}
	@RequestMapping(value="/category/add",method=RequestMethod.POST)
	public String addCategory(@ModelAttribute("category")Category category){
	log.debug("Starting of the method addCategory");
	categoryDAO.save(category);
	
	log.debug("Ending of the method addCategory");
	return "category";
	}
	@RequestMapping("category/remove/{id}")
	public ModelAndView deleteCategory(@PathVariable("id")Category id) throws Exception{
	boolean flag=categoryDAO.delete(id);
	ModelAndView mv=new ModelAndView( "category");
	String message="Successfully done the operation";
	if(flag!=true)
	{
		message="The operation could not success";
	}
	mv.addObject("message", message);
	return mv;
	}
	
	@RequestMapping("category/edit/{id}")
	public ModelAndView editCategory(@ModelAttribute("category")Category category) {
		ModelAndView mv=new ModelAndView();
		if(categoryDAO.get(category.getId())!=null)
		{
			categoryDAO.update(category);
			mv.addObject("messge","Successfuly updated");
		}
		else{
			mv.addObject("errormessage","Could update the record");
		}
		return mv;
		
	}
	
	
	
	
	
	
	
	
	
	
	

}
