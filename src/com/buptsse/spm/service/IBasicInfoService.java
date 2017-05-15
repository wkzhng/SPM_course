package com.buptsse.spm.service;

import java.util.List;

import com.buptsse.spm.domain.BasicInfo;
import com.buptsse.spm.domain.BasicInfo;

/**
 * 
 * @author BUPT-TC 
 * @date 2015年11月6日 下午10:11:53
 * @description 基本信息service接口定义
 * @modify BUPT-TC 
 * @modifyDate
 */
public interface IBasicInfoService {
	//public BasicInfo enterBasicinfo(String name);
	public BasicInfo findBasicInfoById(String id);
	public BasicInfo findBasicInfoByName(String name);
	public boolean insertBasicInfo(BasicInfo basicInfo);
	public List<BasicInfo> findAllBasicInfo();
	public boolean deleteBasicInfo(String id);
	public boolean saveOrUpdate(BasicInfo basicInfo);	
}
