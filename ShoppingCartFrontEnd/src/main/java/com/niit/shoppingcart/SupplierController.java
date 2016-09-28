package com.niit.shoppingcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.SupplierDAO;

import com.niit.shoppingcart.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;

	@RequestMapping(value = "/supplier", method = RequestMethod.GET)
	public String listSuppliers(Model model) {
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", supplierDAO.list());
		return "supplier";
	}

	@RequestMapping(value = "/supplier/add", method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier) {
		ModelAndView mv = new ModelAndView("/supplier");
		if (supplierDAO.get(supplier.getSupe_id()) == null) {
			supplierDAO.save(supplier);
		} else {
			supplierDAO.update(supplier);
		}
		return "redirect:/manageSuppliers";
	}

	@RequestMapping(value= "supplier/update/{supe_id}")
	public String updateCategory(@PathVariable("supe_id") String id ) {
		System.out.println("i am in updateCategory");
		//String id=supplier.getId();
		 supplier=supplierDAO.get(id);
			System.out.println(supplier.getSupe_id());
		ModelAndView mv = new ModelAndView();

		if (supplierDAO.get(supplier.getSupe_id()) != null) {
			supplierDAO.update(supplier);
			System.out.println("updated");
		} else {
			mv.addObject("ErrorMessage", "couldnot update the record");
		}
		return "redirect:/supplier";
	}


	@RequestMapping("/supplier/remove/{supe_id}")
	public String deletesupplier(@PathVariable("supe_id") String id) throws Exception {
		System.out.println("i am in deletesupplier");
		System.out.println(id);
		Supplier supplier = supplierDAO.get(id);
		ModelAndView mv = new ModelAndView();

		boolean flag = supplierDAO.delete(supplier);
		if (flag == true) {
			System.out.println("i am in delete operation");
		} else {
			mv.addObject("ErrorMessage", "could not delete the record");
		}
		return "redirect:/manageSuppliers";
	}
}