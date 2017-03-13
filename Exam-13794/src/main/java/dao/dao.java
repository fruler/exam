package dao;

import java.sql.Connection;
import java.util.List;

import www.bean.Customer;
import www.bean.Film;
import www.bean.Language;


public interface dao {
	
     public List<Customer> selectCustomer(Connection con,String sql)throws Exception;
    public List<Film>selectAllFile(Connection con,String sql)throws Exception;
    public List<Language>selectname(Connection con,String sql)throws Exception;
}
