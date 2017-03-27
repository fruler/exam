package com.hand.ssm.dto;

public class Fenye {
  private int startpage;
  private int count;
public int getStartpage() {
	return startpage;
}
public void setStartpage(int startpage) {
	this.startpage = startpage;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public Fenye() {
	super();
	// TODO Auto-generated constructor stub
}
public Fenye(int startpage, int count) {
	super();
	this.startpage = startpage;
	this.count = count;
}
@Override
public String toString() {
	return "Fenye [startpage=" + startpage + ", count=" + count + "]";
}
  
}
