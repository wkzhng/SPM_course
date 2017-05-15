package com.buptsse.spm.domain;

import java.io.Serializable;

/**
 * @author BUPT-TC 
 * @date 2015年11月01日 下午2:34
 * @description	TeachingPlan表的信息记录
 * @modify BUPT-TC 
 * @modifyDate 
 */

public class TeachingPlan implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String pieceId;
	private String pieceName;
	private String chapterId;
	private String chapterName;	
	private String filePath;		

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPieceId() {
		return pieceId;
	}

	public void setPieceId(String pieceId) {
		this.pieceId = pieceId;
	}

	public String getPieceName() {
		return pieceName;
	}

	public void setPieceName(String pieceName) {
		this.pieceName = pieceName;
	}

	public String getChapterId() {
		return chapterId;
	}

	public void setChapterId(String chapterId) {
		this.chapterId = chapterId;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	

}
