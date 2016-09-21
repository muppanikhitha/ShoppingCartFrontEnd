package com.niit.shoppingcart;

import org.omg.CORBA.Request;
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
@RequestMapping("/manageCategories")
public class CategoryController {

	@Autowired
	private Category category;

	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	public String listCategory(Model model) {
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.list());
		return "category";
	}

	@RequestMapping(value = "/category/add", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") String id) {
		//check if the record exist with this id
		//if exist, display error message to the admin record already  exist
		//else save the record
		
		ModelAndView mv = new ModelAndView();
		if (categoryDAO.get(category.getId()) == null) {
			categoryDAO.save(category);
		} else {
			mv.addObject("errorMessage", "The record exist with this id"
					+ category.getId());
		}
		return "category";

	}

	@RequestMapping("/category/update/{id}")
	public String updateCategory(@ModelAttribute("category") Category category) {
		//check whether category exist with this id?
		//if exists, update the existing category
		//if doesnot exist display error message
		ModelAndView mv = new ModelAndView();

		if (categoryDAO.get(category.getId()) != null) {
			categoryDAO.update(category);
			mv.addObject("message", "successfully updated");
		} else {
			mv.addObject("ErrorMessage", "couldnot update the record");
		}
		return "category";
	}

	@RequestMapping("/category/remove/{id}")
	public ModelAndView deleteCategory(@PathVariable("id") String id)
			throws Exception {
		//if id exist in category delete it
		//else display error message
		boolean flag = categoryDAO.delete(category);
		ModelAndView mv = new ModelAndView("category");
		String msg = "The operation is successfully done";
		if (flag == false) {
			msg = "The operation  could not success";
		}
		mv.addObject("msg", msg);
		return mv;
	}
}
