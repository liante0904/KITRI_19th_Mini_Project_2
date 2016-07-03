package com.project.shop.cont;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.buyer.Buy;
import com.project.shop.buyer.BuyerService;
import com.project.shop.buyer.Cart;
import com.project.shop.buyer.Comment;
import com.project.shop.seller.Product;
import com.project.shop.seller.ProductService;

@Controller
public class BuyerController {
	private BuyerService service;
	private ProductService prodServcie;
	@Resource(name="buyerService")
	public void setService(BuyerService service) {
		this.service = service;
	}
	@Resource(name="prodService")
	public void setService(ProductService service) {
		this.prodServcie = service;
	}
	@RequestMapping(value = "/main.do")
	public String maindo(){
		return "/shop/main";

	}



	@RequestMapping(value = "/addcart.do")
	public String addcart(Cart c){
		service.AddCart(c);
		return "redirect:/cart.do";
	}


	@RequestMapping(value = "/buycart.do")
	public String buycart(Cart c){
		service.AddCart(c); //
		return "/shop/main";

	}

	@RequestMapping(value = "/modify.do")
	public String modify(){
		return "/member/modify";

	}

	@RequestMapping(value = "/deleteid.do")
	public String deleteid(HttpServletRequest req){
		//TODO
		//	service.DelMember(session.getAttribute("id"));
		return "/shop/main";

	}

	@RequestMapping(value="/cart.do")
	public ModelAndView cartPage(HttpServletRequest req){
		HttpSession hs = req.getSession();
		ModelAndView mav = new ModelAndView("buyer/cartView");
		String id = (String)hs.getAttribute("id");
		mav.addObject("list", service.selectCart(id));
		return mav;
	}
	@RequestMapping(value = "/delCart.do")
	public String Delcart(int[] cart_num){
		for(int i=0; i<cart_num.length; i++){
			service.DelProduct(cart_num[i]);
		}
		return "redirect:/cart.do";

	}
	
	//구매 결정후 금액결제 
		@RequestMapping(value = "/payBuy.do")
		public String payBuy(int buy_num){
			
			service.UpdateByPay(buy_num);
			
			return "redirect:orderList.do";
		}
	
		//결제후 결제취소 
				@RequestMapping(value = "/payCancel.do")
				public String payCancel(int buy_num){
					
					service.UpdateByPay2(buy_num);
					
					return "redirect:orderList.do";
				}
	//결제안된 주문 취소
	@RequestMapping(value = "/delBuy.do")
	public String delBuy(int buy_num){
		Buy b = service.selectBuyByNum(buy_num);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cnt", -b.getBuy_cnt());
		map.put("num", b.getProd_num());
		prodServcie.updateProdAsCnt(map);
		service.deleteBuy(buy_num);
		return "redirect:orderList.do";
		
	}
	//카트에서 구매 확정.
	@RequestMapping(value="/addBuy.do")
	public String addBuy(@RequestParam(value="cart_num") int[] cart_num, HttpServletRequest req){
		HttpSession hs = req.getSession();
		String id = (String)hs.getAttribute("id");
		List<Integer> li = new ArrayList<Integer>(); 
		System.out.println("1");
		for(int i=0; i<cart_num.length; i++){
			Cart c = service.selectCartByNum(cart_num[i]);
			Product p = prodServcie.select(c.getProd_num());

			if(p.getProd_cnt()-p.getProd_sellcnt()-c.getCart_cnt()>=0){	
				System.out.println("2");

				Buy b = new Buy();
				b.setId(id);
				b.setProd_num(c.getProd_num());
				b.setBuy_cnt(c.getCart_cnt());
				b.setBuy_pay(0); //미결제상태로 DB에 입력
				service.BuyProduct(b);
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("cnt", b.getBuy_cnt());
				map.put("num", b.getProd_num());
				prodServcie.updateProdAsCnt(map);
				service.DelProduct(cart_num[i]);
			} else{
				System.out.println("3");
				li.add(cart_num[i]);
			}
		}
		if(li.size()!=0){
			System.out.println("4");
			req.setAttribute("errorList", li);
			return "forward:cartError.do";
		}

		return "redirect:orderList.do";
	}

	@RequestMapping(value="/cartError.do")
	public ModelAndView cartPageError(HttpServletRequest req){
		HttpSession hs = req.getSession();
		ArrayList<Integer> li = null;
		if(req.getAttribute("errorList")!=null){
			li = (ArrayList<Integer>) req.getAttribute("errorList");
		}
		ModelAndView mav = new ModelAndView("buyer/cartView");
		String id = (String)hs.getAttribute("id");
		mav.addObject("list", service.selectCart(id));
		mav.addObject("flag", true);
		mav.addObject("error", li);
		return mav;
	}


	@RequestMapping(value = "/orderList.do")
	public ModelAndView orderlist(HttpServletRequest req){
		HttpSession hs = req.getSession();
		String id = (String)hs.getAttribute("id");
		ModelAndView mav = new ModelAndView("/buyer/orderList");
		ArrayList<Buy> list =  (ArrayList<Buy>) service.selectBuy(id); //����!
		for(int i=0; i<list.size(); i++)
			System.out.println(list.get(i));
		mav.addObject("list", list); //�ֹ����� list
		return mav;
	}

	@RequestMapping(value = "/writeCmt.do")
	public String writeCmt(Comment c,HttpServletRequest req){
		HttpSession hs = req.getSession();
		System.out.println("writeCMT.do"+hs.getAttribute("id").toString());
		
		c.setId(hs.getAttribute("id").toString());
		service.insertCmt(c);
		return "redirect:view.do?num="+c.getProd_num();
	}

	@RequestMapping(value = "/test1.do")
	public String test1(@RequestParam(value="cart_num") int cart_num, HttpServletRequest req){
		HttpSession hs = req.getSession();
		String id = (String)hs.getAttribute("id");
		Cart c = service.selectCartByNum(cart_num);
		hs.setAttribute("prod_name", c.getProd_name());
		
		return "test";
	}
	@RequestMapping(value = "/complete.do")
	public String complete(HttpServletRequest req){
		HttpSession hs = req.getSession();
		String id = (String)hs.getAttribute("id");
		
		return "complete";
	}


}
