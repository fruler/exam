package com.hand.ssm.mapper;

import java.util.List;

import com.hand.ssm.dto.Address;
import com.hand.ssm.dto.Customer;
import com.hand.ssm.dto.Fenye;

public interface CustomerMapper {

	public int selectCountRow()throws Exception;
	public List<Customer>selectalluser(Fenye f) throws Exception;
	public List<Customer>selectuserinfo()throws Exception;
	public List<Address>selectaddress()throws Exception;
	public void fdelete(int id)throws Exception;
	public void finsert(Customer c)throws Exception;
	
	public void fupdate(Customer c)throws Exception;
}
