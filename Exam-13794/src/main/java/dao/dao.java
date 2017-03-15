package dao;

import java.sql.Connection;
import java.util.List;

import www.bean.Customer;
import www.bean.Film;
import www.bean.Language;

import www.bean.NewShow;



public interface dao {
	
     public List<Customer> selectCustomer(Connection con,String sql)throws Exception;
    public List<Film>selectAllFile(Connection con,String sql)throws Exception;
    public List<Language>selectname(Connection con,String sql)throws Exception;

    public void insertnewshow(Connection con,int id,String name)throws Exception;
    public void insertnewshow1(Connection con,int film_id,String title,String description,int language_id)throws Exception;
    public void fdelete(Connection con,int id)throws Exception;
    public void update(Connection con,int id,String title,String description)throws Exception;
 
}




