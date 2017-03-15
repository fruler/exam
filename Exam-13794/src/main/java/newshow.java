

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;


import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import java.sql.SQLException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.dao;
import dao.daoimpl;
import www.bean.Language;

/**
 * Servlet implementation class newshow
 */
public class newshow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newshow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();

		String title=request.getParameter("title");
		String description=request.getParameter("description");
		String name=request.getParameter("name");
		System.out.println(title+","+description+","+name);
		dao  dao=new daoimpl();
		ConnectionFactory c=ConnectionFactory.getinstance();
		int id=(int)(Math.random()*100+10);
		////System.out.println(cd.get(cd.getTimeInMillis()));
		//DateFormat f=new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		
		int film_id=(int)(Math.random()*1000+1001);
		
		try {
			//Date dt=f.parse("2017-11-16 12:02:20");
		//dt.
			//String time=f.format(dt);
			
			Connection con=c.getConnection();
			dao.insertnewshow(con, id,name);
			dao.insertnewshow1(con, film_id, title, description, id);
			con.close();
	}//String title
	

		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		catch(Exception e)
		{
			e.printStackTrace();
		}

		out.print("nihao");
	}
		


	}



