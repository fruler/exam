package com.hand.ssm.dto;

public class Address {
 private int address_id;
 private String address;
public int getAddress_id() {
	return address_id;
}
public void setAddress_id(int address_id) {
	this.address_id = address_id;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public Address(int address_id, String address) {
	super();
	this.address_id = address_id;
	this.address = address;
}
public Address() {
	super();
	// TODO Auto-generated constructor stub
}
 
}
