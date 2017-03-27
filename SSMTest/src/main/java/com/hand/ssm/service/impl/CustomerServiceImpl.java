package com.hand.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.ssm.dto.Address;
import com.hand.ssm.dto.Customer;
import com.hand.ssm.dto.Fenye;
import com.hand.ssm.mapper.CustomerMapper;
import com.hand.ssm.service.CustomerService;
@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CustomerMapper customerMapper;

	
/* 我写的 */
	@Transactional
	public int selectCountRow() throws Exception {
		// TODO Auto-generated method stub
		return customerMapper.selectCountRow();
	}
	@Transactional
	public List<Customer> selectalluser(Fenye f) throws Exception {
		// TODO Auto-generated method stub
		return  customerMapper.selectalluser(f);
	}
	@Transactional
	public List<Customer> selectuserinfo() throws Exception {
		// TODO Auto-generated method stub
		return customerMapper.selectuserinfo();
	}
	public List<Address> selectaddress() throws Exception {
		// TODO Auto-generated method stub
		return customerMapper.selectaddress();
	}
	public void fdelete(int id) throws Exception {
	
		customerMapper.fdelete(id);
	}
	public void finsert(Customer c) throws Exception {
		
		customerMapper.finsert(c);
	}
	public void fupdate(Customer c) throws Exception {
		// TODO Auto-generated method stub
		customerMapper.fupdate(c);
	}
	
}
