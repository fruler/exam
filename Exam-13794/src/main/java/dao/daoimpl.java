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
			
	}

