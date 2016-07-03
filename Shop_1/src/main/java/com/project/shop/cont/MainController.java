package com.project.shop.cont;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.buyer.BuyerService;
import com.project.shop.buyer.Comment;
import com.project.shop.member.Member;
import com.project.shop.member.MemberService;
import com.project.shop.seller.Product;
import com.project.shop.seller.ProductService;

@Controller
public class MainController {
	@Resource(name="prodService")
	ProductService prod_service;

	public void setService(ProductService service) {
		this.prod_service = service;
	}
	@Resource(name="memService")
	MemberService mem_service;

	@Resource(name="buyerService")

	private BuyerService service;
	public void setService(BuyerService service) {
		this.service = service;
	}

 
	
	
	
	public void setService(MemberService service) {
		this.mem_service = service;
	}
	@RequestMapping(value="/")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView("/main/main2");
		mav.addObject("list", prod_service.selectProd());
		return mav;
	}
	@RequestMapping(value="/allProd.do")
	public ModelAndView main2(@RequestParam(value="pageNum", required=false) String pageNum2){
		if(pageNum2==null){
			pageNum2 = "1";
		} 
		int pageNum = Integer.parseInt(pageNum2);
		ModelAndView mav = new ModelAndView("/main/main");
		List<Product> lp = prod_service.selectProd();
		List<Product> mp = new ArrayList<Product>();
		int cnt = lp.size();
		int start = (pageNum-1)*12;
		int end = (pageNum*12);
		if(cnt<end && cnt>start) end=cnt;
		if(start>cnt) end=0;
		for(int i=start; i<end; i++){
				mp.add(lp.get(i));
		}
		System.out.println(mp.size());
		mav.addObject("cntPage", Math.ceil((double)cnt/12));
		mav.addObject("list", mp);
		return mav;
	}
	
	@RequestMapping(value="/test.do")
	public String test(){
		return "smarteditor/index";
	}

	@RequestMapping(value="/testadd.do")
	public void testadd(Product p){
		System.out.println(p.getProd_content()+":"+p.getId());
	}

	@RequestMapping(value="/view.do")

	public ModelAndView prod_view(@RequestParam(value = "num") int num){
		ModelAndView mav = new ModelAndView("/product/prodView");
		Product pro = prod_service.select(num);
		List<Comment> c = service.selectCmt(num);
		System.out.println(pro);
		System.out.println(c);
		mav.addObject("product", pro);
		mav.addObject("c",c);	//댓글
		return mav;

	}


	// 상품검색 (메인페이지)
	@RequestMapping(value = "/mainSearch.do")
	public ModelAndView mainSearch(@RequestParam(value="prod_name") String prod_name){
		System.out.println("inputKeyword:"+prod_name);
		ModelAndView mav = new ModelAndView("/main/main");
		ArrayList<Product> search_list = (ArrayList<Product>) prod_service.selectProdByName(prod_name);
		for(int i=0; i<search_list.size(); i++)
			System.out.println(search_list.get(i)); // 검색 결과 list
		mav.addObject("search_list", search_list);

		return mav;
	}


	// 상품가격순 sort(내림차순)
	@RequestMapping(value = "/sort.do")
	public ModelAndView prod_priceByupper(@RequestParam(value="pageNum") int pageNum,@RequestParam(value="type") int type){
		ModelAndView mav = new ModelAndView("/main/main");
		List<Product> lp = null;
		if (type==2) { // 페이지에서 높은가격순으로 정렬 선택시
			 lp = prod_service.selectUpperprod_price();	
		}else if(type==1) { //낮은 가격순으로 정렬선택
			 lp = prod_service.selectUpperprod_price();
			 Collections.reverse(lp); 
			}else if(type==3){
				mav = new ModelAndView("redirect:allProd.do?pageNum=1");
				return mav;
			}
		
			List<Product> mp = new ArrayList<Product>();

			int cnt = lp.size();
			int start = (pageNum-1)*12;
			int end = (pageNum*12);
			if(cnt<end && cnt>start) end=cnt;
			if(start>cnt) end=0;
			for(int i=start; i<end; i++){
				mp.add(lp.get(i));

			}

			System.out.println(mp.size());
			for (int i = 0; i < 10; i++) {
				System.out.println(mp.get(i));
			}
			mav.addObject("cntPage", Math.ceil((double)cnt/12));
			mav.addObject("list", mp);
		
		return mav;
	}


		@RequestMapping(value="/user/userAdd.do")
		public String userAdd(){
			return "member/joinForm";
		}	
		
	@RequestMapping(value="/joinPage.do")
	public String joinPage(){
		return "member/joinForm";
	}
	@RequestMapping(value="/login.do")
	public String login(@RequestParam(value="id") String id, @RequestParam(value="pw") String pw, HttpServletRequest req){
		System.out.println("id: "+id);
		System.out.println("pw: "+pw);
		HttpSession hs= req.getSession();
		hs.setAttribute("id", id);
		hs.setAttribute("type", mem_service.getMember(id).getType());
		System.out.println(req.getAttribute("javax.servlet.forward.request_uri"));
		System.out.println(req.getRequestURI());
		return "redirect:/";
	}

	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest req){
		HttpSession hs = req.getSession();
		hs.invalidate();
		return "redirect:/";
	}

	// 상품판매 갯수순 sort(내림차순)
	@RequestMapping(value = "/prod_sell_cntByupper.do")
	public ModelAndView prod_sell_cntByupper(){
		ModelAndView mav = new ModelAndView("/main/main");
		ArrayList<Product> list = (ArrayList<Product>) prod_service.selectUpperprod_sellcnt();
		for(int i=0; i<list.size(); i++)
			System.out.println(list.get(i)); // 검색 결과 list
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping(value="/idCheck.do")
	public ModelAndView idCheck(@RequestParam(value="id") String id){
		ModelAndView mav = new ModelAndView("/member/check");
		Member m = mem_service.getMember(id);
		boolean flag;
		if (m==null) {
			flag = true;
		}else{
			flag = false;
		}
		mav.addObject("flag", flag);
		return mav;
	}


	//회원가입 요청(DB반영)
	@RequestMapping(value="/join_submit.do")
	public String join_submit(Member m, HttpServletResponse resp){
		PrintWriter out = null;
		try {
			resp.setCharacterEncoding("UTF-8");
			mem_service.addMember(m);
			out = resp.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			out.write("<script type='text/javascript'>alert('Congratulation! Welcome to KITRI-Mall.');window.close();</script>");
		}

		return null;
	}

	// 회원수정 페이지 이동
	@RequestMapping(value="/editForm.do")
	public ModelAndView editForm(HttpSession session){
		ModelAndView mav = new ModelAndView("/member/editForm");
		Member m = mem_service.getMember(session.getAttribute("id").toString());
		mav.addObject("m",m);
		return mav;
	}
	@RequestMapping(value="/edit_submit.do")
	public ModelAndView edit_submit(HttpSession session,Member m){
		ModelAndView mav = new ModelAndView("/main/main");

		mem_service.editMember(m);

		return mav;
	}

}
