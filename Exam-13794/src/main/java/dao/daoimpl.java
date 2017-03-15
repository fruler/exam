package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import www.bean.Customer;
import www.bean.Film;
import www.bean.Language;

import www.bean.NewShow;




public class daoimpl implements dao{
	private PreparedStatement ps;
	private Statement st;
	private ResultSet rs;
	
	public List<Customer> selectCustomer(Connection con, String sql) throws Exception {
		// 
		List<Customer> li=new ArrayList<Customer>();
	    st=con.createStatement();
	    rs=st.executeQuery(sql);
	    while(rs.next())
	    {
	    	Customer u=new Customer();
	    	u.setCustomer_id(rs.getInt(1));
	    	u.setStore_id(rs.getInt(2));
	      u.setFirst_name( rs.getString(3));
	      u.setLast_name(rs.getString(4));
	     u.setEmail(rs.getString(5));
	     u.setAddress_id(rs.getInt(6));
	     u.setActive(rs.getInt(7));
	      System.out.println(u);
	      li.add(u);
	    }
	    return li;
	}

	public List<Film> selectAllFile(Connection con, String sql) throws Exception {
		List<Film> li=new ArrayList<Film>();
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		  while(rs.next())
		    {
		    	Film u=new Film();
		    	u.setFile_id(rs.getInt(1));
		    	u.setTitle(rs.getString(2));
		    	u.setDescription(rs.getString(3));
		    	u.setName(rs.getString(4));

		    	System.out.println(u);

		      li.add(u);
		    }
		return li;
	}

	public List<Language> selectname(Connection con, String sql) throws Exception {
		// TODO Auto-generated method stub
		List<Language> li=new ArrayList<Language>();
	    st=con.createStatement();
	    rs=st.executeQuery(sql);
	    while(rs.next())
	    {
	    	Language u=new Language();
	    	u.setName(rs.getString(1));
	      System.out.println(u);
	      li.add(u);
	    }
	    return li;

	}

	public void insertnewshow(Connection con, int id,String name) throws Exception {
		String sql1="insert into language(language_id,name) values(?,?)";
		
		 ps=con.prepareStatement(sql1);
		 ps.setInt(1, id);
		 ps.setString(2, name);
		 ps.executeUpdate();
		
	}

	public void fdelete(Connection con, int id) throws Exception {
		//Å£±Æ£¡
		String sql="delete from film  where  film.film_id=?";
		  st=con.createStatement();
		  Statement st1=con.createStatement();
		  ps=con.prepareStatement(sql);
		  st.execute("SET FOREIGN_KEY_CHECKS=0");
		  ps.setInt(1,id);
		  ps.executeUpdate();
		  st1.execute("SET FOREIGN_KEY_CHECKS=1");
		 
	}

	

	public void insertnewshow1(Connection con, int film_id, String title, String description, int language_id)
			throws Exception {
		String sql="insert into film(film_id,title,description,language_id) values(?,?,?,?)";
		ps=con.prepareStatement(sql);
		ps.setInt(1,film_id);
		ps.setString(2, title);
		ps.setString(3, description);
		ps.setInt(4,language_id);
		ps.executeUpdate();

	}

	public void update(Connection con, int id, String title, String description) throws Exception {
		String sql="update film set title=?,description=? where film_id=?";
		//Å£±Æ£¡
				  st=con.createStatement();
				  Statement st1=con.createStatement();
				  ps=con.prepareStatement(sql);
				  st.execute("SET FOREIGN_KEY_CHECKS=0");
				  ps.setString(1, title);
				  ps.setString(2, description);
				  ps.setInt(3,id);
				  ps.executeUpdate();
				  st1.execute("SET FOREIGN_KEY_CHECKS=1");
				 
	}     
			
	}

