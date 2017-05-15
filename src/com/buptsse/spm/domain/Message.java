package com.buptsse.spm.domain;

import java.io.Serializable;
/**
 * 
 * @author BUPT-TC 
 * @date 2015年11月6日 下午9:45:15
 * @description Message表的信息
 * @modify BUPT-TC
 * @modifyDate
 */
public class Message implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String title;
	private String detail;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
