package com.niit.shoppingcart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Product;

@Controller
public class CartController {

	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private Cart cart;
	
	@Autowired
	private ProductDAO productDAO;
	private String userID;
	@RequestMapping(value = "/myCart", method = RequestMethod.GET)
	public String myCart(Model model,HttpSession session) {
		model.addAttribute("cart", new Cart());
		// get the logged-in user id
		String loggedInUsedid = (String) session.getAttribute("loggedInUserID");
		// get the cart details based on logged-in User id
		model.addAttribute("cartList", cartDAO.list(userID));
		model.addAttribute("totalAmount", cartDAO.getTotalAmount(userID));
		model.addAttribute("displayCart", "true");
		return "/home";
	}
	
	// For add and update cart both
	@RequestMapping(value = "/myCart/add/{id}", method = RequestMethod.GET)
	public String addToCart(@PathVariable("id") String id, HttpSession session) {
		//get the product based on product id
		Product product = productDAO.get(id);
		cart.setPrice(product.getPrice());
		cart.setProductName(product.getName());
		cart.setQuantity(1);
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");
		
		cart.setUserID(loggedInUserid);
		cart.setStatus('N');
		//Status is New.Once it is dispatched, we can
		// change to 'D'
		cartDAO.update(cart);
		// return "redirect:/view/home.jsp";
		return "home";
		
	}
	
	@RequestMapping("myCart/delete/{id}")
	public String removeCart(@PathVariable("id") String id, ModelMap model) throws Exception {
		try {
			cartDAO.delete(id);
			model.addAttribute("message", "Successfully removed");
		}
		catch(Exception e){
		model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		//redirectAttrs.addFlashAttribute(argo, arg1)
		return "redirect:/home";
		}
	
	@RequestMapping("myCart/edit/{id}")
	public String editCart(@PathVariable("id") String id, Model model, HttpSession session) {
	    System.out.println("editCart");	
	    model.addAttribute("cart", this.cartDAO.get(id));
	    String loggedInUserid = (String) session.getAttribute("loggedInUserID");
	    model.addAttribute("listCarts", this.cartDAO.list(loggedInUserid));
	return "cart";
	}
	
	
	
}
