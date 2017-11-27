package edu.blogs.common;

import java.util.List;

public class Page<T>{

	//前、后台默认的每页显示的内容
	public static final int ADMIN_ARTICLE_RECROD=15;
	public static final int FRONT_CATEGORY_RECROD=9;
	public static final int FRONT_ARTICLE_RECROD=9;
	
	private int totalPage;
	private int totalRecord;
	private int currentPage;
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}	
	
	public List<T> getResultList(int pageNo,List<T> list,int rows){
		if (pageNo * rows >= list.size()) {
			list = list.subList((pageNo - 1)
					* rows, list.size());
		} else
			list = list.subList((pageNo - 1)
					* rows, pageNo
					* rows);
		return list;
	}
}
