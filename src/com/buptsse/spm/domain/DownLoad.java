package com.buptsse.spm.domain;

import java.io.Serializable;
/**
 * 
 * @author BUPT-TC 
 * @date 2015年11月6日 下午9:45:15
 * @description Download表的信息
 * @modify BUPT-TC
 * @modifyDate
 */
public class DownLoad implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private String statement;
	private String filePath;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
