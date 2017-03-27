package com.hand.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hand.ssm.dto.Address;
import com.hand.ssm.dto.Customer;
import com.hand.ssm.dto.Fenye;
import com.hand.ssm.dto.Page;
import com.hand.ssm.service.CustomerService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class Fhandler {
	@Autowired
	private CustomerService udao;
	@RequestMapping("login")
	public ModelAndView login(ModelAndView mv,String username,String password,HttpServletRequest request) throws Exception{
		String str="";
		boolean flag=true;
		List<Customer>li=udao.selectuserinfo();
		for(Customer l:li)
		{
			if(username.equals(l.getFirst_name())&&password.equals(l.getFirst_name()))
			{
				request.getSession().setAttribute("username", l.getFirst_name());
				flag=false;
				str="loginsuccess";
				break;
			}
			
		}
		if(flag==true)
		{
			str="login";
			
		}
		mv.setViewName(str);
		return mv;
	}
	@RequestMapping("fselect")
	public void fselect2(HttpServletRequest request, HttpServletResponse response,HttpSession session,String thispage2) throws Exception{
		PrintWriter out=response.getWriter();
		int thispage=Integer.parseInt(thispage2);
		int rowperPage=10;
		Page p=new Page();
		//int thispage1=thispage+1;
		p.setThispage(thispage);
		p.setRowerPage(rowperPage);
		int countRow=udao.selectCountRow();
		p.setCountRow(countRow);  //
		int countPage=countRow/rowperPage==0 ? countRow/rowperPage : countRow/rowperPage+1;
		p.setCountPage(countPage);  
		int firstPage=1;
		p.setFirstPage(firstPage);//
		int lastPage=countPage;
		p.setLastPage(lastPage);//
		p.setPrePage(thispage==1 ? thispage : thispage-1);//
		p.setNextPage(thispage==countPage-1 ? thispage :thispage+1);//
		Fenye f=new Fenye((thispage-1)*rowperPage,rowperPage);
		List<Customer> li=udao.selectalluser(f);
		p.setLi(li);
		session.setAttribute("page", p);
		System.out.println(p);
		JSONObject l=JSONObject.fromObject(p);
				out.print(l);
		//response.sendRedirect("success1.jsp");
		//ModelAndView mv= new ModelAndView("success1");
		//return mv;
	}
	
	@RequestMapping("selectaddress")
	public void selectaddress(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 PrintWriter out=response.getWriter();
		 List<Address>li=udao.selectaddress();
		 JSONArray jsonarr=JSONArray.fromObject(li);
		 /*在address里面查出来address */
		out.print(jsonarr);
	}
	@RequestMapping("deleteuserinfo")
	public void deleteuserinfo(HttpServletRequest request,HttpServletResponse response,String id) throws Exception{
		System.out.println(id);
		int id1=Integer.parseInt(id);
		//先删后查
		udao.fdelete(id1);
	
			PrintWriter out=response.getWriter();
			int thispage=1;
			int rowperPage=10;
			Page p=new Page();
			//int thispage1=thispage+1;
			p.setThispage(thispage);
			p.setRowerPage(rowperPage);
			int countRow=udao.selectCountRow();
			p.setCountRow(countRow);  //
			int countPage=countRow/rowperPage==0 ? countRow/rowperPage : countRow/rowperPage+1;
			p.setCountPage(countPage);  
			int firstPage=1;
			p.setFirstPage(firstPage);//
			int lastPage=countPage;
			p.setLastPage(lastPage);//
			p.setPrePage(thispage==1 ? thispage : thispage-1);//
			p.setNextPage(thispage==countPage-1 ? thispage :thispage+1);//
			Fenye f=new Fenye((thispage-1)*rowperPage,rowperPage);
			List<Customer> li=udao.selectalluser(f);
			p.setLi(li);
			System.out.println(p);
			JSONObject l=JSONObject.fromObject(p);
					out.print(l);
	}
	@RequestMapping("exit")
	public void exit(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		   PrintWriter out =response.getWriter();
		   session.invalidate();
		   out.print("nihao");
	}
	/*@RequestMapping("exit1")
	public ModelAndView exit1(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		 
		   session.invalidate();
		   mv.setViewName("login");
		   return mv;
	}*/
	@RequestMapping("add")
	public String add(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,String firstname,String lastname,String address,String email) throws Exception{
		  Customer c=new Customer();
		  c.setFirst_name(firstname);
		  c.setLast_name(lastname);
		  c.setEmail(email);
		  int store_id=(int)(Math.random()*100);
		  int address_id=(int)(Math.random()*100+100);
		  c.setStore_id(store_id);
		  c.setAddress_id(address_id);
		  Date d=new Date();
		  c.setCreate_date(d);
		  udao.finsert(c);
		 /* mv.addObject("message","添加成功!");
		  mv.setViewName("login");*/
		return "loginsuccess";
	}
	/*@RequestMapping("bianji")
	public void bianji(String id,HttpServletResponse response ,HttpSession session) throws IOException{
		session.setAttribute("id", id);
	PrintWriter out=response.getWriter();
	out.print("niihao");
	}
	@RequestMapping("edit")
	public ModelAndView edit(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,String firstname,String lastname,String email,HttpSession session) throws Exception{
		  String id=session.getAttribute("id").toString();
		  int id1=Integer.parseInt(id);
		Customer c=new Customer();
		  c.setFirst_name(firstname);
		  c.setLast_name(lastname);
		  c.setEmail(email);
		c.setCustomer_id(id1);
		  udao.fupdate(c);
		  mv.addObject("message","编辑成功!");
		  mv.setViewName("success");
		return mv;
	}*/
	
	@RequestMapping("edit1")
	public void edit1(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,String firstname,String lastname,String email,HttpSession session,String id) throws Exception{
		 PrintWriter out=response.getWriter();
		  int id1=Integer.parseInt(id);
		Customer c=new Customer();
		  c.setFirst_name(firstname);
		  c.setLast_name(lastname);
		  c.setEmail(email);
		c.setCustomer_id(id1);
		  udao.fupdate(c);
		 /* mv.addObject("message","编辑成功!");
		  mv.setViewName("success");*/
		out.print("dd");
	}
}