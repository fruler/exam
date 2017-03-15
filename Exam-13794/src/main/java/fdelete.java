

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.dao;
import dao.daoimpl;
import net.sf.json.JSONArray;
import www.bean.Film;

/**
 * Servlet implementation class fdelete
 */
public class fdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fdelete() {
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
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		dao u=new daoimpl();
		String id=request.getParameter("id");
		int id1=Integer.parseInt(id);
		System.out.println(id);
		ConnectionFactory c=ConnectionFactory.getinstance();
		List<Film>  li=null;
	//	String sql1="delete from film  where  film.film_id="+id;
		String sql2="select film_id,title, description,name from film ,language where film.language_id=language.language_id";
		//String sql3="delete from  film_actor where film_id="+id;
		//String sql4="delete from film_category where film_id="+id;
		//String sql5="delete from inventory where film_id="+id;
		//String sql6="delete from rental";
		try {
			Connection con=c.getConnection();
			//u.fdelete2(con, sql3);
			//u.fdelete3(con,sql4);
			//u.fdelete4(con, sql5);
			u.fdelete(con, id1);
			li=u.selectAllFile(con, sql2);
			con.close();
	}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch blockP
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		JSONArray js=JSONArray.fromObject(li);
		out.print(js);
	}

}
