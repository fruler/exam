package com.hand.ssm.dto;

import java.util.List;



public class Page {
	private int thispage;//当前页
	 private int rowerPage;//每一页有多少行数据
	 private int countRow; //总共多少行
	 private int countPage;//总共多少页
	 private int firstPage;//第一页
	 private int  lastPage;//最后一页
	 private int prePage;//上一页
	 private int nextPage;//下一页
	 private List<Customer> li;//当前页中的数据
public int getThispage() {
	return thispage;
}
public void setThispage(int thispage) {
	this.thispage = thispage;
}
public int getRowerPage() {
	return rowerPage;
}
public void setRowerPage(int rowerPage) {
	this.rowerPage = rowerPage;
}
public int getCountRow() {
	return countRow;
}
public void setCountRow(int countRow) {
	this.countRow = countRow;
}
public int getCountPage() {
	return countPage;
}
public void setCountPage(int countPage) {
	this.countPage = countPage;
}
public int getFirstPage() {
	return firstPage;
}
public void setFirstPage(int firstPage) {
	this.firstPage = firstPage;
}
public int getLastPage() {
	return lastPage;
}
public void setLastPage(int lastPage) {
	this.lastPage = lastPage;
}
public int getPrePage() {
	return prePage;
}
public void setPrePage(int prePage) {
	this.prePage = prePage;
}
public int getNextPage() {
	return nextPage;
}
public void setNextPage(int nextPage) {
	this.nextPage = nextPage;
}
public List<Customer> getLi() {
	return li;
}
public void setLi(List<Customer> li) {
	this.li = li;
}
@Override
public String toString() {
	return "Page [thispage=" + thispage + ", rowerPage=" + rowerPage + ", countRow=" + countRow + ", countPage="
			+ countPage + ", firstPage=" + firstPage + ", lastPage=" + lastPage + ", prePage=" + prePage + ", nextPage="
			+ nextPage + ", li=" + li + "]";
}
public Page(int thispage, int rowerPage, int countRow, int countPage, int firstPage, int lastPage, int prePage,
		int nextPage, List<Customer> li) {
	super();
	this.thispage = thispage;
	this.rowerPage = rowerPage;
	this.countRow = countRow;
	this.countPage = countPage;
	this.firstPage = firstPage;
	this.lastPage = lastPage;
	this.prePage = prePage;
	this.nextPage = nextPage;
	this.li = li;
}
public Page() {
	super();
	// TODO Auto-generated constructor stub
}
 
}
