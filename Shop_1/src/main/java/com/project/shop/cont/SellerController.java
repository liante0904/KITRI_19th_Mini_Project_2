package com.project.shop.cont;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.buyer.Buy;
import com.project.shop.seller.PhotoVo;
import com.project.shop.seller.Product;
import com.project.shop.seller.ProductService;

@Controller
public class SellerController {
	@Resource(name="prodService")
	ProductService service;

	public void setService(ProductService service) {
		this.service = service;
	}


	@RequestMapping(value = "seller/add.do")
	public String add(Product p, HttpServletRequest request) {
		String fileName = p.getFile1().getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("/")+"resources/photo_upload/";
		File f1 = new File(path+fileName);
		try {
			p.getFile1().transferTo(f1);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		p.setProd_image1(request.getContextPath()+"/resources/photo_upload/"+fileName);
		System.out.println(path+fileName);
		service.insertProd(p);
		return "redirect://";
	}


	@RequestMapping(value = "seller/addPage.do")
	public String gg(Product p) {				
		return "seller/addForm";
	}

	@RequestMapping(value = "seller/list.do")
	public ModelAndView list(HttpServletRequest req) {
		HttpSession session = null;
		session = req.getSession();
		ArrayList<Product> p = (ArrayList<Product>) service.selectProdById((String)session.getAttribute("id")); //�몄��!
		ModelAndView mav = new ModelAndView("seller/list");
		mav.addObject("p", p);
		return mav;

	}
	
	@RequestMapping(value="/fileup.do", method = {RequestMethod.GET, RequestMethod.POST}) //단일
	public String photoUpload(HttpServletRequest request, PhotoVo vo){
		System.out.println("들어옴");
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;              
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL="+request.getContextPath()+"/resources/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	
	@RequestMapping(value="/multiplePhotoUpload.do", method = {RequestMethod.GET, RequestMethod.POST}) //다중
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	    	System.out.println("들어옴");
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         System.out.println("들어옴1");
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         System.out.println("filename: "+filename);
	         System.out.println("filename_ext: "+filename_ext);
	         System.out.println("dftFilePath: "+dftFilePath);
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
	         System.out.println("filePath: "+filePath);
	         File file = new File(filePath);
	         System.out.println("들어옴3");
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+request.getContextPath()+"/resources/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	@RequestMapping(value = "seller/editok.do")
	public String editok(HttpServletRequest req, Product p) {
		HttpSession session = null;
		session = req.getSession();
		service.updateProd(p);
		return "redirect://seller/mylist.do";
	}
	
	@RequestMapping(value = "seller/delete.do")
	public String delete(HttpServletRequest req, @RequestParam(value = "prod_num") int prod_num) {
		HttpSession session = null;
		session = req.getSession();
		service.deleteProd(prod_num);
		return "redirect://seller/mylist.do";
	}
	
	@RequestMapping(value = "seller/slist.do")
	public ModelAndView slist(HttpServletRequest req) {
		HttpSession session = null;
		session = req.getSession();
		String id= (String)session.getAttribute("id");
		ArrayList<Product> p = (ArrayList<Product>) service.selectProdById(id);
		ModelAndView mav = new ModelAndView("seller/slist");
		mav.addObject("p", p);
		return mav;
	}
	
	@RequestMapping(value = "seller/sview.do")
	public ModelAndView sview(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id= (String)session.getAttribute("id");
		ArrayList<Product> p = (ArrayList<Product>) service.selectProdById(id);
		List<Buy> b = service.selectByPay(id);
		ModelAndView mav = new ModelAndView("seller/sview");
		System.out.println(b);
		mav.addObject("b", b);
		return mav;
	}

	
	@RequestMapping(value = "seller/cancle.do")
	public String deletebuy(HttpServletRequest req, @RequestParam(value = "buy_num") int buy_num) {
		HttpSession session = null;
		session = req.getSession();
		service.UpdateByPay(buy_num);
		
		//System.out.println("edit: "+p);
		return "redirect://seller/sview.do";
	}
	
	@RequestMapping(value = "seller/mylist.do")
	public ModelAndView listtoo(HttpServletRequest req) {
		HttpSession session = null;
		session = req.getSession();
		String id = (String) session.getAttribute("id");
		ArrayList<Product> p = (ArrayList<Product>) service.selectProdById(id);
		ModelAndView mav = new ModelAndView("seller/mylist");
		System.out.println(p);
		mav.addObject("p", p);
		return mav;
	}

}
